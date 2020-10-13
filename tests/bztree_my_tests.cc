#include <random>

#include "../bztree.h"
#include "util/performance_test.h"
#include <sys/time.h>

#include "flags.h"
#include "utils.h"

#define TEST_POOL_NAME "/mnt/pmem0/baotong/pool_bztree"
#define TEST_LAYOUT_NAME "layout_bztree"

#define KEY_TYPE double
#define PAYLOAD_TYPE uint64_t

struct timeval tv1, tv2, tv3;

int main(int argc, char* argv[]){
    bztree::BzTree *tree;
    pmwcas::InitLibrary(pmwcas::PMDKAllocator::Create(TEST_POOL_NAME, TEST_LAYOUT_NAME, 10UL * 1024 * 1024 * 1024),
                        pmwcas::PMDKAllocator::Destroy,
                        pmwcas::LinuxEnvironment::Create,
                        pmwcas::LinuxEnvironment::Destroy);

    auto pmdk_allocator = reinterpret_cast<pmwcas::PMDKAllocator *>(pmwcas::Allocator::Get());
    bztree::Allocator::Init(pmdk_allocator);

    auto bztree = reinterpret_cast<bztree::BzTree *>(pmdk_allocator->GetRoot(sizeof(bztree::BzTree)));
    pmwcas::DescriptorPool *pool = nullptr;
    pmdk_allocator->Allocate((void **) &pool, sizeof(pmwcas::DescriptorPool));

    new(pool) pmwcas::DescriptorPool(100000, 1, false);
    bztree::BzTree::ParameterSet param(3072, 0, 4096);
    new(bztree)bztree::BzTree(param, pool);
    pmdk_allocator->PersistPtr(bztree, sizeof(bztree::BzTree));
    pmdk_allocator->PersistPtr(pool, sizeof(pmwcas::DescriptorPool));

    tree = bztree;

    // Parse the flags
    auto flags = parse_flags(argc, argv);
    std::string keys_file_path = get_required(flags, "keys_file");
    std::string keys_file_type = get_required(flags, "keys_file_type");
    auto init_num_keys = stoi(get_required(flags, "init_num_keys"));
    auto init_insert_keys = stoi(get_required(flags, "init_insert_keys"));
    auto total_num_keys = stoi(get_required(flags, "total_num_keys"));
    auto batch_size = stoi(get_required(flags, "batch_size"));
    auto insert_frac = stod(get_with_default(flags, "insert_frac", "0.5"));
    std::string lookup_distribution =
        get_with_default(flags, "lookup_distribution", "zipf");
    auto time_limit = stod(get_with_default(flags, "time_limit", "1"));
    bool using_time_out = get_boolean_flag(flags, "using_time_out");
    bool print_batch_stats = get_boolean_flag(flags, "print_batch_stats");

    // Read keys from file
    auto keys = new KEY_TYPE[total_num_keys];
    if (keys_file_type == "binary") {
        load_binary_data(keys, total_num_keys, keys_file_path);
    } else if (keys_file_type == "text") {
        load_text_data(keys, total_num_keys, keys_file_path);
    } else {
        std::cerr << "--keys_file_type must be either 'binary' or 'text'"
                << std::endl;
        return 1;
    }

    static const uint32_t kMaxKey = 20000;
    for (int i = 0; i < kMaxKey; ++i) {
        std::string key = std::to_string(i);
        auto rc = bztree->Insert(key.c_str(), key.length(), i + 2000);
        std::cout << "Debug insert key " << i << std::endl;
    }

    // Combine bulk loaded keys with randomly generated payloads
    auto values = new std::pair<KEY_TYPE, uint64_t>[init_num_keys];
    std::mt19937_64 gen_payload(std::random_device{}());
    for (int i = 0; i < init_num_keys; i++) {
        values[i].first = keys[i];
        values[i].second = static_cast<PAYLOAD_TYPE>(gen_payload());
    }

    std::sort(values, values + init_num_keys,
            [](auto const& a, auto const& b) { return a.first < b.first; });
    std::cout << "Start the bulk load" << std::endl;
    for(int i = 0; i < init_num_keys; i++){
        printf("insert key %.10f\n", values[i].first);
        std::string key = std::to_string(values[i].first);
        auto rc = bztree->Insert(key.c_str(), key.length(), values[i].second);
        if(!rc.IsOk()){
            printf("Non successful insertion in bulk load\n");
            exit(-1);
        }
    }
    std::cout << "End the bulk load" << std::endl;

    int i = init_num_keys;
    int num_pre_insertition = i + init_insert_keys;

    // Insert keys into index
    std::cout << "Start the pre-insertion" << std::endl;
    for (; i < num_pre_insertition; i++) {
        std::string key = std::to_string(values[i].first);
        auto rc = bztree->Insert(key.c_str(), key.length(), static_cast<PAYLOAD_TYPE>(gen_payload()));
        if(!rc.IsOk()){
            printf("Non successful insertion in bulk load\n");
            exit(-1);
        }
    }
    std::cout << "End the pre-insertition" << std::endl;

  // Run workload
  long long cumulative_inserts = 0;
  long long cumulative_lookups = 0;
  int num_inserts_per_batch = static_cast<int>(batch_size * insert_frac);
  int num_lookups_per_batch = batch_size - num_inserts_per_batch;
  double cumulative_insert_time = 0;
  double cumulative_lookup_time = 0;

  auto workload_start_time = std::chrono::high_resolution_clock::now();
  int batch_no = 0;
  PAYLOAD_TYPE sum = 0;
  std::cout << std::scientific;
  std::cout << std::setprecision(3);
  
  int not_found = 0;
  while (true) {
    batch_no++;

    // Do lookups
    KEY_TYPE* lookup_keys = nullptr;
    //BT Only conduct the search operation for the initial num keys
    if (lookup_distribution == "uniform") {
      lookup_keys = get_search_keys(keys, i, num_lookups_per_batch);
    } else if (lookup_distribution == "zipf") {
      lookup_keys = get_search_keys_zipf(keys, i, num_lookups_per_batch);
    } else {
      std::cerr << "--lookup_distribution must be either 'uniform' or 'zipf'"
                << std::endl;
      return 1;
    }
    auto lookups_start_time = std::chrono::high_resolution_clock::now();
    for (int j = 0; j < num_lookups_per_batch; j++) {
      KEY_TYPE org_key = lookup_keys[j];
      std::string key = std::to_string(org_key);
      uint64_t payload = 0;
      auto rc = bztree->Read(key.c_str(), key.length(), &payload);
      sum += payload;
    }
    auto lookups_end_time = std::chrono::high_resolution_clock::now();
    double batch_lookup_time =
        std::chrono::duration_cast<std::chrono::nanoseconds>(lookups_end_time -
                                                             lookups_start_time)
            .count();
    cumulative_lookup_time += batch_lookup_time;
    cumulative_lookups += num_lookups_per_batch;
    delete[] lookup_keys;

    // Do inserts
    int num_actual_inserts =
        std::min(num_inserts_per_batch, total_num_keys - i);
    int num_keys_after_batch = i + num_actual_inserts;
    auto inserts_start_time = std::chrono::high_resolution_clock::now();
    for (; i < num_keys_after_batch; i++) {
      KEY_TYPE org_key = keys[i];
      std::string key = std::to_string(org_key);
      auto rc = bztree->Insert(key.c_str(), key.length(), static_cast<PAYLOAD_TYPE>(gen_payload()));
      if(!rc.IsOk()){
        printf("Non successful insertion in bulk load\n");
        exit(-1);
      }
    }
    auto inserts_end_time = std::chrono::high_resolution_clock::now();
    double batch_insert_time =
        std::chrono::duration_cast<std::chrono::nanoseconds>(inserts_end_time -
                                                             inserts_start_time)
            .count();
    cumulative_insert_time += batch_insert_time;
    cumulative_inserts += num_actual_inserts;

    if (print_batch_stats) {
      int num_batch_operations = num_lookups_per_batch + num_actual_inserts;
      double batch_time = batch_lookup_time + batch_insert_time;
      long long cumulative_operations = cumulative_lookups + cumulative_inserts;
      double cumulative_time = cumulative_lookup_time + cumulative_insert_time;
      std::cout << "Batch " << batch_no
                << ", cumulative ops: " << cumulative_operations
                << "\n\tbatch throughput:\t"
                << num_lookups_per_batch / batch_lookup_time * 1e9
                << " lookups/sec,\t"
                << num_actual_inserts / batch_insert_time * 1e9
                << " inserts/sec,\t" << num_batch_operations / batch_time * 1e9
                << " ops/sec"
                << "\n\tcumulative throughput:\t"
                << cumulative_lookups / cumulative_lookup_time * 1e9
                << " lookups/sec,\t"
                << cumulative_inserts / cumulative_insert_time * 1e9
                << " inserts/sec,\t"
                << cumulative_operations / cumulative_time * 1e9 << " ops/sec"
                << std::endl;
    }

    // Check for workload end conditions
    if (num_actual_inserts < num_inserts_per_batch) {
      // End if we have inserted all keys in a workload with inserts
        std::cout << "End the insert/search since all keys has been inserted" << std::endl;
        break;
    }
    double workload_elapsed_time =
        std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::high_resolution_clock::now() - workload_start_time)
            .count();
    if ((workload_elapsed_time > time_limit * 1e9 * 60) && using_time_out) {
      std::cout << "End the insert/search since the time out is touched" << std::endl;
      break;
    }
  }

  long long cumulative_operations = cumulative_lookups + cumulative_inserts;
  double cumulative_time = cumulative_lookup_time + cumulative_insert_time;
  std::cout << "Cumulative stats: " << batch_no << " batches, "
            << cumulative_operations << " ops (" << cumulative_lookups
            << " lookups, " << cumulative_inserts << " inserts)"
            << "\n\tcumulative throughput:\t"
            << cumulative_lookups / cumulative_lookup_time * 1e9
            << " lookups/sec,\t"
            << cumulative_inserts / cumulative_insert_time * 1e9
            << " inserts/sec,\t"
            << cumulative_operations / cumulative_time * 1e9 << " ops/sec"
            << std::endl;

  delete[] keys;
  delete[] values;
    return 0;
}
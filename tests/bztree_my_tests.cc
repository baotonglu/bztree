#include <random>

#include "../bztree.h"
#include "util/performance_test.h"
#include <sys/time.h>

#define TEST_POOL_NAME "pool_bztree"
#define TEST_LAYOUT_NAME "layout_bztree"

struct timeval tv1, tv2, tv3;

int main(){
    bztree::BzTree *tree;
    pmwcas::InitLibrary(pmwcas::PMDKAllocator::Create(TEST_POOL_NAME, TEST_LAYOUT_NAME, 10 * 1024 * 1024 * 1024),
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

    static const uint64_t kMaxKey = 50000000;

    gettimeofday(&tv1, NULL);
    for (uint64_t i = 1; i < kMaxKey; ++i) {
        std::string key = std::to_string(i);
        auto rc = bztree->Insert(key.c_str(), key.length(), i + 2000);
        ASSERT_TRUE(rc.IsOk());
    }
    gettimeofday(&tv2, NULL);

    double duration = (double)(tv2.tv_usec - tv1.tv_usec) / 1000000 +
                   (double)(tv2.tv_sec - tv1.tv_sec);
    printf(
      "Time = %f s, throughput = %f ops/s\n",
      duration, kMaxKey / duration);
    return 0;
}
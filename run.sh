#!/bin/bash

rm -rf /mnt/pmem0/baotong/pool_bztree

numactl --cpunodebind=0 --membind=0 ./Release/bztree_my_tests \
    --keys_file=longitudes-200M.bin.data \
            --keys_file_type=binary \
                --init_num_keys=5000000 \
                    --init_insert_keys=00000000 \
                        --total_num_keys=10000000 \
                            --batch_size=10000000 \
                                --insert_frac=1 \
                                    --lookup_distribution=uniform \
                                        --print_batch_stats

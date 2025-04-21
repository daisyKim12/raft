#!/bin/bash
#SBATCH --job-name=raft
#SBATCH --partition=a6000
#SBATCH --gres=gpu:1

python -m raft_ann_bench.run --dataset glove-100-inner --algorithms raft_cagra --build

python -m raft_ann_bench.run --dataset glove-100-inner --algorithms raft_cagra --search --batch-size 100 -k 10
python -m raft_ann_bench.data_export --dataset glove-100-inner
python -m raft_ann_bench.run --dataset glove-100-inner --algorithms raft_cagra --search --batch-size 1000 -k 10
python -m raft_ann_bench.data_export --dataset glove-100-inner
python -m raft_ann_bench.run --dataset glove-100-inner --algorithms raft_cagra --search --batch-size 10000 -k 10
python -m raft_ann_bench.data_export --dataset glove-100-inner

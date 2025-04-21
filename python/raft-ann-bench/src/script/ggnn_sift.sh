#!/bin/bash
#SBATCH --job-name=ggnn
#SBATCH --partition=a6000
#SBATCH --gres=gpu:1

python -m raft_ann_bench.run --dataset sift-128-euclidean --algorithms ggnn --build

python -m raft_ann_bench.run --dataset sift-128-euclidean --algorithms ggnn --search --batch-size 100 -k 10
python -m raft_ann_bench.data_export --dataset sift-128-euclidean
python -m raft_ann_bench.run --dataset sift-128-euclidean --algorithms ggnn --search --batch-size 1000 -k 10
python -m raft_ann_bench.data_export --dataset sift-128-euclidean
python -m raft_ann_bench.run --dataset sift-128-euclidean --algorithms ggnn --search --batch-size 10000 -k 10
python -m raft_ann_bench.data_export --dataset sift-128-euclidean

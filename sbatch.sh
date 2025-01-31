#!/usr/bin/bash

#SBATCH -J Ex4DGS-coffee_martini_sparse-lite
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=8
#SBATCH --mem-per-gpu=20G
#SBATCH -p batch_eebme_ugrad
#SBATCH -t 3-0
#SBATCH -o logs/slurm-%A.outs

cat $0
pwd
which python
hostname

. /data/sw/spack/share/spack/setup-env.sh
spack find
spack load cuda@11.3.0
nvcc -V

location='/data/csj000714/data/dynamic/neural-3d-video-synthesis'
# coffee_martini cook_spinach cut_roasted_beef flame_salmon_1_split flame_steak sear_steak
# coffee_martini_sparse cook_spinach_sparse
dataset='coffee_martini_sparse'
size='lite'

# conda activate colmapenv
chmod 755 ./scripts/preprocess_all_n3v.sh
sed -i -e 's/\r$//' ./scripts/preprocess_all_n3v.sh
./scripts/preprocess_all_n3v.sh /data/khlee01/data/dynamic/neural-3d-video-synthesis


exit 0
CUDA_VISIBLE_DEVICES=2 \
python ./main.py \
          -data /home/dhlee/datasets/imagenet/ \
          --data-backend pytorch \
          -a resnet50_DBC_share \
          -j 16 \
          -b 256 \
          --momentum 0.875 \
          --lr 0.256 \
          --wd 3.0517578125e-05 \
          --label-smoothing 0.1 \
          --lr-schedule cosine \
          --amp \
          --static-loss-scale 256 \
          --print-freq 1000 \
          --seed 77 \
          --memory-format nhwc \
          --epochs 20 \
          --tb mac_1_nuc_0.01_lam_0.5_adap_2 \
          --alpha_mac 1 \
          --alpha_nuc 0.01 \
          --alpha_lam 0.5 \
          --adaptive_num 2 \

#          --augmentation autoaugment \
#          --workspace ./checkpoints/ \
#          --checkpoint-filename ./checkpoints/checkpoint_0003.pth.tar \
#          --resume ./checkpoints/checkpoint.pth.tar \



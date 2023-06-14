# Training speed
* dataset : ImageNet (train : 1,281,167장 val : 50,000장)

## Effects of mixed precision and memory format
* GPU : Tesla V100-DGXS-32GB x 4
* mixed precision : FP16

|  model   | batch size | mixed precision | memory format | latency per epoch(min) |
|:--------:|:----------:|:---------------:|:-------------:|:----------------------:|
| resnet50 |    256     |                 |     NCHW      |          57.5          |
| resnet50 |    256     |                 |     NHWC      |          67.5          |
| resnet50 |    256     |  $\checkmark$   |     NCHW      |          27.5          |
| resnet50 |    256     |  $\checkmark$   |     NHWC      |          22.5          |

## Effects of DBC, adaptive loss and DDP
* GPU : Tesla V100-DGXS-32GB x 4
* mixed precision
* memory_format = NHWC

|       model        | batch size |   mac_loss   |   nuc_loss   | DDP(GPUs) | latency per epoch(min) |
|:------------------:|:----------:|:------------:|:------------:|:---------:|:----------------------:|
|      resnet50      |    256     |              |              |     1     |          22.5          |
|      resnet50      |    256     |              |              |     4     |          28.3          |
| resnet50_DBC_share |    256     | $\checkmark$ |              |     1     |          46.6          |
| resnet50_DBC_share |    256     | $\checkmark$ |              |     4     |          48.3          |
| resnet50_DBC_share |    256     | $\checkmark$ | $\checkmark$ |     1     |         155.8          |
| resnet50_DBC_share |    256     | $\checkmark$ | $\checkmark$ |     4     |         156.6          |

# hyperparameter search
* dataset : ImageNet (train : 1,281,167장 val : 50,000장)

## alpha_mac search
| target ratio | alpha_mac | prune epoch | finetune epoch | Target MACs epoch | Final MACs ratio | MACs | MACs ratio | Best Acc |
|:------------:|:---------:|:-----------:|:--------------:|:-----------------:|:----------------:|:----:|:----------:|:--------:|
|     0.3      |     5     |     90      |       -        |                   |                  |      |            |          |
|     0.3      |     1     |     90      |       -        |                   |                  |      |            |          |
|     0.3      |    0.1    |     90      |       -        |                   |                  |      |            |          |
|     0.3      |   0.01    |     90      |       -        |                   |                  |      |            |          |
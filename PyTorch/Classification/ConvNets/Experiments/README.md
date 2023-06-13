# Training speed

|       model        | batch size |   mac_loss   |   nuc_loss   | DDP(GPUs) | latency per epoch |
|:------------------:|:----------:|:------------:|:------------:|:---------:|:-----------------:|
|      resnet50      |    256     |              |              |     1     |                   |
|      resnet50      |    256     |              |              |     4     |                   |
| resnet50_DBC_share |    256     | $\checkmark$ |              |     1     |                   |
| resnet50_DBC_share |    256     | $\checkmark$ |              |     4     |                   |
| resnet50_DBC_share |    256     | $\checkmark$ | $\checkmark$ |     1     |                   |
| resnet50_DBC_share |    256     | $\checkmark$ | $\checkmark$ |     4     |                   |
CUDA_VISIBLE_DEVICES=0 python train.py \
    --train_dir="../model/lstmmem1024_deep_combine_chain_length" \
    --train_data_pattern="/Youtube-8M/data/frame/train/train*" \
    --frame_features=True \
    --feature_names="rgb,audio" \
    --feature_sizes="1024,128" \
    --model=LstmMemoryModel \
    --video_level_classifier_model=DeepCombineChainModel \
    --moe_num_mixtures=4 \
    --deep_chain_relu_cells=256 \
    --deep_chain_layers=1 \
    --deep_chain_use_length=True \
    --label_loss=MultiTaskCrossEntropyLoss \
    --multitask=True \
    --support_type="label" \
    --num_supports=4716 \
    --support_loss_percent=0.05 \
    --keep_checkpoint_every_n_hour=1.0 \
    --base_learning_rate=0.0005 \
    --num_readers=8 \
    --num_epochs=5 \
    --rnn_swap_memory=True \
    --batch_size=128 


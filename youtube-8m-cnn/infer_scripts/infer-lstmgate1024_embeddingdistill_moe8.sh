
#for part in ensemble_train ensemble_validate test; do 
for part in ensemble_validate; do 
    CUDA_VISIBLE_DEVICES=0 python inference_with_rebuild.py \
	      --output_dir="/home/zhangt/yt8m/model_predictions/${part}/lstmgate_embeddingdistill_cell1024_layer1_moe8" \
              --model_checkpoint_path="/home/zhangt/yt8m/frame_level_lstm_gatesmooth_model/model.ckpt-112573" \
	      --input_data_pattern="/Youtube-8M/data/frame/${part}/*.tfrecord" \
	      --frame_features=True \
	      --feature_names="rgb,audio" \
	      --feature_sizes="1024,128" \
              --model=LstmGateModel \
              --video_level_classifier_model=MoeModel \
              --moe_num_extend=4 \
              --moe_method=None \
              --lstm_cells=1024 \
              --moe_num_mixtures=8 \
              --train=False \
	      --batch_size=32 \
	      --file_size=4096
done

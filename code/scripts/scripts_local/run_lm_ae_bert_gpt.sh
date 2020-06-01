
export TRAIN_FILE=../data/datasets/idea/train.txt
export TEST_FILE=../data/datasets/idea/valid.txt

export GPT2Model_PATH=/d/models/gpt2-essays
export XLNetModel_PATH=/d/models/xlnet/chinese_xlnet_base_pytorch
export BERTModel_PATH=/d/models/bert/chinese_wwm_ext_pytorch

export GPU_ID=0,1,2,3,4,5,6,7

CUDA_VISIBLE_DEVICES=$GPU_ID python examples/big_ae/run_lm_ae_pretraining.py \
    --output_dir=../output/local_lmae_wiki2_bert_gpt \
    --encoder_model_type=bert \
    --encoder_model_name_or_path=$BERTModel_PATH \
    --decoder_model_type=xlnet \
    --decoder_model_name_or_path=$XLNetModel_PATH \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --num_train_epochs 1.0 \
    --save_steps 200 \
    --logging_steps 100 \
    --overwrite_output_dir \
    --block_size 128 \
    --per_gpu_train_batch_size=3
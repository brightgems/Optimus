export PYTHONPATH="${PYTHONPATH}:/workspace/code"
export GPU_ID=0,1


export GPT2Model_PATH=/pretrain-models/gpt2-cn/gpt2-essay
export BERTModel_PATH=/pretrain-models/bert/bert_torch_base_cn

export TRAIN_FILE=/code/notebook/idea-gen/text_corpus/train.txt
export TEST_FILE=/code/notebook/idea-gen/text_corpus/valid.txt


CUDA_VISIBLE_DEVICES=$GPU_ID python examples/big_ae/run_lm_vae_training.py \
    --dataset sgnews \
    --output_dir=../output/local_lm_vae_sgnews_bert_gpt \
    --encoder_model_type=bert \
    --encoder_model_name_or_path=$BERTModel_PATH \
    --decoder_model_type=gpt2 \
    --decoder_model_name_or_path=$GPT2Model_PATH \
    --train_data_file=$TRAIN_FILE \
    --do_train \
    --do_eval \
    --beta 1.0 \
    --ratio_zero .5 \
    --ratio_increase 0.25 \
    --eval_data_file=$TEST_FILE \
    --num_train_epochs 5.0 \
    --save_steps 2000 \
    --logging_steps 100 \
    --overwrite_output_dir \
    --per_gpu_train_batch_size 8 \
    --fp16 \
    --block_size 128

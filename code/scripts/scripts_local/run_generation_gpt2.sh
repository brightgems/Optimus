
export GPT2_MODEL_DIR=/d/models/gpt2-essays

python ./examples/run_generation.py \
    --model_type=gpt2 \
    --length=20 \
    --model_name_or_path=$GPT2_MODEL_DIR \
    --prompt=青梨沙龙果香洗发水
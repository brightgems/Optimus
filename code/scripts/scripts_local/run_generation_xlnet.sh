
export MODEL_DIR=/d/models/xlnet/chinese_xlnet_base_pytorch

python ./examples/run_generation.py \
    --model_type=xlnet \
    --length=20 \
    --model_name_or_path=$MODEL_DIR \
    --padding_text=富含蚕丝蛋白精华，直击受损根源，修补受损毛鳞片，有效修复干枯毛糙、脆弱易断等受损发质，给秀发轻盈、低负担的呵护，重铸发丝健康。 \
    --prompt=青梨沙龙果香洗发水
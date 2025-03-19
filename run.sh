# export MODEL_NAME="stabilityai/stable-diffusion-2"
# export VAE_MODEL_PATH="stabilityai/stable-diffusion-2"
export MODEL_NAME="./simplitex-trained-model-ipa-lora_newdata_no_flag"
export VAE_MODEL_PATH="./simplitex-trained-model-ipa-lora_newdata_no_flag"
export OUTPUT_DIR="./output"

celebrities=(
"feifei li"
"mi yang"
# "yuanyuan gao"
)
text_prompt=(
        # "blonde hair"
        # "bald head"
        # "wearing colorful shirt"
        # "wearing military soldier costume"
        # "wearing white top, blue pants, glasses"
        # "wearing white shirt, jeans, glasses"
        # "wearing white shirt, jeans, white hat"
        "is superhero"
        # "wearing bussiness suit"
        # "is policeman custom"
        # "is santa claus costume"
        # "wearing red clothes"
        # "wearing blue clothes"
        # "wearing casual suits"
        # "bald head"
        # "wearing green clothes"
        # "wearing black clothes"
        # "wearing white shirt and jeans"
        # "is military soldier costume"
        # "wearing sunglasses"
        # "wearing santa claus costume"
        # "wearing blue clothes"

)

for cele in "${celebrities[@]}"; do
    for prompt in "${text_prompt[@]}"; do
            python test.py \
            --pretrained_model_name_or_path=$MODEL_NAME  \
            --vae_model_name_or_path=$VAE_MODEL_PATH \
            --output_path=$OUTPUT_DIR  \
            --instance_prompt="a sks texturemap of asian woman $prompt"  \
            --resume_ckpt 1500 \
            --num_inference_steps 50 \
            --guidance_scale 5 \
            --validation_images "./test/$cele/1.jpg" \
            --validation_image_embeds "./test/$cele/1.jpg"
    done
done

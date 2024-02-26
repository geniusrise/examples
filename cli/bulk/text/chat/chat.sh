#!/usr/bin/env bash

genius InstructionBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/chat \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/chat \
    none \
    --id mistralai/Mistral-7B-Instruct-v0.1 \
    perform \
        --args \
            model_name="mistralai/Mistral-7B-Instruct-v0.1" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            decoding_strategy="generate" \
            generation_max_new_tokens=100 \
            generation_do_sample=true

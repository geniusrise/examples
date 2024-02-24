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
    perform_vllm \
        --args \
            model_name="mistralai/Mistral-7B-Instruct-v0.1" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            vllm_enforce_eager=True \
            generation_temperature=0.7 \
            generation_top_p=1.0 \
            generation_n=1 \
            generation_max_tokens=50 \
            generation_stream=false \
            generation_presence_penalty=0.0 \
            generation_frequency_penalty=0.0

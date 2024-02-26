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
    perform_llama_cpp \
        --args \
            model="TheBloke/Mistral-7B-Instruct-v0.2-GGUF" \
            filename="mistral-7b-instruct-v0.2.Q4_K_M.gguf" \
            n_gpu_layers=35  \
            generation_temperature=0.7 \
            generation_top_p=0.95 \
            generation_top_k=40 \
            generation_max_tokens=50 \
            generation_repeat_penalty=0.1

#!/usr/bin/env bash

genius LanguageModelBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/chat \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/chat \
    none \
    complete_llama_cpp \
        --args \
            model="TheBloke/Mistral-7B-v0.1-GGUF" \
            filename="mistral-7b-v0.1.Q4_K_M.gguf" \
            n_gpu_layers=35  \
            n_ctx=32768 \
            generation_temperature=0.7 \
            generation_top_p=0.95 \
            generation_top_k=40 \
            generation_max_tokens=50 \
            generation_repeat_penalty=0.1

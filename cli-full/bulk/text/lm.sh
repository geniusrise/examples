#!/usr/bin/env bash

genius LanguageModelBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/lm \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/lm \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id mistralai/Mistral-7B-Instruct-v0.1 \
    complete \
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


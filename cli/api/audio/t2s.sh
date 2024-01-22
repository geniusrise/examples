#!/usr/bin/env bash

genius SpeechToTextAPI rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder none \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder none \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id suno/bark \
    listen \
        --args \
            model_name="suno/bark" \
            model_class="AutoModel" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            compile=True \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

curl -X POST localhost:3000/api/v1/generate \
    -H "Content-Type: application/json" \
    -u user:password \
    -d '{
        "text": "wow what can this do?",
        "input_sampling_rate": 48000,
        "model_sampling_rate": 16000
    }' | jq


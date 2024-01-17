#!/usr/bin/env bash

genius NamedEntityRecognitionAPI rise \
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
    --id d4data/biomedical-ner-all \
    listen \
        --args \
            model_name="d4data/biomedical-ner-all" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California and has sever back pain and liver cirrhosis."
    }' | jq

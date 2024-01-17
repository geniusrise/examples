#!/usr/bin/env bash

genius QAAPI rise \
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
    --id google/tapas-base-finetuned-wtq \
    listen \
        --args \
            model_name="google/tapas-base-finetuned-wtq" \
            model_class="AutoModelForTableQuestionAnswering" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
      "data": [
          {"Name": "Alice", "Age": "30"},
          {"Name": "Bob", "Age": "25"}
      ],
      "question": "what is their total age?"
  }
  ' | jq

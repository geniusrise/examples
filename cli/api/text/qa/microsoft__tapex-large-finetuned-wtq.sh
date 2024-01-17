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
    --id microsoft/tapex-large-finetuned-wtq \
    listen \
        --args \
            model_name="microsoft/tapex-large-finetuned-wtq" \
            model_class="AutoModelForSeq2SeqLM" \
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
      "data": {"Actors": ["Brad Pitt", "Leonardo Di Caprio", "George Clooney"], "Number of movies": ["87", "53", "69"]},
      "question": "how many movies does Leonardo Di Caprio have?"
  }
  ' | jq


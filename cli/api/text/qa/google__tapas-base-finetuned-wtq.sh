#!/usr/bin/env bash

genius QAAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
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

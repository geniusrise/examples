#!/usr/bin/env bash

genius TextClassificationAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id vineetsharma/customer-support-intent-albert \
    listen \
        --args \
            model_name="vineetsharma/customer-support-intent-albert" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "cannot use upi shows my bank has some problem"
    }' | jq

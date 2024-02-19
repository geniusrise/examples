#!/usr/bin/env bash

genius TextClassificationAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id Sigma/financial-sentiment-analysis \
    listen \
        --args \
            model_name="Sigma/financial-sentiment-analysis" \
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
        "text": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity"
    }' | jq


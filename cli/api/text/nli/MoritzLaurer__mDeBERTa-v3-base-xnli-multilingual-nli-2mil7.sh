#!/usr/bin/env bash

genius NLIAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id "MoritzLaurer/mDeBERTa-v3-base-xnli-multilingual-nli-2mil7" \
    listen \
        --args \
            model_name="MoritzLaurer/mDeBERTa-v3-base-xnli-multilingual-nli-2mil7" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/entailment \
    -H "Content-Type: application/json" \\\
    -d '{
        "premise": "This a very good entry level smartphone, battery last 2-3 days after fully charged when connected to the internet. No memory lag issue when playing simple hidden object games. Performance is beyond my expectation, i bought it with a good bargain, couldnt ask for more!",
        "hypothesis": "the phone has an awesome battery life"
    }' | jq

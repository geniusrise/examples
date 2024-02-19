#!/usr/bin/env bash

genius NamedEntityRecognitionAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id Dizex/FoodBaseBERT-NER \
    listen \
        --args \
            model_name="Dizex/FoodBaseBERT-NER" \
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
        "text": "My name is Clara and I live in Berkeley, California."
    }' | jq

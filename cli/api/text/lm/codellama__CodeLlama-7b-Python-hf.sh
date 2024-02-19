#!/usr/bin/env bash

genius LanguageModelAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id codellama/CodeLlama-7b-Python-hf \
    listen \
        --args \
            model_name="codellama/CodeLlama-7b-Python-hf" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "## PRD for federated auth with google using keycloak",
        "decoding_strategy": "generate",
        "max_new_tokens": 1024,
        "do_sample": true
    }' | jq

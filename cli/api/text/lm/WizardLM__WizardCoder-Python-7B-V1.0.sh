#!/usr/bin/env bash

genius LanguageModelAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id WizardLM/WizardCoder-Python-7B-V1.0 \
    listen \
        --args \
            model_name="WizardLM/WizardCoder-Python-7B-V1.0" \
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
        "prompt": "Below is an instruction that describes a task. Write a response that appropriately completes the request.\n\n### Instruction:\nWrite a PRD for Oauth auth using keycloak\n\n### Response:",
        "decoding_strategy": "generate",
        "max_new_tokens": 1024,
        "do_sample": true
    }' | jq

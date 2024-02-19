#!/usr/bin/env bash

genius InstructionAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id WizardLM/WizardMath-7B-V1.0 \
    listen \
        --args \
            model_name="WizardLM/WizardMath-7B-V1.0" \
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
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100
    }' | jq

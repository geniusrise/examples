#!/usr/bin/env bash

genius LanguageModelAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id mistralai/Mistral-7B-v0.1 \
    listen \
        --args \
            model_name="mistralai/Mistral-7B-v0.1" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            use_vllm=True \
            vllm_enforce_eager=True \
            vllm_max_model_len=1024 \
            concurrent_queries=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"


curl -v -X POST "http://localhost:3000/api/v1/complete_vllm" \
    -H "Content-Type: application/json" \
    -u "user:password" \
    -d '{
        "messages": ["Whats the weather like in London?"],
        "temperature": 0.7,
        "top_p": 1.0,
        "n": 1,
        "max_tokens": 50,
        "stream": false,
        "presence_penalty": 0.0,
        "frequency_penalty": 0.0,
        "logit_bias": {},
        "user": "example_user"
    }'


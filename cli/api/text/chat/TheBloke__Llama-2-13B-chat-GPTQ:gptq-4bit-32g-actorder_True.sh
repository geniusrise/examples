#!/usr/bin/env bash

genius InstructionAPI rise \
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
    --id TheBloke/Llama-2-13B-chat-GPTQ:gptq-4bit-32g-actorder_True \
    listen \
        --args \
            model_name="TheBloke/Llama-2-13B-chat-GPTQ:gptq-4bit-32g-actorder_True" \
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

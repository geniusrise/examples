#!/usr/bin/env bash

genius InstructionAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    listen \
        --args \
            model_name="TheBloke/Mistral-7B-Instruct-v0.2-GGUF" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            use_llama_cpp=True \
            llama_cpp_filename="mistral-7b-instruct-v0.2.Q4_K_M.gguf" \
            llama_cpp_n_gpu_layers=35 \
            llama_cpp_n_ctx=32768 \
            concurrent_queries=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"


curl -X POST "http://localhost:3000/api/v1/chat_llama_cpp" \
    -H "Content-Type: application/json" \
    -u "user:password" \
    -d '{
        "messages": [
            {"role": "user", "content": "What is the capital of France?"},
            {"role": "system", "content": "The capital of France is"}
        ],
        "temperature": 0.7,
        "top_p": 0.95,
        "top_k": 40,
        "max_tokens": 50,
        "repeat_penalty" 1.1
    }'

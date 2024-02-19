#!/usr/bin/env bash

genius QAAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id google/tapas-base-finetuned-wikisql-supervised \
    listen \
        --args \
            model_name="google/tapas-base-finetuned-wikisql-supervised" \
            model_class="AutoModelForTableQuestionAnswering" \
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

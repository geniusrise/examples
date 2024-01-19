#!/usr/bin/env bash

genius TextJupyterNotebook rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder none \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder none \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user ixaxaar \
        --postgres_password postgres \
        --postgres_database cloud \
        --postgres_table state \
        --id my_notebook \
    create \
    --args \
        model_name="cardiffnlp/twitter-roberta-base-hate-latest" \
        model_class="AutoModelForSequenceClassification" \
        tokenizer_class="AutoTokenizer" \
        use_cuda=True \
        precision="float" \
        quantization=0 \
        device_map="cuda:0" \
        max_memory=None \
        torchscript=False \
        endpoint="*" \
        port=8001 \
        password="password"

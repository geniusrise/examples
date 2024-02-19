#!/usr/bin/env bash

genius TextClassificationBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/txtclass \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/txtclass \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id cardiffnlp/twitter-roberta-base-hate-multiclass-latest \
    classify \
        --args \
            model_name="cardiffnlp/twitter-roberta-base-hate-multiclass-latest" \
            model_class="AutoModelForSequenceClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False

#################################################################################################

genius TextClassificationBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/txtclass \
    batch \
        --output_s3_bucket geniusrise-prod-output \
        --output_s3_folder year=2023/month=12/day=299/ \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id papluca/xlm-roberta-base-language-detection \
    classify \
        --args \
            model_name="papluca/xlm-roberta-base-language-detection" \
            model_class="AutoModelForSequenceClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            notification_email=russi@geniusrise.ai



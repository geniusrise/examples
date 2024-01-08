#!/usr/bin/env bash

genius QABulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/qa-traditional \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/qa-traditional \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id distilbert-base-uncased-distilled-squad-lol \
    answer_questions \
        --args \
            model_name="distilbert-base-uncased-distilled-squad" \
            model_class="AutoModelForQuestionAnswering" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False

#################################################################################################

genius QABulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/qa-table \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/qa-table \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id google/tapas-base-finetuned-wtq-lol \
    answer_questions \
        --args \
            model_name="google/tapas-base-finetuned-wtq" \
            model_class="AutoModelForTableQuestionAnswering" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False

#################################################################################################

genius QABulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/qa-table \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/qa-table \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id google/tapas-base-finetuned-sqa-lol \
    answer_questions \
        --args \
            model_name="google/tapas-base-finetuned-sqa" \
            model_class="AutoModelForTableQuestionAnswering" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False

#################################################################################################

genius QABulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/qa-table \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/qa-table \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id microsoft/tapex-large-finetuned-wtq-lol \
    answer_questions \
        --args \
            model_name="microsoft/tapex-large-finetuned-wtq" \
            model_class="AutoModelForSeq2SeqLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False


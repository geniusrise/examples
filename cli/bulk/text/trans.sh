#!/usr/bin/env bash

genius TranslationBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/trans \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/trans \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id facebook/mbart-large-50-many-to-many-mmt \
    translate \
        --args \
            model_name="facebook/mbart-large-50-many-to-many-mmt" \
            model_class="AutoModelForSeq2SeqLM" \
            tokenizer_class="AutoTokenizer" \
            origin="hi_IN" \
            target="en_XX" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            generate_decoder_start_token_id=2 \
            generate_early_stopping=true \
            generate_eos_token_id=2 \
            generate_forced_eos_token_id=2 \
            generate_max_length=200 \
            generate_num_beams=5 \
            generate_pad_token_id=1

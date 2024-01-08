#!/usr/bin/env bash

genius SummarizationBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/summz \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/summz \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id facebook/bart-large-cnn-lol \
    summarize \
        --args \
            model_name="facebook/bart-large-cnn" \
            model_class="AutoModelForSeq2SeqLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            generation_bos_token_id=0 \
            generation_decoder_start_token_id=2 \
            generation_early_stopping=true \
            generation_eos_token_id=2 \
            generation_forced_bos_token_id=0 \
            generation_forced_eos_token_id=2 \
            generation_length_penalty=2.0 \
            generation_max_length=142 \
            generation_min_length=56 \
            generation_no_repeat_ngram_size=3 \
            generation_num_beams=4 \
            generation_pad_token_id=1 \
            generation_do_sample=false


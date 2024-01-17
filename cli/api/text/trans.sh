#!/usr/bin/env bash

genius TranslationAPI rise \
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
    --id facebook/mbart-large-50-many-to-many-mmt \
    listen \
        --args \
            model_name="facebook/mbart-large-50-many-to-many-mmt" \
            model_class="AutoModelForSeq2SeqLM" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/translate \
    -H "Content-Type: application/json" \
    -d '{
        "text": "संयुक्त राष्ट्र के प्रमुख का कहना है कि सीरिया में कोई सैन्य समाधान नहीं है",
        "source_lang": "hi_IN",
        "target_lang": "en_XX",
        "decoding_strategy": "generate",
        "decoder_start_token_id": 2,
        "early_stopping": true,
        "eos_token_id": 2,
        "forced_eos_token_id": 2,
        "max_length": 200,
        "num_beams": 5,
        "pad_token_id": 1
    }' | jq

#################################################################################################

genius TranslationAPI rise \
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
    --id facebook/wmt21-dense-24-wide-x-en \
    listen \
        --args \
            model_name="facebook/wmt21-dense-24-wide-x-en" \
            model_class="AutoModelForSeq2SeqLM" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/translate \
    -H "Content-Type: application/json" \
    -d '{
        "text": "संयुक्त राष्ट्र के प्रमुख का कहना है कि सीरिया में कोई सैन्य समाधान नहीं है",
        "source_lang": "de",
        "decoding_strategy": "generate",
        "decoder_start_token_id": 2,
        "early_stopping": true,
        "eos_token_id": 2,
        "forced_eos_token_id": 2,
        "max_length": 200,
        "num_beams": 5,
        "pad_token_id": 1
    }' | jq


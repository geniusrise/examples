#!/usr/bin/env bash

genius SpeechToTextAPI rise \
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
    --id facebook/seamless-m4t-v2-large \
    listen \
        --args \
            model_name="facebook/seamless-m4t-v2-large" \
            model_class="SeamlessM4Tv2ForSpeechToText" \
            processor_class="AutoProcessor" \
            use_cuda=True \
            precision="float32" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            compile=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_size\": 1280000, \"overlap_size\": 213333, \"do_sample\": true, \"num_beams\": 4, \"temperature\": 0.6, \"tgt_lang\": \"eng\"}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

(base64 -w 0 long_sample.mp3 | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_size\": 1280000, \"overlap_size\": 213333, \"do_sample\": true, \"num_beams\": 4, \"temperature\": 0.3, \"tgt_lang\": \"eng\"}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_length_s\": 60}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/asr_pipeline \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

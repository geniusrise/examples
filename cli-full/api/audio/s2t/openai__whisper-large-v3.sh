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
    --id openai/whisper-large-v3 \
    listen \
        --args \
            model_name="openai/whisper-large-v3" \
            model_class="WhisperForConditionalGeneration" \
            processor_class="AutoProcessor" \
            use_cuda=True \
            precision="float32" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            compile=True \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

(base64 -w 0 sample.mp3 | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq


(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

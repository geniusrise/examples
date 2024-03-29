#!/usr/bin/env bash

genius SpeechToTextAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    listen \
        --args \
            model_name="large-v2" \
            use_whisper_cpp=True \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

(base64 -w 0 sample.mp3 | awk '{print "{\"audio_file\": \""$0"\"}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq


(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\"}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

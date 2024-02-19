#!/usr/bin/env bash

genius SpeechToTextAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id facebook/wav2vec2-base-960h \
    listen \
        --args \
            model_name="facebook/wav2vec2-base-960h" \
            model_class="Wav2Vec2ForCTC" \
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

(base64 -w 0 long_sample.mp3 | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_size\": 1600000}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq


(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_size\": 1600000}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/transcribe \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq

(base64 -w 0 sample.flac | awk '{print "{\"audio_file\": \""$0"\", \"model_sampling_rate\": 16000, \"chunk_length_s\": 60}"}' > /tmp/payload.json)
curl -X POST http://localhost:3000/api/v1/asr_pipeline \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/payload.json | jq


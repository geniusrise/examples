#!/usr/bin/env bash

genius SpeechToTextBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder audio-inputs \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder audio-outputs \
    none \
    transcribe \
        --args \
            model_name="large-v3" \
            use_faster_whisper=True \
            precision=float32 \
            quantization=0 \
            device_map="cuda:0"

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
            model_name="large-v2" \
            use_whisper_cpp=True

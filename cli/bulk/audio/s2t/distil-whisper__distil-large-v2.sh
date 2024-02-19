#!/usr/bin/env bash

genius SpeechToTextBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder audio-inputs \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder audio-outputs \
    none \
    --id distil-whisper/distil-large-v2 \
    transcribe \
        --args \
            model_name="distil-whisper/distil-large-v2" \
            model_class="WhisperForConditionalGeneration" \
            processor_class="AutoProcessor" \
            use_cuda=True \
            precision="float32" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            compile=False \
            batch_size=8 \
            notification_email=russi@geniusrise.ai \
            model_sampling_rate=16_000 \
            chunk_size=0 \
            overlap_size=0


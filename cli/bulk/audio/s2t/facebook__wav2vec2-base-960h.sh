#!/usr/bin/env bash

genius SpeechToTextBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder audio-inputs \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder audio-outputs \
    none \
    --id facebook/wav2vec2-base-960h \
    transcribe \
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
            batch_size=8 \
            notification_email=russi@geniusrise.ai \
            model_sampling_rate=16_000 \
            chunk_size=16000 \
            overlap_size=1600

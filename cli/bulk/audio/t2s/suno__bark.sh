#!/usr/bin/env bash

genius TextToSpeechBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder t2s-inputs \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder t2s-outputs \
    none \
    --id suno/bark \
    synthesize_speech \
        --args \
            model_name="suno/bark" \
            model_class="BarkModel" \
            processor_class="BarkProcessor" \
            use_cuda=True \
            precision="float32" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            compile=False \
            batch_size=8 \
            notification_email=russi@geniusrise.ai \
            max_length=512 \
            output_type="mp3" \
            voice_preset="v2/en_speaker_6" \
            model_sampling_rate=16000

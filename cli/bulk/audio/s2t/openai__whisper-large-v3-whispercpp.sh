#!/usr/bin/env bash

genius SpeechToTextBulk rise \
    batch \
        --input_folder ./input \
    batch \
        --output_folder ./output \
    none \
    --id facebook/bart-large-cnn-lol \
    summarize \
        --args \
            model_name="facebook/bart-large-cnn" \
            use_whisper_cpp=True

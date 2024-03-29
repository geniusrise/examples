#!/usr/bin/env bash

genius TextToSpeechAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id facebook/seamless-m4t-v2-large \
    listen \
        --args \
            model_name="facebook/seamless-m4t-v2-large" \
            model_class="SeamlessM4Tv2ForTextToSpeech" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/synthesize \
    -H "Content-Type: application/json" \
    -u user:password \
    -d '{
        "text": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
        "output_type": "mp3",
        "tgt_lang": "jpn",
        "voice_preset": "1"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3

/usr/bin/curl -X POST localhost:3000/api/v1/synthesize \
    -H "Content-Type: application/json" \
    -u user:password \
    -d '{
        "text": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
        "output_type": "mp3",
        "tgt_lang": "eng",
        "voice_preset": "1"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3

#!/usr/bin/env bash

genius SummarizationAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id facebook/bart-large-cnn \
    listen \
        --args \
            model_name="facebook/bart-large-cnn" \
            model_class="AutoModelForSeq2SeqLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/summarize \
    -H "Content-Type: application/json" \
    -d '{
        "text": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
        "decoding_strategy": "generate",
        "bos_token_id": 0,
        "decoder_start_token_id": 2,
        "early_stopping": true,
        "eos_token_id": 2,
        "forced_bos_token_id": 0,
        "forced_eos_token_id": 2,
        "length_penalty": 2.0,
        "max_length": 142,
        "min_length": 56,
        "no_repeat_ngram_size": 3,
        "num_beams": 4,
        "pad_token_id": 1,
        "do_sample": false
    }' | jq

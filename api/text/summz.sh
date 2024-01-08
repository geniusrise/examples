#!/usr/bin/env bash

genius SummarizationAPI rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder none \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder none \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id facebook/bart-large-cnn-lol \
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

# {
#   "input": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
#   "summary": [
#     "Recurrent Neural Networks (RNNs) have a way of blowing your expectations out of the water. I still remember when I trained my first recurrent network for Image Captioning. Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times."
#   ]
# }

#################################################################################################


# facebook/bart-large-cnn
# sshleifer/distilbart-cnn-12-6

      "early_stopping": true,
      "length_penalty": 2.0,
      "max_length": 142,
      "min_length": 56,
      "no_repeat_ngram_size": 3,
      "num_beams": 4


# pszemraj/led-large-book-summary

"length_penalty": 0.8,
  "max_length": 1024,
  "min_length": 8,
  "model_type": "led",
  "no_repeat_ngram_size": 3,
  "num_beams": 4,
  "num_hidden_layers": 12,
  "output_past": false,
  "pad_token_id": 1,
  "prefix": " ",

# knkarthick/MEETING-SUMMARY-BART-LARGE-XSUM-SAMSUM-DIALOGSUM-AMI
# ainize/kobart-news

      "length_penalty": 1.0,
      "max_length": 128,
      "min_length": 12,
      "num_beams": 4

# human-centered-summarization/financial-summarization-pegasus
# Callidior/bert2bert-base-arxiv-titlegen
# pszemraj/long-t5-tglobal-base-16384-book-summary
# Quake24/easyTermsSummerizer

# google/bigbird-pegasus-large-arxiv
# google/bigbird-pegasus-large-bigpatent
# google/bigbird-pegasus-large-pubmed
# google/bigbird-pegasus-large-reddit_tifu

  "bos_token_id": 2,
  "decoder_start_token_id": 2,
  "eos_token_id": 1,
  "length_penalty": 0.8,
  "max_length": 256,
  "num_beams": 5,
  "pad_token_id": 0,

# google/flan-t5-base
# google/flan-t5-large
# google/flan-t5-xl
# google/flan-t5-xxl

  "decoder_start_token_id": 0,
  "eos_token_id": 1,
  "pad_token_id": 0,

# google/t5-v1_1-base
# google/t5-v1_1-large
# google/t5-v1_1-xl
# google/t5-v1_1-xxl

  "decoder_start_token_id": 0,
  "eos_token_id": 1,
  "pad_token_id": 0,

# google/umt5-base
# google/umt5-xl
# google/umt5-xxl

  "decoder_start_token_id": 0,
  "eos_token_id": 1,
  "pad_token_id": 0,

# google/pegasus-x-base
# google/pegasus-large
# google/pegasus-x-large
# google/pegasus-multi_news

  "bos_token_id": 0,
  "decoder_start_token_id": 0,
  "eos_token_id": 1,
  "forced_eos_token_id": 1,
  "length_penalty": 0.8,
  "max_length": 16384,
  "num_beams": 8,
  "pad_token_id": 0,

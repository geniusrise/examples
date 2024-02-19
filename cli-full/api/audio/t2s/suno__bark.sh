#!/usr/bin/env bash

genius TextToSpeechAPI rise \
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
    --id suno/bark \
    listen \
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
        "voice_preset": "v2/en_speaker_6"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3


/usr/bin/curl -X POST localhost:3000/api/v1/synthesize \
    -H "Content-Type: application/json" \
    -u user:password \
    -d '{
        "text": "Recurrent Neural Networks (RNNs) ke baare mein kuch jaadui hai. Main ab bhi yaad karta hoon jab maine apna pehla recurrent network train kiya tha Image Captioning ke liye. Training shuru karne ke kuch hi minutes mein, meri pehli baby model (jiska maine randomly hyperparameters choose kiye the) ne images ke bahut acche descriptions generate karne shuru kar diye jo almost samajh mein aane wale the. Kabhi kabhi aapki model kitni simple hai aur usse jo results aate hain unka ratio aapki expectations se bahut aage nikal jaata hai, aur yeh wohi waqt tha. Us waqt jo result aaya tha woh itna shocking tha kyunki common samajh yeh thi ki RNNs ko train karna mushkil hota hai (lekin zyada experience hone ke baad, maine bilkul ulta nateeja nikala). Ek saal aage badho: Main lagatar RNNs train kar raha hoon aur maine unki shakti aur mazbooti ko kayi baar dekha hai, phir bhi unke jaadui outputs mujhe hamesha entertain karte hain.",
        "output_type": "mp3",
        "voice_preset": "v2/hi_speaker_5"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3


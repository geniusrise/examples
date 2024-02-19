#!/usr/bin/env bash

genius TextToSpeechAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id facebook/mms-tts-hin \
    listen \
        --args \
            model_name="facebook/mms-tts-hin" \
            model_class="VitsModel" \
            processor_class="VitsTokenizer" \
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
        "text": "रीकरंट न्यूरल नेटवर्क्स (RNNs) के बारे में कुछ जादुई है। मैं अब भी याद करता हूँ जब मैंने अपना पहला रीकरंट नेटवर्क ट्रेन किया था इमेज कैप्शनिंग के लिए। ट्रेनिंग शुरू करने के कुछ ही मिनटों में, मेरी पहली बेबी मॉडल (जिसका मैंने बेतरतीब हाइपरपैरामीटर्स चुने थे) ने इमेजेज के बहुत अच्छे विवरण उत्पन्न करने शुरू कर दिए जो लगभग समझ में आने वाले थे। कभी-कभी आपकी मॉडल कितनी सरल है और उससे जो परिणाम आते हैं उनका अनुपात आपकी अपेक्षाओं से कहीं आगे निकल जाता है, और यह वही समय था। उस समय जो परिणाम आया था वह इतना चौंकाने वाला था क्योंकि सामान्य समझ यह थी कि RNNs को प्रशिक्षित करना मुश्किल होता है (लेकिन अधिक अनुभव होने के बाद, मैंने बिलकुल उल्टा निष्कर्ष निकाला)। एक साल आगे बढ़ो: मैं लगातार RNNs प्रशिक्षित कर रहा हूँ और मैंने उनकी शक्ति और मजबूती को कई बार देखा है, फिर भी उनके जादुई आउटपुट मुझे हमेशा मनोरंजन करते हैं।",
        "output_type": "mp3"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3


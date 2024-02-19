#!/usr/bin/env bash

genius TextToSpeechAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    --id facebook/mms-tts-guj \
    listen \
        --args \
            model_name="facebook/mms-tts-guj" \
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
        "text": "રીકરન્ટ ન્યૂરલ નેટવર્ક્સ (RNNs) વિશે કંઈક જાદુઈ છે। હું હજુ પણ યાદ કરું છું જ્યારે મેં મારું પ્રથમ રીકરન્ટ નેટવર્ક ઇમેજ કેપ્શનિંગ માટે ટ્રેન કર્યું હતું। ટ્રેનિંગ શરૂ કર્યાની થોડીવારમાં જ, મારી પહેલી બેબી મોડેલ (જેમાં હું કંઈક મનમાના હાઇપરપેરામિટર્સ પસંદ કર્યા હતા) ઇમેજિસના ખૂબ સારા વર્ણનો ઉત્પન્ન કરવા માંડી હતી જે થોડીક સમજવાની કગાર પર હતાં। ક્યારેક એવું બને છે કે તમારી મોડેલ કેટલી સરળ છે અને તેના પરિણામોની ગુણવત્તા તમારી અપેક્ષાઓની તુલનામાં કેટલી આગળ નીકળે છે, અને આ એ સમયની વાત હતી। તે સમયે આવેલ પરિણામ એટલો ચોંકાવનારો હતો કે સામાન્ય જ્ઞાન એ હતું કે RNNsને ટ્રેન કરવામાં મુશ્કેલ હોવું જોઈએ (વધુ અનુભવ મળ્યા પછી હું તેના વિપરીત નિષ્કર્ષે પહોંચ્યો છું)। એક વર્ષની આગળ વધો: હું લગાતાર RNNs ટ્રેન કરી રહ્યો છું અને હું તેમની શક્તિ અને મજબૂતીને ઘણીવાર જોયું છે, તેમ છતાં તેમના જાદુઈ આઉટપુટ્સ મને હંમેશા મનોરંજન કરે છે।",
        "output_type": "mp3"
    }' | jq -r '.audio_file' | base64 -d > output.mp3 && vlc output.mp3


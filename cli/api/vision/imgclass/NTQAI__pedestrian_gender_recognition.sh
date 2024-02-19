#!/usr/bin/env bash

genius ImageClassificationAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    listen \
        --args \
            model_name="NTQAI/pedestrian_gender_recognition" \
            model_class="AutoModelForImageClassification" \
            processor_class="AutoImageProcessor" \
            device_map="cuda:0" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            max_memory=None \
            torchscript=False \
            compile=False \
            flash_attention=False \
            better_transformers=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

(base64 -w 0 cat.jpg | awk '{print "{\"image_base64\": \""$0"\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/classify_image \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

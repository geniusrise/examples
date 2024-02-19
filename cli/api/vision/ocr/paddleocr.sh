#!/usr/bin/env bash

genius ImageOCRAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    listen \
        --args \
            model_name="paddleocr" \
            device_map="cuda:0" \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

(base64 -w 0 test_images_ocr/ReceiptSwiss.jpg | awk '{print "{\"image_base64\": \""$0"\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/ocr \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

(base64 -w 0 test_images_ocr/django.jpg | awk '{print "{\"image_base64\": \""$0"\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/ocr \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

(base64 -w 0 test_images_ocr/pdf.jpg | awk '{print "{\"image_base64\": \""$0"\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/ocr \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

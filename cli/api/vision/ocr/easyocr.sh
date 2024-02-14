#!/usr/bin/env bash

genius ImageOCRAPI rise \
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
    listen \
        --args \
            model_name="easyocr" \
            device_map="cuda:0" \
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

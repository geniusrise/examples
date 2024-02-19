#!/usr/bin/env bash

genius VisualQAAPI rise \
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
            model_name="Salesforce/blip-vqa-capfilt-large" \
            model_class="BlipForQuestionAnswering" \
            processor_class="BlipProcessor" \
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

(base64 -w 0 test_images_segment_finetune/image1.jpg | awk '{print "{\"image_base64\": \""$0"\", \"question\": \"describe the image\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/answer_question \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

(base64 -w 0 test_images_segment/image_seg.png | awk '{print "{\"image_base64\": \""$0"\", \"question\": \"describe the image\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/answer_question \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

(base64 -w 0 test_images_segment/segmentation_input.jpg | awk '{print "{\"image_base64\": \""$0"\", \"question\": \"describe the image\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/answer_question \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

(base64 -w 0 test_images_segment/semantic-seg-image.png | awk '{print "{\"image_base64\": \""$0"\", \"question\": \"describe the image\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/answer_question \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq

#!/usr/bin/env bash

genius VisionSegmentationAPI rise \
    batch \
            --input_folder ./input \
    batch \
            --output_folder ./output \
    none \
    listen \
        --args \
            model_name="nvidia/segformer-b0-finetuned-ade-512-512" \
            model_class="SegformerForSemanticSegmentation" \
            processor_class="SegformerImageProcessor" \
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

(base64 -w 0 guy.jpg | awk '{print "{\"image_base64\": \""$0"\", \"subtask\": \"semantic\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/segment_image \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq -r '.[] | .mask + " " + .label' | while read mask label; do echo $mask | base64 --decode > "${label}.jpg"; done

(base64 -w 0 test_images_segment/image_seg.png | awk '{print "{\"image_base64\": \""$0"\", \"subtask\": \"semantic\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/segment_image \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq -r '.[] | .mask + " " + .label' | while read mask label; do echo $mask | base64 --decode > "${label}.jpg"; done

(base64 -w 0 test_images_segment/segmentation_input.jpg | awk '{print "{\"image_base64\": \""$0"\", \"subtask\": \"semantic\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/segment_image \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq -r '.[] | .mask + " " + .label' | while read mask label; do echo $mask | base64 --decode > "${label}.jpg"; done

(base64 -w 0 test_images_segment/semantic-seg-image.png | awk '{print "{\"image_base64\": \""$0"\", \"subtask\": \"semantic\"}"}' > /tmp/image_payload.json)
curl -X POST http://localhost:3000/api/v1/segment_image \
    -H "Content-Type: application/json" \
    -u user:password \
    -d @/tmp/image_payload.json | jq -r '.[] | .mask + " " + .label' | while read mask label; do echo $mask | base64 --decode > "${label}.jpg"; done

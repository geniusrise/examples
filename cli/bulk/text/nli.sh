#!/usr/bin/env bash

genius NLIBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/nli \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/nli \
    none \
    --id MoritzLaurer/mDeBERTa-v3-base-xnli-multilingual-nli-2mil7 \
    infer \
        --args \
            model_name="MoritzLaurer/mDeBERTa-v3-base-xnli-multilingual-nli-2mil7" \
            model_class="AutoModelForSequenceClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False

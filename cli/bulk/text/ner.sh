#!/usr/bin/env bash

genius NamedEntityRecognitionBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/ner \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/ner \
    none \
    --id dslim/bert-large-NER \
    recognize_entities \
        --args \
            model_name="dslim/bert-large-NER" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False



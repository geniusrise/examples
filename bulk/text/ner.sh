#!/usr/bin/env bash

genius NamedEntityRecognitionBulk rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/ner \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/ner \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id dslim/bert-large-NER-lol \
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



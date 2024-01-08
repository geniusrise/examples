#!/usr/bin/env bash

genius NamedEntityRecognitionAPI rise \
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
    --id dslim/bert-large-NER-lol \
    listen \
        --args \
            model_name="dslim/bert-large-NER" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="0.0.0.0" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California."
    }' | jq

# {
#   "input": "My name is Clara and I live in Berkeley, California.",
#   "entities": [
#     {
#       "token": "[CLS]",
#       "class": "O"
#     },
#     {
#       "token": "My",
#       "class": "O"
#     },
#     {
#       "token": "name",
#       "class": "O"
#     },
#     {
#       "token": "is",
#       "class": "O"
#     },
#     {
#       "token": "Clara",
#       "class": "B-PER"
#     },
#     {
#       "token": "and",
#       "class": "O"
#     },
#     {
#       "token": "I",
#       "class": "O"
#     },
#     {
#       "token": "live",
#       "class": "O"
#     },
#     {
#       "token": "in",
#       "class": "O"
#     },
#     {
#       "token": "Berkeley",
#       "class": "B-LOC"
#     },
#     {
#       "token": ",",
#       "class": "O"
#     },
#     {
#       "token": "California",
#       "class": "B-LOC"
#     },
#     {
#       "token": ".",
#       "class": "O"
#     },
#     {
#       "token": "[SEP]",
#       "class": "O"
#     }
#   ]
# }


##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id Babelscape/wikineural-multilingual-ner-lol \
    listen \
        --args \
            model_name="Babelscape/wikineural-multilingual-ner" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California."
    }' | jq

##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id d4data/biomedical-ner-all-lol \
    listen \
        --args \
            model_name="d4data/biomedical-ner-all" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California and has sever back pain and liver cirrhosis."
    }' | jq

##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id alvaroalon2/biobert_chemical_ner-lol \
    listen \
        --args \
            model_name="alvaroalon2/biobert_chemical_ner" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California and i deal with sulfuric acid."
    }' | jq

##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id pruas/BENT-PubMedBERT-NER-Gene-lol \
    listen \
        --args \
            model_name="pruas/BENT-PubMedBERT-NER-Gene" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California and i have brca gene."
    }' | jq

##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id Dizex/FoodBaseBERT-NER-lol \
    listen \
        --args \
            model_name="Dizex/FoodBaseBERT-NER" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I live in Berkeley, California."
    }' | jq

##################################################################################################

genius NamedEntityRecognitionAPI rise \
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
    --id pruas/BENT-PubMedBERT-NER-Disease-lol \
    listen \
        --args \
            model_name="pruas/BENT-PubMedBERT-NER-Disease" \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float" \
            quantization=0 \
            device_map="cuda:0" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/recognize_entities \
    -H "Content-Type: application/json" \
    -d '{
        "text": "My name is Clara and I have tenderness in my spleen."
    }' | jq



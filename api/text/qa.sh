#!/usr/bin/env bash

genius QAAPI rise \
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
    --id distilbert-base-uncased-distilled-squad-lol \
    listen \
        --args \
            model_name="distilbert-base-uncased-distilled-squad" \
            model_class="AutoModelForQuestionAnswering" \
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


/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
        "data": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
        "question": "What is the common wisdom about RNNs?"

    }' | jq

# {
#   "data": "Theres something magical about Recurrent Neural Networks (RNNs). I still remember when I trained my first recurrent network for Image Captioning. Within a few dozen minutes of training my first baby model (with rather arbitrarily-chosen hyperparameters) started to generate very nice looking descriptions of images that were on the edge of making sense. Sometimes the ratio of how simple your model is to the quality of the results you get out of it blows past your expectations, and this was one of those times. What made this result so shocking at the time was that the common wisdom was that RNNs were supposed to be difficult to train (with more experience Ive in fact reached the opposite conclusion). Fast forward about a year: Im training RNNs all the time and Ive witnessed their power and robustness many times, and yet their magical outputs still find ways of amusing me.",
#   "question": "What is the common wisdom about RNNs?",
#   "answer": {
#     "answers": [
#       "rnns were supposed to be difficult to train"
#     ],
#     "aggregation": "NONE"
#   }
# }

#################################################################################################

genius QAAPI rise \
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
    --id google/tapas-base-finetuned-wtq-lol \
    listen \
        --args \
            model_name="google/tapas-base-finetuned-wtq" \
            model_class="AutoModelForTableQuestionAnswering" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
      "data": [
          {"Name": "Alice", "Age": "30"},
          {"Name": "Bob", "Age": "25"}
      ],
      "question": "what is their total age?"
  }
  ' | jq

# {
#   "data": [
#     {
#       "Name": "Alice",
#       "Age": "30"
#     },
#     {
#       "Name": "Bob",
#       "Age": "25"
#     }
#   ],
#   "question": "what is their total age?",
#   "answer": {
#     "answers": [
#       "30",
#       "25"
#     ],
#     "aggregation": "SUM"
#   }
# }


/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
    "data": [
            {"Product": "Apple", "Price": "1"},
            {"Product": "Banana", "Price": "0.5"},
            {"Product": "Orange", "Price": "1.2"}
    ],
    "question": "What is the total price of all products?"
}' | jq

# {
#   "data": [
#     {
#       "Product": "Apple",
#       "Price": "1"
#     },
#     {
#       "Product": "Banana",
#       "Price": "0.5"
#     },
#     {
#       "Product": "Orange",
#       "Price": "1.2"
#     }
#   ],
#   "question": "What is the total price of all products?",
#   "answer": {
#     "answers": [
#       "1",
#       "0.5",
#       "1.2"
#     ],
#     "aggregation": "SUM"
#   }
# }


/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
    "data": [
            {"Employee": "John", "Department": "Marketing"},
            {"Employee": "Jane", "Department": "Sales"},
            {"Employee": "Mike", "Department": "IT"}
    ],
    "question": "Which departments do John and Jane work in?"
}' | jq

# {
#   "data": [
#     {
#       "Employee": "John",
#       "Department": "Marketing"
#     },
#     {
#       "Employee": "Jane",
#       "Department": "Sales"
#     },
#     {
#       "Employee": "Mike",
#       "Department": "IT"
#     }
#   ],
#   "question": "Which departments do John and Jane work in?",
#   "answer": {
#     "answers": [
#       "Marketing",
#       "Sales"
#     ],
#     "aggregation": "NONE"
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
    "data": [
            {"Country": "USA", "Capital": "Washington", "Population (Millions)": "328"},
            {"Country": "Canada", "Capital": "Ottawa", "Population (Millions)": "37"},
            {"Country": "UK", "Capital": "London", "Population (Millions)": "66"}
    ],
    "question": "What is the capital of Canada and its population?"
}' | jq

#################################################################################################

genius QAAPI rise \
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
    --id google/tapas-base-finetuned-sqa-lol \
    listen \
        --args \
            model_name="google/tapas-base-finetuned-sqa" \
            model_class="AutoModelForTableQuestionAnswering" \
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

#################################################################################################

genius QAAPI rise \
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
    --id google/tapas-base-finetuned-wikisql-supervised-lol \
    listen \
        --args \
            model_name="google/tapas-base-finetuned-wikisql-supervised" \
            model_class="AutoModelForTableQuestionAnswering" \
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

#################################################################################################

genius QAAPI rise \
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
    --id microsoft/tapex-large-finetuned-wtq-lol \
    listen \
        --args \
            model_name="microsoft/tapex-large-finetuned-wtq" \
            model_class="AutoModelForSeq2SeqLM" \
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


/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
      "data": {"Actors": ["Brad Pitt", "Leonardo Di Caprio", "George Clooney"], "Number of movies": ["87", "53", "69"]},
      "question": "how many movies does Leonardo Di Caprio have?"
  }
  ' | jq

# {
#   "data": {
#     "Actors": [
#       "Brud Pitt",
#       "Leonardo Di Caprio",
#       "George Clooney"
#     ],
#     "Number of movies": [
#       "87",
#       "53",
#       "69"
#     ]
#   },
#   "question": "how many movies does Leonardo Di Caprio have?",
#   "answer": {
#     "answers": [
#       " 53"
#     ],
#     "aggregation": "NONE"
#   }
# }

#################################################################################################

genius QAAPI rise \
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
    --id microsoft/tapex-base-finetuned-wikisql-lol \
    listen \
        --args \
            model_name="microsoft/tapex-base-finetuned-wikisql" \
            model_class="AutoModelForSeq2SeqLM" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/answer \
    -H "Content-Type: application/json" \
    -d '{
      "data": {"Actors": ["Brad Pitt", "Leonardo Di Caprio", "George Clooney"], "Number of movies": ["87", "53", "69"]},
      "question": "how many movies does clooney have?"
  }
  ' | jq

# {
#   "data": {
#     "Actors": [
#       "Brad Pitt",
#       "Leonardo Di Caprio",
#       "George Clooney"
#     ],
#     "Number of movies": [
#       "87",
#       "53",
#       "69"
#     ]
#   },
#   "question": "how many movies does clooney have?",
#   "answer": {
#     "answers": [
#       " 69.0"
#     ],
#     "aggregation": "NONE"
#   }
# }

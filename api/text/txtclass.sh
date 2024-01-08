#!/usr/bin/env bash

genius TextClassificationAPI rise \
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
    --id cardiffnlp/twitter-roberta-base-hate-multiclass-latest-lol \
    listen \
        --args \
            model_name="cardiffnlp/twitter-roberta-base-hate-multiclass-latest" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "women dont actually deserve board membership just because they are women"
    }' | jq


# {
#   "input": "women dont actually deserve board membership just because they are women",
#   "label_scores": {
#     "sexism": 0.266459196805954,
#     "racism": 0.00036130676744505763,
#     "disability": 0.00014898114022798836,
#     "sexual_orientation": 0.0004330835654400289,
#     "religion": 0.0002752556756604463,
#     "other": 0.0002860473468899727,
#     "not_hate": 0.7320361137390137
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id cardiffnlp/twitter-roberta-base-hate-latest-lol \
    listen \
        --args \
            model_name="cardiffnlp/twitter-roberta-base-hate-latest" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "women dont actually deserve board membership just because they are women"
    }' | jq

# {
#   "input": "women dont actually deserve board membership just because they are women",
#   "label_scores": {
#     "NOT-HATE": 0.009339521639049053,
#     "HATE": 0.9906604886054993
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "marwaris are not to be trusted, they are known to be dishonest people"
    }' | jq


# {
#   "input": "marwaris are not to be trusted, they are known to be dishonest people",
#   "label_scores": {
#     "NOT-HATE": 0.01161245722323656,
#     "HATE": 0.9883875250816345
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id cardiffnlp/twitter-roberta-base-offensive-lol \
    listen \
        --args \
            model_name="cardiffnlp/twitter-roberta-base-offensive" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "marwaris are not to be trusted, they are known to be dishonest people"
    }' | jq

# {
#   "input": "marwaris are not to be trusted, they are known to be dishonest people",
#   "label_scores": {
#     "non-offensive": 0.30015912652015686,
#     "offensive": 0.6998409032821655
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "wherever these biharis go they create problems"
    }' | jq

# {
#   "input": "wherever these biharis go they create problems",
#   "label_scores": {
#     "non-offensive": 0.5604071617126465,
#     "offensive": 0.43959277868270874
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id tomh/toxigen_roberta-lol \
    listen \
        --args \
            model_name="tomh/toxigen_roberta" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "marwaris are not to be trusted, they are known to be dishonest people"
    }' | jq

# {
#   "input": "marwaris are not to be trusted, they are known to be dishonest people",
#   "label_scores": {
#     "LABEL_0": 0.00906642060726881,
#     "LABEL_1": 0.9909335374832153
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "wherever these biharis go they create problems"
    }' | jq

# {
#   "input": "wherever these biharis go they create problems",
#   "label_scores": {
#     "LABEL_0": 0.014021606184542179,
#     "LABEL_1": 0.9859784245491028
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "oh look this nice flower"
    }' | jq

# {
#   "input": "oh look this nice flower",
#   "label_scores": {
#     "LABEL_0": 0.9990345239639282,
#     "LABEL_1": 0.0009655517060309649
#   }
# }

#################################################################################################


genius TextClassificationAPI rise \
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
    --id cardiffnlp/twitter-roberta-base-irony-lol \
    listen \
        --args \
            model_name="cardiffnlp/twitter-roberta-base-irony" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "What a wonderful day to have a flat tire!"
    }' | jq

# {
#   "input": "What a wonderful day to have a flat tire!",
#   "label_scores": {
#     "non_irony": 0.023495545610785484,
#     "irony": 0.9765045046806335
#   }
# }


#################################################################################################

genius TextClassificationAPI rise \
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
    --id cointegrated/rubert-tiny-toxicity-lol \
    listen \
        --args \
            model_name="cointegrated/rubert-tiny-toxicity" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "wherever these biharis go they create problems"
    }' | jq

# {
#   "input": "wherever these biharis go they create problems",
#   "label_scores": {
#     "non-toxic": 0.47051677107810974,
#     "insult": 0.006538381800055504,
#     "obscenity": 0.0001560162054374814,
#     "threat": 0.00009319485252490267,
#     "dangerous": 0.5226956009864807
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id michellejieli/NSFW_text_classifier-lol \
    listen \
        --args \
            model_name="michellejieli/NSFW_text_classifier" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "romit is having an affair, did you hear?"
    }' | jq

# {
#   "input": "romit is having an affair, did you hear?",
#   "label_scores": {
#     "SFW": 0.028971005231142044,
#     "NSFW": 0.9710290431976318
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id bucketresearch/politicalBiasBERT-lol \
    listen \
        --args \
            model_name="bucketresearch/politicalBiasBERT" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "i think i agree with bjp that hindus need to be respected"
    }' | jq

# {
#   "input": "i think i agree with bjp that hindus need to be respected",
#   "label_scores": {
#     "LEFT": 0.28080788254737854,
#     "CENTER": 0.18140915036201477,
#     "RIGHT": 0.5377829670906067
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "schools should be free for all, education is a fundamental right"
    }' | jq

# {
#   "input": "schools should be free for all, education is a fundamental right",
#   "label_scores": {
#     "LEFT": 0.3969304859638214,
#     "CENTER": 0.22925396263599396,
#     "RIGHT": 0.37381553649902344
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id Sigma/financial-sentiment-analysis-lol \
    listen \
        --args \
            model_name="Sigma/financial-sentiment-analysis" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity"
    }' | jq

# {
#   "input": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity",
#   "label_scores": {
#     "LABEL_0": 0.0014419443905353546,
#     "LABEL_1": 0.0011700820177793503,
#     "LABEL_2": 0.9973879456520081
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "tata sons lost a major contract to its rival mahindra motors"
    }' | jq

# {
#   "input": "tata sons lost a major contract to its rival mahindra motors",
#   "label_scores": {
#     "LABEL_0": 0.9946314096450806,
#     "LABEL_1": 0.0012042761081829667,
#     "LABEL_2": 0.004164266865700483
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "reliances results were inspiring and it lifted the market"
    }' | jq

# {
#   "input": "reliances results were inspiring and it lifted the market",
#   "label_scores": {
#     "LABEL_0": 0.000749085855204612,
#     "LABEL_1": 0.0025611333549022675,
#     "LABEL_2": 0.9966897964477539
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id cardiffnlp/tweet-topic-21-multi-lol \
    listen \
        --args \
            model_name="cardiffnlp/tweet-topic-21-multi" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "tata sons lost a major contract to its rival mahindra motors"
    }' | jq

# {
#   "input": "tata sons lost a major contract to its rival mahindra motors",
#   "label_scores": {
#     "arts_&_culture": 0.00019499004702083766,
#     "business_&_entrepreneurs": 0.8854106664657593,
#     "celebrity_&_pop_culture": 0.002648241352289915,
#     "diaries_&_daily_life": 0.0004844023787882179,
#     "family": 0.00047276305849663913,
#     "fashion_&_style": 0.0020674308761954308,
#     "film_tv_&_video": 0.000674620212521404,
#     "fitness_&_health": 0.0005096016684547067,
#     "food_&_dining": 0.0005247332737781107,
#     "gaming": 0.0012692237505689263,
#     "learning_&_educational": 0.0010323228780180216,
#     "music": 0.00039635697612538934,
#     "news_&_social_concern": 0.09194459021091461,
#     "other_hobbies": 0.001245944295078516,
#     "relationships": 0.00032484845723956823,
#     "science_&_technology": 0.0028042090125381947,
#     "sports": 0.0066305845975875854,
#     "travel_&_adventure": 0.0008058653329499066,
#     "youth_&_student_life": 0.0005586337065324187
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id padmajabfrl/Gender-Classification-lol \
    listen \
        --args \
            model_name="padmajabfrl/Gender-Classification" \
            model_class="AutoModelForSequenceClassification" \
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


/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "tata sons lost a major contract to its rival mahindra motors"
    }' | jq

# {
#   "input": "tata sons lost a major contract to its rival mahindra motors",
#   "label_scores": {
#     "Male": 0.9999347925186157,
#     "Female": 0.00006523773481603712
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "the cloth material is made of fine silk"
    }' | jq

# {
#   "input": "the cloth material is made of fine silk",
#   "label_scores": {
#     "Male": 0.15009601414203644,
#     "Female": 0.84990394115448
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id yiyanghkust/finbert-tone-lol \
    listen \
        --args \
            model_name="yiyanghkust/finbert-tone" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "tata sons lost a major contract to its rival mahindra motors"
    }' | jq

# {
#   "input": "tata sons lost a major contract to its rival mahindra motors",
#   "label_scores": {
#     "Neutral": 0.016992885619401932,
#     "Positive": 0.000008707756933290511,
#     "Negative": 0.9829984307289124
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity"
    }' | jq

# {
#   "input": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity",
#   "label_scores": {
#     "Neutral": 0.00001633630381547846,
#     "Positive": 0.9965400695800781,
#     "Negative": 0.0034435493871569633
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id wajidlinux99/gibberish-text-detector-lol \
    listen \
        --args \
            model_name="wajidlinux99/gibberish-text-detector" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity"
    }' | jq

# {
#   "input": "although gabriels quarterly results exceeded expectations, few were willing to buy because of lack of liquidity",
#   "label_scores": {
#     "clean": 0.1860799342393875,
#     "mild gibberish": 0.8118569254875183,
#     "noise": 0.00048530526692047715,
#     "word salad": 0.0015779262175783515
#   }
# }

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "althouhh gabriels quaterly results shoudwd promsie"
    }' | jq

# {
#   "input": "althouhh gabriels quaterly results shoudwd promsie",
#   "label_scores": {
#     "clean": 0.020773569121956825,
#     "mild gibberish": 0.636692464351654,
#     "noise": 0.2981753945350647,
#     "word salad": 0.04435845836997032
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id vectara/hallucination_evaluation_model-lol \
    listen \
        --args \
            model_name="vectara/hallucination_evaluation_model" \
            model_class="AutoModelForSequenceClassification" \
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


/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "there are 3 capitals of france - paris, london"
    }' | jq

# {
#   "input": "there are 3 capitals of france - paris, london",
#   "label_scores": {
#     "LABEL_0": 1.0
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id papluca/xlm-roberta-base-language-detection-lol \
    listen \
        --args \
            model_name="papluca/xlm-roberta-base-language-detection" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "bhenchod ye language ko identify karke bata tu"
    }' | jq

# {
#   "input": "bhenchod ye language ko identify karke bata tu",
#   "label_scores": {
#     "ja": 0.002631315030157566,
#     "nl": 0.0048895240761339664,
#     "ar": 0.001219363184645772,
#     "pl": 0.0018028212944045663,
#     "de": 0.005546253174543381,
#     "it": 0.005255651194602251,
#     "pt": 0.0033265824895352125,
#     "tr": 0.005696617998182774,
#     "es": 0.0018993200501427054,
#     "hi": 0.8253127336502075,
#     "el": 0.0021848282776772976,
#     "ur": 0.110700823366642,
#     "bg": 0.0040862602181732655,
#     "en": 0.002932253060862422,
#     "fr": 0.0014787998516112566,
#     "zh": 0.0015680124051868916,
#     "ru": 0.0020826198160648346,
#     "th": 0.0020412947051227093,
#     "sw": 0.014454233460128307,
#     "vi": 0.0008906994480639696
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id Falconsai/fear_mongering_detection-lol \
    listen \
        --args \
            model_name="Falconsai/fear_mongering_detection" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "dont go there the cockroach will bite you"
    }' | jq

# {
#   "input": "dont go there the cockroach will bite you",
#   "label_scores": {
#     "Fear_Mongering": 0.8501419425010681,
#     "Non_Fear_Mongering": 0.14985807240009308
#   }
# }

#################################################################################################

genius TextClassificationAPI rise \
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
    --id Falconsai/intent_classification-lol \
    listen \
        --args \
            model_name="Falconsai/intent_classification" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "hey i havent got my package yet where is it"
    }' | jq

# {
#   "input": "hey i havent got my package yet where is it",
#   "label_scores": {
#     "cancellation": 6.553709398088303E-12,
#     "ordering": 4.977344745534613E-15,
#     "shipping": 4.109915668426903E-15,
#     "invoicing": 1.3524543897996955E-13,
#     "billing and payment": 2.5260177283215057E-10,
#     "returns and refunds": 1.915349389508547E-12,
#     "complaints and feedback": 1.0671016614826126E-13,
#     "speak to person": 2.6417441435886042E-15,
#     "edit account": 3.1924864227900196E-13,
#     "delete account": 2.704471304022793E-13,
#     "delivery information": 1.0,
#     "subscription": 1.2307567616963444E-13,
#     "recover password": 1.387644556552492E-12,
#     "registration problems": 2.686436142984583E-13,
#     "appointment": 3.555285948454723E-13
#   }
# }


#################################################################################################

genius TextClassificationAPI rise \
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
    --id vineetsharma/customer-support-intent-albert-lol \
    listen \
        --args \
            model_name="vineetsharma/customer-support-intent-albert" \
            model_class="AutoModelForSequenceClassification" \
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

/usr/bin/curl -X POST localhost:3000/api/v1/classify \
    -H "Content-Type: application/json" \
    -d '{
        "text": "cannot use upi shows my bank has some problem"
    }' | jq

# {
#   "input": "cannot use upi shows my bank hassome problem",
#   "label_scores": {
#     "cancel_order": 0.004567550960928202,
#     "change_order": 0.0014479478122666478,
#     "change_shipping_address": 0.0038767626974731684,
#     "check_cancellation_fee": 0.020785359665751457,
#     "check_invoice": 0.008346994407474995,
#     "check_payment_methods": 0.10006441920995712,
#     "check_refund_policy": 0.0030630393885076046,
#     "complaint": 0.008875073865056038,
#     "contact_customer_service": 0.006347815506160259,
#     "contact_human_agent": 0.001938285306096077,
#     "create_account": 0.020063960924744606,
#     "delete_account": 0.05186329409480095,
#     "delivery_options": 0.0025898762978613377,
#     "delivery_period": 0.004079149570316076,
#     "edit_account": 0.02837662771344185,
#     "get_invoice": 0.0026054000481963158,
#     "get_refund": 0.007287856191396713,
#     "newsletter_subscription": 0.0022396384738385677,
#     "payment_issue": 0.04524904116988182,
#     "place_order": 0.004439746029675007,
#     "recover_password": 0.632789671421051,
#     "registration_problems": 0.006573962513357401,
#     "review": 0.00894474983215332,
#     "set_up_shipping_address": 0.0029775097500532866,
#     "switch_account": 0.005264852661639452,
#     "track_order": 0.004269117023795843,
#     "track_refund": 0.0110723115503788
#   }
# }

#!/usr/bin/env bash

genius InstructionAPI rise \
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
            model_name="TheBloke/Mistral-7B-OpenOrca-AWQ" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            awq_enabled=True \
            flash_attention=True \
            endpoint="*" \
            port=3001 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3001/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n<|end|>\n<|user|>\nHow do I sort a list in Python?<|end|>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.7,
        "top_k": 50,
        "top_p": 0.95
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
            model_name="HuggingFaceH4/starchat-beta" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            awq_enabled=True \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000"


/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n<|end|>\n<|user|>\nHow do I sort a list in Python?<|end|>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.2,
        "top_k": 50,
        "top_p": 0.95,
        "eos_token_id": 49155
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id mistralai/Mistral-7B-Instruct-v0.1-lol \
    listen \
        --args \
            model_name="mistralai/Mistral-7B-Instruct-v0.1" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="bfloat16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"



/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n</s>\n<|user|>\nHow do I sort a list in Python?</s>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true
    }' | jq


#################################################################################################

genius InstructionAPI rise \
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
    --id TheBloke/starchat-beta-GPTQ:gptq-4bit-32g-actorder_True-lol \
    listen \
        --args \
            model_name="TheBloke/starchat-beta-GPTQ" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n<|end|>\n<|user|>\nHow do I sort a list in Python?<|end|>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.2,
        "top_k": 50,
        "top_p": 0.95,
        "eos_token_id": 49155
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id TheBloke/Mistral-7B-Code-16K-qlora-GPTQ:gptq-4bit-32g-actorder_True-lol \
    listen \
        --args \
            model_name="TheBloke/Mistral-7B-Code-16K-qlora-GPTQ:gptq-4bit-32g-actorder_True" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n</s>\n<|user|>\nHow do I sort a list in Python?</s>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true
    }' | jq

#################################################################################################


genius InstructionAPI rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder none \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder none \
    postgres \
        --postgres_host 127.0.0.1 \
        --pos>tgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id TheBloke/Mistral-7B-Phibrarian-32K-GPTQ-lol \
    listen \
        --args \
            model_name="TheBloke/Mistral-7B-Phibrarian-32K-GPTQ" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n<|end|>\n<|user|>\nHow do I sort a list in Python?<|end|>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.7,
        "top_k": 40,
        "top_p": 0.95,
        "repetition_penalty": 1.1
    }' | jq

#################################################################################################


genius InstructionAPI rise \
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
    --id meta-llama/Llama-2-7b-chat-hf-lol \
    listen \
        --args \
            model_name="meta-llama/Llama-2-7b-chat-hf" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"


/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.6,
        "top_k": 50,
        "top_p": 0.9,
        "bos_token_id": 1,
        "eos_token_id": 2
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id codellama/CodeLlama-7b-Instruct-hf-lol \
    listen \
        --args \
            model_name="codellama/CodeLlama-7b-Instruct-hf" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id WizardLM/WizardCoder-Python-7B-V1.0-lol \
    listen \
        --args \
            model_name="WizardLM/WizardCoder-Python-7B-V1.0" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id WizardLM/WizardMath-7B-V1.0-lol \
    listen \
        --args \
            model_name="WizardLM/WizardMath-7B-V1.0" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id TheBloke/Llama-2-13B-chat-GPTQ:gptq-4bit-32g-actorder_True-lol \
    listen \
        --args \
            model_name="TheBloke/Llama-2-13B-chat-GPTQ:gptq-4bit-32g-actorder_True" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"

/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<<USR>> How do I sort a list in Python?<<EOR>>\n",
        "decoding_strategy": "generate",
        "max_new_tokens": 100
    }' | jq

#################################################################################################

genius InstructionAPI rise \
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
    --id TheBloke/HuggingFaceH4/zephyr-7b-beta-lol \
    listen \
        --args \
            model_name="HuggingFaceH4/zephyr-7b-beta" \
            model_class="AutoModelForCausalLM" \
            tokenizer_class="AutoTokenizer" \
            use_cuda=True \
            precision="float16" \
            quantization=0 \
            device_map="auto" \
            max_memory=None \
            torchscript=False \
            endpoint="*" \
            port=3000 \
            cors_domain="http://localhost:3000" \
            username="user" \
            password="password"


/usr/bin/curl -X POST localhost:3000/api/v1/complete \
    -H "Content-Type: application/json" \
    -d '{
        "prompt": "<|system|>\n<|end|>\n<|user|>\nHow do I sort a list in Python?<|end|>\n<|assistant|>",
        "decoding_strategy": "generate",
        "max_new_tokens": 100,
        "do_sample": true,
        "temperature": 0.2
    }' | jq


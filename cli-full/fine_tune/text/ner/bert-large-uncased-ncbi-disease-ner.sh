#!/usr/bin/env bash

genius NamedEntityRecognitionFineTuner rise \
    batch \
        --input_s3_bucket geniusrise-test \
        --input_s3_folder input/txtclass \
    batch \
        --output_s3_bucket geniusrise-test \
        --output_s3_folder output/txtclass \
    postgres \
        --postgres_host 127.0.0.1 \
        --postgres_port 5432 \
        --postgres_user postgres \
        --postgres_password postgres \
        --postgres_database geniusrise\
        --postgres_table state \
    --id lol \
    fine_tune \
        --args \
            model_name="bert-large-uncased" \
            tokenizer_name="bert-large-uncased" \
            num_train_epochs=3 \
            per_device_batch_size=8 \
            model_class="AutoModelForTokenClassification" \
            tokenizer_class="AutoTokenizer" \
            device_map="cuda:0" \
            precision="bfloat16" \
            quantization=0 \
            lora_config=None \
            use_accelerate=False \
            use_trl=False \
            accelerate_no_split_module_classes="[]" \
            evaluate=False \
            save_steps=15000 \
            save_total_limit=None \
            load_best_model_at_end=False \
            metric_for_best_model=None \
            greater_is_better=None \
            use_huggingface_dataset=True \
            huggingface_dataset="ncbi_disease" \
            hf_repo_id="ixaxaar/bert-large-uncased-ncbi-disease-ner" \
            hf_commit_message="yay" \
            hf_token="" \
            hf_private=true \
            hf_create_pr=False \
            notification_email="russi@geniusrise.ai" \
            compile=False \
            learning_rate=5e-5


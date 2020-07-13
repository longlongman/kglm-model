{
    "vocabulary": {
        "type": "extended",
        "directory_path": "data/vocabulary",
        "extend": false
    },
    "dataset_reader": {
        "type": "conll2012_jsonl",
    },
    "train_data_path": "data/conll-2012/processed/train.jsonl",
    "validation_data_path": "data/conll-2012/processed/dev.jsonl",
    "datasets_for_vocab_creation": ["train"],
    "model": {
        "type": "entitynlm",
        "text_field_embedder": {
            "token_embedders": {
                "tokens": {
                    "type": "embedding",
                    "embedding_dim": 300,
                    "trainable": true
                },
            },
        },
        "embedding_dim": 300,
        "hidden_size": 300,
        "num_layers": 1,
        "max_mention_length": 100,
        "max_embeddings": 100,
        "tie_weights": false,
        "dropout_rate": 0.1,
        "variational_dropout_rate": 0.2
    },
    "iterator": {
        "type": "fancy",
        "batch_size": 256,
        "split_size": 120,
        "splitting_keys": [
            "source",
            "entity_types",
            "entity_ids",
            "mention_lengths"
        ],
    },
    "validation_iterator": {
        "type": "fancy",
        "batch_size": 343,
        "split_size": 128,
        "splitting_keys": [
            "source",
            "entity_types",
            "entity_ids",
            "mention_lengths"
        ],
        "truncate": false
    },
    "trainer": {
        "type": "lm",
        "num_epochs": 400,
        "cuda_device": 0,
        "optimizer": {
            "type": "adam",
            "lr": 1e-3,
        }
    }
}
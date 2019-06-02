# pylint: disable=protected-access,not-callable,unused-import

from allennlp.common.testing import ModelTestCase
import numpy as np
import torch

from kglm.training import LmTrainer
from kglm.common.testing import KglmModelTestCase
from kglm.data.dataset_readers.enhanced_wikitext import EnhancedWikitextEntityNlmReader
from kglm.models.entity_nlm import EntityNLM
from kglm.models.entity_disc import EntityNLMDiscriminator


class EntityNLMTest(KglmModelTestCase):

    def setUp(self):
        super().setUp()
        self.set_up_model("kglm/tests/fixtures/training_config/entity_nlm.json",
                          "kglm/tests/fixtures/enhanced-wikitext.jsonl")

    def test_model_can_train_save_and_load(self):
        self.ensure_model_can_train_save_and_load(self.param_file,
                                                  gradients_to_ignore=['_dummy_context_embedding'])

class EntityDiscTest(KglmModelTestCase):

    def setUp(self):
        super().setUp()
        self.set_up_model("kglm/tests/fixtures/training_config/entity_disc.json",
                          "kglm/tests/fixtures/enhanced-wikitext.jsonl")

    def test_model_can_train_save_and_load(self):
        self.ensure_model_can_train_save_and_load(self.param_file,
                                                  gradients_to_ignore=['_dummy_context_embedding'])

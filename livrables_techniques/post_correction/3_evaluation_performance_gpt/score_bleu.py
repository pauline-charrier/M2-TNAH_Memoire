# Score obtenu : 
# BLEU score: 0.7607469339459699

import os
import glob
import nltk
from nltk.translate.bleu_score import corpus_bleu

nltk.download('punkt')

def compute_bleu(reference_dir, hypothesis_dir):
    references = []
    hypotheses = []

    for ref_file in glob.glob(os.path.join(reference_dir, '*.txt')):
        filename = os.path.basename(ref_file)
        hyp_file = os.path.join(hypothesis_dir, filename)

        with open(ref_file, 'r', encoding='utf-8') as ref, open(hyp_file, 'r', encoding='utf-8') as hyp:
            ref_text = ref.read().strip()
            hyp_text = hyp.read().strip()
            references.append([nltk.word_tokenize(ref_text)])
            hypotheses.append(nltk.word_tokenize(hyp_text))
    
    bleu_score = corpus_bleu(references, hypotheses)
    return bleu_score

reference_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_verite\\'
hypothesis_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_gpt\\'

bleu_score = compute_bleu(reference_dir, hypothesis_dir)
print("BLEU score:", bleu_score)

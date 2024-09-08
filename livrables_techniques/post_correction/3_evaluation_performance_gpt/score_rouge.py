# Scores obtenus :
# ROUGE scores: {'rouge1': 0.9756313503740076, 'rouge2': 0.9537522945235051, 'rougeL': 0.9756313503740076}

import os
import glob
from rouge_score import rouge_scorer


def compute_rouge(reference_dir, hypothesis_dir):
    scorer = rouge_scorer.RougeScorer(["rouge1", "rouge2", "rougeL"], use_stemmer=True)
    scores = {"rouge1": [], "rouge2": [], "rougeL": []}

    for ref_file in glob.glob(os.path.join(reference_dir, "*.txt")):
        filename = os.path.basename(ref_file)
        hyp_file = os.path.join(hypothesis_dir, filename)

        # print(f"Traitement du fichier de référence : {ref_file}")
        # print(f"Traitement du fichier de correction : {hyp_file}")

        with open(ref_file, "r", encoding="utf-8") as ref, open(
            hyp_file, "r", encoding="utf-8"
        ) as hyp:
            ref_text = ref.read()
            hyp_text = hyp.read()
            score = scorer.score(ref_text, hyp_text)
            for key in scores.keys():
                scores[key].append(score[key].fmeasure)

    avg_scores = {key: sum(values) / len(values) for key, values in scores.items()}
    return avg_scores


reference_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_verite\\'
hypothesis_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_gpt\\'

rouge_scores = compute_rouge(reference_dir, hypothesis_dir)
print("ROUGE scores:", rouge_scores)

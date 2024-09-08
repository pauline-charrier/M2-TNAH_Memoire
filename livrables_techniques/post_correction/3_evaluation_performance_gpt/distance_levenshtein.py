# Score obtenu  :
# Average Levenshtein Distance: 142.25

import os
import glob
import Levenshtein

def compute_levenshtein(reference_dir, hypothesis_dir):
    distances = []

    for ref_file in glob.glob(os.path.join(reference_dir, '*.txt')):
        filename = os.path.basename(ref_file)
        hyp_file = os.path.join(hypothesis_dir, filename)

        with open(ref_file, 'r', encoding='utf-8') as ref, open(hyp_file, 'r', encoding='utf-8') as hyp:
            ref_text = ref.read().strip()
            hyp_text = hyp.read().strip()
            distance = Levenshtein.distance(ref_text, hyp_text)
            distances.append(distance)
    
    avg_distance = sum(distances) / len(distances)
    return avg_distance

reference_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_verite\\'
hypothesis_dir = 'data\\Fichiers_alignes_pour_evaluation\\alignement_gpt\\'

levenshtein_distance = compute_levenshtein(reference_dir, hypothesis_dir)
print("Average Levenshtein Distance:", levenshtein_distance)

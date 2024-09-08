# Pré-traitement nécessaire pour aligner les vérités terrains et les sorties GPT 
# suppression de tous les espaces surnuméraires
# toutes les chaînes de caractères sont placées sur une ligne unique

import os
import re
import glob


def preprocess_text(text):
    # Remplacer les séquences d'espaces (y compris les tabulations) par un seul espace
    text = re.sub(r'[ \t\r\n]+', ' ', text).strip()
    return text

def preprocess_corpus(input_directory, output_directory):    
    
    # Parcourir tous les fichiers .txt dans le répertoire d'entrée
    for filepath in glob.glob(os.path.join(input_directory, '*.txt')):
        filename = os.path.basename(filepath)
        output_path = os.path.join(output_directory, filename)

        # Ouvrir le fichier d'entrée en lecture et le fichier de sortie en écriture
        with open(filepath, 'r', encoding='utf-8') as infile, open(output_path, 'w', encoding='utf-8') as outfile:
            all_lines = []
            for line in infile:
                preprocessed_line = preprocess_text(line)  # Prétraiter chaque ligne
                all_lines.append(preprocessed_line)  # Ajouter la ligne prétraitée à une liste
            
            # Joindre toutes les lignes prétraitées en une seule ligne
            single_line_output = ' '.join(all_lines)
            outfile.write(single_line_output)  # Écrire le texte prétraité en une seule ligne
        
        
        print(f"Prétraitement terminé pour {filename}")

# Répertoires d'entrée et de sortie
input_directory = 'CHEMIN_A_COMPLETER/output_text_gpt/'
output_directory = 'CHEMIN_A_COMPLETER/alignement_gpt/'

# Prétraiter les fichiers
preprocess_corpus(input_directory, output_directory)

print("Prétraitement terminé pour tous les fichiers.")

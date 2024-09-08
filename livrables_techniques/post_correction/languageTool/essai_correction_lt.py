import os
import language_tool_python

def corriger_texte(texte, tool):
    # Analyse et correction du texte
    matches = tool.check(texte)
    corrected_texte = language_tool_python.utils.correct(texte, matches)
    return corrected_texte

def corriger_fichiers(input_directory, output_directory):
    # Initialiser l'outil de correction pour la langue française
    tool = language_tool_python.LanguageTool('fr')
    
    # Créer le répertoire de sortie s'il n'existe pas
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)
    
    # Parcourir les fichiers du répertoire d'entrée
    for filename in os.listdir(input_directory):
        if filename.endswith('.txt'):
            input_filepath = os.path.join(input_directory, filename)
            output_filepath = os.path.join(output_directory, filename)
            
            # Lire le contenu du fichier
            with open(input_filepath, 'r', encoding='utf-8') as file:
                texte = file.read()
            
            # Corriger le texte
            corrected_texte = corriger_texte(texte, tool)
            
            # Écrire le texte corrigé dans un nouveau fichier
            with open(output_filepath, 'w', encoding='utf-8') as file:
                file.write(corrected_texte)
            print(f"Fichier corrigé : {output_filepath}")

if __name__ == "__main__":
    input_directory = 'input_text'  
    output_directory = 'output_text_languagetool'  
    corriger_fichiers(input_directory, output_directory)

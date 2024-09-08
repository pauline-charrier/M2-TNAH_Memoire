import os

# Enlever les espaces insécables ("&nbsp;")
def traiter_fichier_tei(fichier_input, dossier_output):
    with open(fichier_input, 'r', encoding='utf-8') as file:
        fichier_tei = file.read()        
        fichier_tei = fichier_tei.replace('\xa0', ' ')

    # Ecrire dans un nouveau fichier
    fichier_output = os.path.join(dossier_output, os.path.basename(fichier_input))
    with open(fichier_output, 'w', encoding='utf-8') as file:
        file.write(fichier_tei)

# Traiter tous les fichiers TEI du dossier 
def traiter_dossier_tei(dossier_input, dossier_output):

    # Crée le dossier de sortie s'il n'existe pas 
    if not os.path.exists(dossier_output):
        os.makedirs(dossier_output)
    # Boucle dans le dossier en entrée
    for fichier in os.listdir(dossier_input):
        if fichier.endswith('.xml'):
            fichier_input = os.path.join(dossier_input, fichier)
            traiter_fichier_tei(fichier_input, dossier_output)

# Fonction englobante
def main():
    dossier_input = './LesPapiersBarye'
    dossier_output = './LesPapiersBarye_nettoyes'
    traiter_dossier_tei(dossier_input, dossier_output)
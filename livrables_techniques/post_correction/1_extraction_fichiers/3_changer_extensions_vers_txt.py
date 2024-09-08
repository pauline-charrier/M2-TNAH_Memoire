# Script simple pour changer l'extension d'un fichier
# change l'extension '.tei.xml' en '.txt'
# permet le traitement par modèles de langage
# le format des documents dont nous changeons l'extension étant de toutes façon déjà en texte brut
# du fait de l'échappement du balisage effectué par l'extraction

import os

def changer_extension(dossier):
    # Parcourt tous les fichiers du dossier
    for nom_fichier in os.listdir(dossier):
        chemin_complet = os.path.join(dossier, nom_fichier)
        
        # Vérifie si c'est un fichier (et non un dossier)
        if os.path.isfile(chemin_complet):
            # Vérifie si le fichier a l'extension .tei.xml
            if nom_fichier.endswith('.tei.xml'):
                # Nouveau nom de fichier avec l'extension .txt
                nouveau_nom_fichier = nom_fichier.replace('.tei.xml', '.txt')
                chemin_nouveau_fichier = os.path.join(dossier, nouveau_nom_fichier)
                
                # Renomme le fichier
                os.rename(chemin_complet, chemin_nouveau_fichier)
                print(f"Renommé : {nom_fichier} -> {nouveau_nom_fichier}")

# Exemple d'utilisation
dossier_a_traiter = "CHEMIN_VERS_REPERTOIRE/output/"
changer_extension(dossier_a_traiter)

import os
from lxml import etree
import glob
import csv


# Extraire les identifiants TEI de chaque document TEI 
def extraire_identifiants_tei(fichier_tei):
    """ 
    Extraction des identifiants TEI individuels de chaque fichier TEI.

    Parameters
    ----------
    fichier_tei : str
        
    
    Returns
    -------
    Liste de chaînes correspondant à chaque identifiant TEI (identifiants_tei).
    
    """    
    with open(fichier_tei, 'rb') as f:
        tree = etree.parse(f)
        return tree.xpath('//tei:sourceDesc//tei:idno/text()', namespaces={'tei': 'http://www.tei-c.org/ns/1.0'})

# Transformer les identifiants TEI pour les faire correspondre au format des identifiants EAD
def transformer_identifiants_tei(identifiants_tei):
    """
    Transformation du format des identifiants TEI pour les faire correspondre au format des identifiants EAD.

    Parameters
    ----------
    identifiants_tei : str        
    
    Returns
    -------
    Chaîne de caractères ayant subi la transformation.
    """
    identifiants_tei = identifiants_tei.replace('ARCHIVES_', 'Archives ')
    sections = identifiants_tei.split('_')
    sections_normalisees = []
    for section in sections:
        if section.startswith('0'):
            section = section.lstrip('0')
        sections_normalisees.append(section)    
    identifiant_tei_transforme = '/'.join(sections_normalisees)
    return identifiant_tei_transforme

# Trouver les correspondances (meilleur match possible) entre identifiants TEI et identifiants EAD grâce à une comparaison caractère par caractère
def trouver_correspondances(identifiants_tei_transformes, identifiants_ead):  
    """
    Algorithme permettant d'aligner les identifiants TEI et les identifiants EAD : comparaison caractère par caractère et conservation de la plus longue chaîne de caractères communs.

    Parameters
    ----------
    identifiants_tei_transformes : str
     
    identifiants_ead : str       
    
    Returns
    -------
    Dictionnaire de correspondances.
    """  
    correspondances = {}
    for identifiant_tei in identifiants_tei_transformes:
        meilleur_match_ead = None
        longueur_meilleur_match = 0
        for identifiant_ead in identifiants_ead:
            longueur_correspondance = 0
            for caractere_tei, caractere_ead in zip(identifiant_tei, identifiant_ead):
                if caractere_tei == caractere_ead:
                    longueur_correspondance += 1
                else:
                    break  #Sortie hors de la boucle en cas de non match
            if longueur_correspondance > longueur_meilleur_match:
                meilleur_match_ead = identifiant_ead
                longueur_meilleur_match = longueur_correspondance

        correspondances[identifiant_tei] = meilleur_match_ead
    return correspondances

# Identification du dossier TEI où sont localisés les fichiers à traiter
dossier_tei = '.'

# Limiter le traitement aux fichiers commençant par "ARCHIVES" et se terminant par l'extension xml
fichiers_tei = glob.glob(os.path.join(dossier_tei, 'ARCHIVES_*.xml'))

identifiants_tei = []
for fichier_tei in fichiers_tei:
    identifiants_tei.extend(extraire_identifiants_tei(fichier_tei))

identifiants_tei = [id for id in identifiants_tei if id.startswith('ARCHIVES_')]

# Traitement du fichier EAD
fichier_ead = 'archives_166_barye.ead.xml'
tree = etree.parse(fichier_ead)

identifiants_ead = tree.xpath('//c[@id]//unitid[@type="cote"]/text()')

identifiants_tei_transformes = [transformer_identifiants_tei(id) for id in identifiants_tei]


# Affichage du nombre d'identifiants en commun à titre informatif
identifiants_communs = []
for identifiant in identifiants_tei_transformes:
    if identifiant in identifiants_ead:
        identifiants_communs.append(identifiant)
print("Nombre d'identifiants en commun : ", len(identifiants_communs))

# Application de la fonction pour trouver les correspondances
correspondances = trouver_correspondances(identifiants_tei_transformes, identifiants_ead)

# Exporter les correspondances dans un fichier CSV
with open('mapping_tei_ead_barye.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Identifiants TEI', 'Identifiants EAD'])
    for identifiant_tei, identifiant_ead in correspondances.items():
        writer.writerow([identifiant_tei, identifiant_ead])
import pandas as pd

# Charger le fichier CSV
index_personnes = pd.read_csv('index_personnes.csv', sep=';')

# Charger le fichier Excel
bulles_MAS = pd.read_excel('bulles_MAS_18juin.xlsx')

# Fonction pour retirer les points-virgules (pour ne pas avoir de soucis de séparateurs)
def enlever_pointvirgules(df, columns):
    for column in columns:
        df[column] = df[column].astype(str).str.replace(';', ', ')
    return df

# Colonnes du tableur Excel où les points-virgules doivent être retirés (surtout 'bio_bulles')
colonnes_a_faire = ['nom_bulles', 'bio_bulles', 'ref_bulles', 'lieu_bulles']

# Retirer les points-virgules 
bulles_MAS = enlever_pointvirgules(bulles_MAS, colonnes_a_faire)

# Préparer un dictionnaire pour la correspondance des noms et les informations associées
bulles_dict = bulles_MAS.set_index('nom_bulles').to_dict(orient='index')

# Colonnes vides du csv
index_personnes['bio'] = ''
index_personnes['ref_agorha'] = ''
index_personnes['lieu'] = ''

# Remplir les colonnes 'bio', 'ref_agorha' et 'lieu' avec les valeurs du fichier Excel, en utilisant la correspondance des noms (clé de jointure)
for i, row in index_personnes.iterrows():
    nom = row['version_unifiee']
    if nom in bulles_dict:
        index_personnes.at[i, 'bio'] = bulles_dict[nom].get('bio_bulles', '')
        index_personnes.at[i, 'ref_agorha'] = bulles_dict[nom].get('ref_bulles', '')
        index_personnes.at[i, 'lieu'] = bulles_dict[nom].get('lieu_bulles', '')

# Enlever les "nan" des cellules vides
index_personnes = index_personnes.replace('nan', '', regex=False)

# Sauvegarder le fichier CSV ainsi mis à jour
index_personnes.to_csv('index_personnes_joint.csv', sep=';', index=False)

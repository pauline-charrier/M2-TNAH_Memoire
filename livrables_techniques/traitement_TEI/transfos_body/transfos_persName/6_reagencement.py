import pandas as pd


fichier = 'index_personnes_joint_2.csv'
df = pd.read_csv(fichier, sep=';')

# Classer les lignes selon l'ordre alphabétique des cellules de "version_unifiee"
df = df.sort_values(by='version_unifiee')

# Initialisation variables
current_group = None
num_valeur_distincte = 0

num_list = []
for i, row in df.iterrows():
    if row['version_unifiee'] != current_group:
        current_group = row['version_unifiee']
        num_valeur_distincte += 1
    num_list.append(num_valeur_distincte)

df['num'] = num_list
cols = ['num'] + [col for col in df.columns if col != 'num']
df = df[cols]

fichier_sortie = 'index_personnes_reagence.csv'
df.to_csv(fichier_sortie, sep=';', index=False)


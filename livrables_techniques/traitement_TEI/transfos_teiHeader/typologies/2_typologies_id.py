import pandas as pd


df = pd.read_csv('typologies.csv', sep='\t', encoding='utf-8')

def format_id(id_str):
    if id_str.startswith("BnF_Ms"):
        return id_str.replace('BnF_Ms, Naf ', 'bnf_naf')
    elif id_str.startswith("BINHA"):
        return id_str.replace('/', '_')
    return id_str

df['id2'] = df['id'].apply(format_id)

df.to_csv('typologies_modifie.csv', sep='\t', encoding='utf-8', index=False)

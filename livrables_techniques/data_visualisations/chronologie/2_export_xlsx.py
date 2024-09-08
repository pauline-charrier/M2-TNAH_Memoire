import pandas as pd

csv_file_path = 'chrono3.csv'
xlsx_file_path = 'chrono3.xlsx'

df = pd.read_csv(csv_file_path, encoding='utf-8', sep='\t')
df.to_excel(xlsx_file_path, index=False, engine='openpyxl')


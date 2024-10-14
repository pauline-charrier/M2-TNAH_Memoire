## Répertoire contenant les livrables techniques réalisés pendant le stage de fin d'études 
### Avril-Juillet 2024 - Pôle Éditions numériques du Service numérique de la recherche de l'INHA

### _Arborescence des fichiers_

#### Développement d'un outil d'interface utilisateur - Avril 2024
[`./outil_citation/`](https://github.com/pauline-charrier/M2-TNAH_Memoire/tree/main/livrables_techniques/outil_citation)

```text
├───alignement_identifiants
│       mapping_id_tei_ead.py
│
├───extraction_donnees
│       requete_baseX.xq
│       transfo_citation_doc_global.xq
│       transfo_citation_liste.xq
│
├───pretraitement
│       TEI_nettoyage.py
│
└───prototype_presente
        transfo_citation_indiv.xq
``` 


#### Transformations TEI - Avril-mai 2024
[`./traitement_TEI/`](https://github.com/pauline-charrier/M2-TNAH_Memoire/tree/main/livrables_techniques/traitement_TEI)

```text
├───transfos_body
│   │   espace_lb.xsl
│   │
│   └───transfos_persName
│           1_bulles_MAS_18juin.xlsx
│           2_index_personnes.csv
│           3_mise_a_jour_csv.py
│           4_index_personnes_joint.csv
│           5_index_personnes_joint_2.csv
│           6_reagencement.py
│           7_index_personnes_reagence.csv
│           8bis_alignement_bdd_csv.xml
│           8_fichier_de_travail_conversion_csv_xml.xq
│           9_transformation_finale_bdd.xq
│
└───transfos_teiHeader
    │   transfo_tei_doucet.xq
    │
    └───typologies
            1_typologies.csv
            2_typologies_id.py
            3_typologies_modifie.csv
            4_typologies.xq

``` 


#### Documents auxiliaires (dédiés à la recherche) - Mai 2024
[`./docs_auxiliaires/`](https://github.com/pauline-charrier/M2-TNAH_Memoire/tree/main/livrables_techniques/docs_auxiliaires)

```text
├───index
│       export_index_lieux.xq
│       export_index_personnes.xq
│       modele_index_liens.xq
│
└───teiCorpus
        transfo_Corpus_index_persName.xq
        transfo_vers_corpus.xq

``` 


#### Visualisations de données - Juin-juillet 2024
[`./data_visualisations/`](https://github.com/pauline-charrier/M2-TNAH_Memoire/tree/main/livrables_techniques/data_visualisations)

```text
├───cartographie
│   │   1_lieux_doucet.csv
│   │   2_carto2.py
│   │   3_lieux2.geojson
│   │   4_carte.xqm
│   │   5_carte.js
│   │   6_carte.css
│   │
│   └───img
│           apartment.png
│           bibliotheque.png
│           book-shop.png
│           fournisseur.png
│           home.png
│           quill-dessinant-une-ligne.png
│           symbole-de-la-maison.png
│           traiter.png
│           voyageur-avec-une-valise.png
│
└───chronologie
    │   1_chrono3.csv
    │   2_export_xlsx.py
    │   3bis_chrono3.txt
    │   3_chrono3.xlsx
    │   4_chrono.xqm
    │   5_chrono.js
    │   6_chrono.css
    │
    └───img
            1898_paix.png
            1906_doucet.png
            1907_spontini.jpg
            1908_rene_jean.jpg
            1909_louxor.png
``` 


#### Tâche de post-correction de corpus textuels bruités assistée par intelligence artificielle (API GPT 3.5) - Juillet 2024
[`./post_correction/`](https://github.com/pauline-charrier/M2-TNAH_Memoire/tree/main/livrables_techniques/post_correction)

```text
├───1_extraction_fichiers
│       1_extraction_fichiers_body.xq
│       2_extraction_fichiers_text_seul.xq
│       3_changer_extensions_vers_txt.py
│
├───2_requete_api_gpt
│   ├───traitement_balises
│   │       corr_api_gpt_balises.ipynb
│   │
│   └───traitement_texte_seul
│           corr_api_gpt_texte.ipynb
│
├───3_evaluation_performance_gpt
│   │   distance_levenshtein.py
│   │   score_bleu.py
│   │   score_rouge.py
│   │
│   └───pre_traitement
│           pre_traitement.py
│
├───4_data
│   ├───1_verite_terrain
│   │   ├───gt_balises
│   │   │       BINHA-Aut-143_02_192_corr.txt
│   │   │       bnf_naf13124_2_36_corr.txt
│   │   │       bnf_naf13124_2_56_corr.txt
│   │   │       bnf_naf13124_2_63_corr.txt
│   │   │
│   │   └───gt_texte
│   │           BINHA_Aut_143_02_192_corr.txt
│   │           bnf_naf13124_2_36_corr.txt
│   │           bnf_naf13124_2_56_corr.txt
│   │           bnf_naf13124_2_63_corr.txt
│   │
│   ├───2_input
│   │   ├───fichiers_balises
│   │   │       BINHA_Aut_143_02_192.txt
│   │   │       bnf_naf13124_2_36.txt
│   │   │       bnf_naf13124_2_56.txt
│   │   │       bnf_naf13124_2_63.txt
│   │   │
│   │   └───fichiers_texte
│   │           BINHA_Aut_143_02_192.txt
│   │           bnf_naf13124_2_36.txt
│   │           bnf_naf13124_2_56.txt
│   │           bnf_naf13124_2_63.txt
│   │
│   └───3_fichiers_alignes_pour_evaluation
│       ├───output_gpt
│       │       BINHA_Aut_143_02_192.txt
│       │       bnf_naf13124_2_36.txt
│       │       bnf_naf13124_2_56.txt
│       │       bnf_naf13124_2_63.txt
│       │
│       └───verite_terrain
│               BINHA_Aut_143_02_192.txt
│               bnf_naf13124_2_36.txt
│               bnf_naf13124_2_56.txt
│               bnf_naf13124_2_63.txt
│
└───languageTool
        essai_correction_lt.py
``` 




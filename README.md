# Mémoire de stage du Master "Technologies numériques appliquées à l'histoire"

## *[Titre du mémoire]*

Ce dépôt rassemble l'ensemble des documents relatifs au mémoire réalisé dans le cadre du stage de fin d'études du Master 2 "Technologies numériques appliquées à l'histoire".    
Ce stage, qui a également donné lieu à des livrables techniques, a été effectué au pôle "Edition numérique" du Service numérique de la recherche de l'Institut national d'histoire de l'art et s'est étendu sur une durée de quatre mois, entre avril et juillet 2024.  

[Description du stage et du mémoire.]

### Description du dépôt 

Le dépôt contient les répertoires et fichiers suivants :  
- `CHARRIER_Memoire_M2TNAH.pdf`: mémoire de stage au format PDF.
- `memoire_latex/`: répertoire rassemblant les fichiers .tex du mémoire (document maître, chapitres et sections, images, bibliographie).
- `livrables_techniques/`: répertoire rassemblant les livrables techniques cités dans le mémoire.

*Note*: L'ensemble des réalisations techniques produites pendant le stage sont disponibles sur le [dépôt de travail intitulé "M2-TNAH_Stage"](https://github.com/pauline-charrier/M2-TNAH_Stage). 

#### Arborescence des fichiers
```text
- CHARRIER_Memoire_M2TNAH.pdf

- memoire_latex/
    |_ main.tex
    |_ part_1/
          |_ chap_1
          |_ chap_2
          |_ chap_3
    |_ part_2/
          |_ chap_4
          |_ chap_5
    |_ part_3/
          |_ chap_6
          |_ chap_7
    |_ images/
          |_ [IMAGES]
    |_ biblio/
          |_ [BIBLIO]

-livrables_techniques/
    |_ outil_citation/
          |_ pretraitement/
                |_ TEI_nettoyage.py
          |_ alignement_identifiants/
                |_ mapping_id_tei_ead.py
          |_ extraction_donnees/
                |_ transfo_citation_liste.xq
                |_ requete_baseX.xq
                |_ transfo_citation_doc_global.xq
          |_ prototype_presente/
                |_ transfo_citation_indiv.xq
    |_ data_visualisations/
          |_ cartographie/
                |_ 1_lieux_doucet.csv
                |_ 2_carto2.py
                |_ 3_lieux2.geojson
                |_ 4_carte.xqm
                |_ 5_carte.js
                |_ 6_carte.css
                |_ img/
                        |_ apartment.png
                        |_ bibliotheque.png
                        |_ book-shop.png
                        |_ fournisseur.png
                        |_ home.png
                        |_ quill-dessinant-une-ligne.png
                        |_ symbole-de-la-maison.png
                        |_ traiter.png
                        |_ voyageur-avec-une-valise.png
          |_ chronologie/
                |_ 1_chrono3.csv
                |_ 2_export_xlsx.py
                |_ 3_chrono3.xlsx
                |_ 3bis_chrono3.txt
                |_ 4_chrono.xqm
                |_ 5_chrono.js
                |_ 6_chrono.css
                |_ img/
                        |_ 1898_paix.png
                        |_ 1906_doucet.png
                        |_ 1907_spontini.jpg
                        |_ 1908_rene_jean.jpg
                        |_ 1909_louxor.png
    |_ traitement_TEI/
          |_ transfos_teiHeader/
                |_ transfo_tei_doucet.xq
                |_ typologies/
                        |_ 1_typologies.csv
                        |_ 2_typologies_id.py
                        |_ 3_typologies_modifie.csv
                        |_ 4_typologies.xq
          |_ transfos_body/
                |_ espace_lb.xsl
                |_ transfos_persName/
                        |_ 1_bulles_MAS_18juin.xlsx
                        |_ 2_index_personnes.csv
                        |_ 3_mise_a_jour_csv.py
                        |_ 4_index_personnes_joint.csv
                        |_ 5_index_personnes_joint_2.csv
                        |_ 6_reagencement.py
                        |_ 7_index_personnes_reagence.csv
                        |_ 8_fichier_de_travail_conversion_csv_xml.xq
                        |_ 8bis_alignement_bdd_csv.xml
                        |_ 9_transformation_finale_bdd.xq
    |_ docs_auxiliaires/
          |_ index/
                |_ export_index_lieux.xq
                |_ export_index_personnes.xq
                |_ modele_index_liens.xq
          |_ teiCorpus/
                |_ transfo_vers_corpus.xq
                |_ transfo_Corpus_index_persName.xq          
    |_ post_correction/
          |_ 1_extraction_fichiers/
                |_ 1_extraction_fichier_body.xq
                |_ 2_extraction_fichier_text_seul.xq
                |_ 3_changer_extension_vers_txt.py
          |_ 2_requete_api_gpt/
                |_ traitement_balises/
                        |_ corr_api_gpt_balises.ipynb                
                |_ traitement_texte_seul/
                        |_ corr_api_gpt_texte.ipynb
          |_ 3_evaluation_performance_gpt/
                        |_ pre_traitement/
                                    |_ pre_traitement.py
                        |_ distance_levenshtein.py
                        |_ score_bleu.py
                        |_ score_rouge.py                                           
          |_ 4_data/
                |_ 1_verite_terrain/
                        |_ gt_balises/
                                    |_ BINHA-Aut-143_02_192_corr.txt
                                    |_ bnf_naf13124_2_36_corr.txt
                                    |_ bnf_naf13124_2_56_corr.txt
                                    |_ bnf_naf13124_2_63_corr.txt
                        |_ gt_texte/
                                    |_ BINHA_Aut_143_02_192_corr.txt
                                    |_ bnf_naf13124_2_36_corr.txt
                                    |_ bnf_naf13124_2_56_corr.txt
                                    |_ bnf_naf13124_2_63_corr.txt
                |_ 2_input/
                        |_ fichiers_balises/
                                    |_ BINHA_Aut_143_02_192.txt
                                    |_ bnf_naf13124_2_36.txt
                                    |_ bnf_naf13124_2_56.txt
                                    |_ bnf_naf13124_2_63.txt
                        |_ fichiers_texte/
                                    |_ BINHA_Aut_143_02_192.txt
                                    |_ bnf_naf13124_2_36.txt
                                    |_ bnf_naf13124_2_56.txt
                                    |_ bnf_naf13124_2_63.txt
                |_ 3_fichiers_alignes_pour_evaluation/
                        |_ output_gpt/
                                    |_ BINHA_Aut_143_02_192.txt
                                    |_ bnf_naf13124_2_36.txt
                                    |_ bnf_naf13124_2_56.txt
                                    |_ bnf_naf13124_2_63.txt
                        |_ verite_terrain/
                                    |_ BINHA_Aut_143_02_192.txt
                                    |_ bnf_naf13124_2_36.txt
                                    |_ bnf_naf13124_2_56.txt
                                    |_ bnf_naf13124_2_63.txt
          |_ languageTool/
                |_ essai_correction_lt.py

```

 ### Citer le mémoire

 [Citation texte du mémoire]

 ```bibtex
 @thesis{charrier_pense_2024,
        location = {Paris},
        title = {Titre du mémoire},
        url = {https://github.com/pauline-charrier/M2-TNAH_Memoire/},
        pagetotal = {Nb de pages},
        institution = {École nationale des Chartes},
        type = {Mémoire pour le diplôme de master "Technologies numériques appliquées à l'histoire"},
        author = {Charrier, Pauline},
        urldate = {2024-09-15},
        date = {2024}
}

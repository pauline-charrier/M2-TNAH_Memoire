# Mémoire de stage du Master "Technologies numériques appliquées à l'histoire"

## *Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale*

Ce dépôt rassemble l'ensemble des documents relatifs au mémoire réalisé dans le cadre du stage de fin d'études du Master 2 "Technologies numériques appliquées à l'histoire".    
Ce stage, qui a également donné lieu à des livrables techniques, a été effectué au pôle "Edition numérique" du Service numérique de la recherche (SNR) de l'Institut national d'histoire de l'art et s'est étendu sur une durée de quatre mois, entre avril et juillet 2024.  

Le stage s'est concentré sur l'étude de la chaîne de traitement appliquée par le projet PENSE (2020-) pour la publication d'éditions numériques, du traitement de corpus textuels (XML-TEI) à l'exposition des données sur le web (développement d'interfaces utilisateur) en passant par la visualisation de données (Leaflet, Vis) et la correction automatique assistée par intelligence artificielle neuronale.
Une partie du stage a été consacrée à la chaîne de traitement appliquée dans le cadre du projet d'édition de la correspondance de Jacques Doucet (1853-1929), bibliophile et mécène, figure importante de l'histoire de l'actuel Institut national d'histoire de l'art, avec son bibliothécaire René-Jean (1879-1951) sur la période 1908-1929. 

### Plan du mémoire
```text

Partie I - PENSE : une chaîne de traitement d'édition numérique adossée à des pratiques établies en humanités numériques

Chapitre 1 - Présentation institutionnelle, scientifique et technologique du projet PENSE  
    1.1 - Historique, acteurs et objectifs  
        1.1.1 - A la genèse du projet : la constitution d'un service numérique de la recherche  
        1.1.2 - Une impulsion : l'acquisition du fonds Barye  
    1.2 - Architecture logicielle et choix techniques  
        1.2.1 - Des éditions numériques appuyées sur la technologie XML  
        1.2.2 - Un soin apporté au design d'interface  
    1.3 - Projets d'édition numérique actuellement en cours (2024)  
        1.3.1 - Des projets aux caractéristiques diverses  
        1.3.2 - La correspondance Doucet/René-Jean, un statut à part ?  
        
Chapitre 2 - De la transcription à l'enrichissement des sources : le traitement de corpus textuels  
    2.1 - De la numérisation à la "mise en données" : la transcription et le balisage, premières étapes de la curation de données  
        2.1.1 - Politique de transcription suivie  
        2.1.2 - Choix de balisage des textes  
    2.2 - L'encodage des métadonnées : transformations appliquées aux en-têtes TEI  
        2.2.1 - Enrichissement des métadonnées  
        2.2.2 - Préparation en amont d'une fonctionnalité d'interface  
    2.3 - L'encodage du corps du texte  
        2.3.1 - Protocole suivi pour l'enrichissement des noms de personnes  
        2.3.2 - Problèmes imputés à l'usage de Transkribus  

Chapitre 3 - Visualisation des données de la recherche : enjeux de représentation et d'intelligibilité  
    3.1 - "Parler aux yeux" (William Playfair) : de l'intérêt et des limites de la visualisation  
        3.1.1 - Recherche d'intelligibilité par la construction narrative : le "datastorytelling" et son application par le SNR  
        3.1.2 - La "visual literacy" et la gestion des biais  
    3.2 - La datavisualisation comme partie intégrante du processus heuristique de recherche  
        3.2.1 - La datavisualisation comme "outil procédural" au centre de la philosophie de PENSE  
        3.2.2 -   

Partie II - La philosophie PENSE : une approche originale au sein des projets français en humanités numériques

Chapitre 4 - Lutter contre une certaine "boîte noire" technologique : favoriser l'implication des chercheurs dans l'établissement des projets numériques  
    4.1 - Stratégie revendiquée : "approche web contre approche dite 'applicative'"  
        4.1.1 - Recherche d'intelligibilité contre quête de performance  
        4.1.2 - S'inscrire dans les principes "démocratiques" du web  
    4.2 - Une certaine prise de distance avec les procédés d'automatisation  
        4.1.2 - Conserver "le goût de l'archive" (Arlette Farge) : importance du recours aux tâches manuelles  
        4.2.2 - Frilosités institutionnelles possibles vis-à-vis de l'intelligence artificielle  
    4.3 - La technologie au service de la recherche  
        4.3.1 - L'importance du dialogue ingénieur/chercheur  
        4.3.2 - La technologie complémentaire au travail du chercheur  

Chapitre 5 - Introduire le "design thinking" dans la recherche en histoire de l'art : étude de cas d'une approche par prototypage du développement d'un outil d'interface web  
    5.1 - Le design thinking et son adoption dans les humanités numériques  
        5.1.1 - Un concept venu du monde industriel, destiné à stimuler l'innovation  
        5.1.2 - Vers une intégration dans les humanités numériques ?  
        5.1.3 - Le "design thinking" comme "cheval de Troie" néolibéral ? Une réflexion politique.  
    5.2 - Chronologie d'une gestion de projet : développement de citation automatique de l'édition numérique Barye, selon les principes du "design thinking"  
        5.2.1 - Prendre en compte les besoins de l'utilisateur ("empathie")  
        5.2.2 - Modéliser les fonctionnalités attendues ("conceptualisation")  
        5.2.3 - Créer, tester et affiner ("prototypage")  

Partie III - Dimension expérimentale du projet PENSE : étude des perspectives offertes par l'intelligence artificielle pour l'édition numérique

Chapitre 6 - L'IA au service de l'édition numérique savante, rapide tour d'horizon des applications possibles  
    6.1 - Histoire (non exhaustive) de l'intelligence artificielle  
        6.1.1 - La naissance d'un concept  
        6.1.2 - Courants symbolique et connexionniste  
        6.1.3 - Vers l'intelligence artificielle neuro-symbolique  
    6.2 - Perspectives ouvertes par la vision par ordinateur  
        6.2.1 - Traitement de l'image picturale  
        6.2.2 - Traitement de l'image comportant du texte (HTR/OCR/OLR/OMR...)  
    6.3 - Applications possibles en traitement automatique de la langue (IA symbolique et neuronale)  
        6.3.1 - Textométrie et analyse statistique des corpus textuels  
        6.3.2 - La correction automatique de textes : de l'IA symbolique au deep learning  

Chapitre 7 - Un exemple d'usage de l'IA neuronale en post-traitement de corpus textuels : correction automatique du corpus Doucet par grand modèle de langage (LLM). Protocole, résultats et alternatives.  
    7.1 - Le corpus Doucet : caractéristiques graphiques et objectifs de normalisation  
        7.1.1 - Typologie d'anomalies fréquemment rencontrées  
        7.1.2 - Résultat souhaité par la recherche  
        7.1.3 - Présentation des outils choisis  
    7.2 - Requêtage de l'API de GPT 3.5 pour la correction automatique de texte non balisé  
        7.2.1 - Présentation technique de l'outil  
        7.2.2 - Le prompt engineering ou l'art de parler au modèle en langage naturel  
        7.2.3 - Evaluation de la qualité du résultat obtenu  
        7.2.4 - Limites de l'expérience  
    7.3 - Quelles alternatives au LLM pour la correction du corpus Doucet ?  
        7.3.1 - La piste des modèles "Seq2Seq" (séquence à séquence) et MLM ("masked language model") à l'épreuve de la correction automatique  
        7.3.2 - L'approche plus "traditionnelle" des "rule-based-systems": l'exemple de LanguageTool

```    

### Description du dépôt 

Le dépôt contient les répertoires et fichiers suivants :  
- `CHARRIER_Memoire_M2TNAH.pdf`: mémoire de stage au format PDF.
- `memoire_latex/`: répertoire rassemblant les fichiers .tex du mémoire (document maître, chapitres et sections, images, bibliographie).
- `livrables_techniques/`: répertoire rassemblant les livrables techniques cités dans le mémoire.

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

Pauline Charrier, *Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale*, mémoire de master « Technologies numériques appliquées à l’histoire », dir. Jean-Damien Généro, École nationale des chartes, 2024, [https://github.com/pauline-charrier/M2-TNAH_Memoire](https://github.com/pauline-charrier/M2-TNAH_Memoire).  

 ```bibtex
 @thesis{charrier_pense_2024,
        location = {Paris},
        title = {Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale},
        url = {https://github.com/pauline-charrier/M2-TNAH_Memoire/},
        pagetotal = {Nb de pages},
        institution = {École nationale des chartes},
        type = {Mémoire pour le diplôme de master "Technologies numériques appliquées à l'histoire"},
        author = {Charrier, Pauline},
        urldate = {2024-09-30},
        date = {2024}
}

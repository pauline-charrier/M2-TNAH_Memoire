# Mémoire de stage du Master "Technologies numériques appliquées à l'histoire"

## *Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale*

Ce dépôt rassemble l'ensemble des documents relatifs au mémoire réalisé dans le cadre du stage de fin d'études du Master 2 "Technologies numériques appliquées à l'histoire".    
Ce stage, qui a également donné lieu à des livrables techniques, a été effectué au pôle "Edition numérique" du Service numérique de la recherche (SNR) de l'Institut national d'histoire de l'art et s'est étendu sur une durée de quatre mois, entre avril et juillet 2024.  

Le stage s'est concentré sur l'étude de la chaîne de traitement appliquée par le projet PENSE (2020-) pour la publication d'éditions numériques, du traitement de corpus textuels (XML-TEI) à l'exposition des données sur le web (développement d'interfaces utilisateur) en passant par la visualisation de données (Leaflet, Vis) et la correction automatique assistée par intelligence artificielle neuronale.
Une partie du stage a été consacrée à la chaîne de traitement appliquée dans le cadre du projet d'édition de la correspondance de Jacques Doucet (1853-1929), bibliophile et mécène, figure importante de l'histoire de l'actuel Institut national d'histoire de l'art, avec son bibliothécaire René-Jean (1879-1951) sur la période 1908-1929. 

## Plan du mémoire
###  Partie I - PENSE : une chaîne de traitement d'édition numérique adossée à des pratiques établies en humanités numériques
#### Chapitre 1 - Présentation institutionnelle, scientifique et technologique du projet PENSE  
```text
    1.1 - Historique, acteurs et objectifs  
        1.1.1 - A la genèse du projet : la constitution d'un service numérique de la recherche  
        1.1.2 - Une impulsion : l'acquisition du fonds Barye
    1.2 - Architecture logicielle et choix techniques  
        1.2.1 - Des éditions numériques appuyées sur la technologie XML  
        1.2.2 - Un soin apporté au design d'interface  
    1.3 - Projets d'édition numérique actuellement en cours (2024)  
        1.3.1 - Des projets aux caractéristiques diverses  
        1.3.2 - La correspondance Doucet/René-Jean, un statut à part ?
```
#### Chapitre 2 - De la transcription à l'enrichissement des sources : le traitement de corpus textuels
```text
    2.1 - De la numérisation à la "mise en données" : la transcription et le balisage, premières étapes de la curation de données  
        2.1.1 - Politique de transcription suivie  
        2.1.2 - Choix de balisage des textes
    2.2 - L'encodage des métadonnées : transformations appliquées aux en-têtes TEI  
        2.2.1 - Enrichissement des métadonnées  
        2.2.2 - Préparation en amont d'une fonctionnalité d'interface  
    2.3 - L'encodage du corps du texte  
        2.3.1 - Protocole suivi pour l'enrichissement des noms de personnes  
        2.3.2 - Problèmes imputés à l'usage de Transkribus
```

#### Chapitre 3 - Visualisation des données de la recherche : enjeux de représentation et d'intelligibilité
```text
    3.1 - "Parler aux yeux" (William Playfair) : de l'intérêt et des limites de la visualisation  
        3.1.1 - Recherche d'intelligibilité par la construction narrative : le "datastorytelling" et son application par le SNR  
        3.1.2 - La "visual literacy" et la gestion des biais  
    3.2 - La datavisualisation comme partie intégrante du processus heuristique de recherche  
        3.2.1 - La datavisualisation comme "outil procédural" au centre de la philosophie de PENSE  
        3.2.2 -  
```
### Partie II - La philosophie PENSE : une approche originale au sein des projets français en humanités numériques

#### Chapitre 4 - Lutter contre une certaine "boîte noire" technologique : favoriser l'implication des chercheurs dans l'établissement des projets numériques  
```text
    4.1 - Stratégie revendiquée : "approche web contre approche dite 'applicative'"  
        4.1.1 - Recherche d'intelligibilité contre quête de performance  
        4.1.2 - S'inscrire dans les principes "démocratiques" du web  
    4.2 - Une certaine prise de distance avec les procédés d'automatisation  
        4.1.2 - Conserver "le goût de l'archive" (Arlette Farge) : importance du recours aux tâches manuelles  
        4.2.2 - Frilosités institutionnelles possibles vis-à-vis de l'intelligence artificielle  
    4.3 - La technologie au service de la recherche  
        4.3.1 - L'importance du dialogue ingénieur/chercheur  
        4.3.2 - La technologie complémentaire au travail du chercheur 
```

#### Chapitre 5 - Introduire le "design thinking" dans la recherche en histoire de l'art : étude de cas d'une approche par prototypage du développement d'un outil d'interface web
```text
    5.1 - Le design thinking et son adoption dans les humanités numériques  
        5.1.1 - Un concept venu du monde industriel, destiné à stimuler l'innovation  
        5.1.2 - Vers une intégration dans les humanités numériques ?  
        5.1.3 - Le "design thinking" comme "cheval de Troie" néolibéral ? Une réflexion politique.  
    5.2 - Chronologie d'une gestion de projet : développement de citation automatique de l'édition numérique Barye, selon les principes du "design thinking"  
        5.2.1 - Prendre en compte les besoins de l'utilisateur ("empathie")  
        5.2.2 - Modéliser les fonctionnalités attendues ("conceptualisation")  
        5.2.3 - Créer, tester et affiner ("prototypage")  
```
### Partie III - Dimension expérimentale du projet PENSE : étude des perspectives offertes par l'intelligence artificielle pour l'édition numérique

#### Chapitre 6 - L'IA au service de l'édition numérique savante, rapide tour d'horizon des applications possibles  
```text
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
```

#### Chapitre 7 - Un exemple d'usage de l'IA neuronale en post-traitement de corpus textuels : correction automatique du corpus Doucet par grand modèle de langage (LLM). Protocole, résultats et alternatives.
```text
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
├───CHARRIER_Memoire_M2TNAH.pdf
├───livrables_techniques
│   ├───data_visualisations
│   │   ├───cartographie
│   │   │   └───img
│   │   └───chronologie
│   │       └───img
│   ├───docs_auxiliaires
│   │   ├───index
│   │   └───teiCorpus
│   ├───outil_citation
│   │   ├───alignement_identifiants
│   │   ├───extraction_donnees
│   │   ├───pretraitement
│   │   └───prototype_presente
│   ├───post_correction
│   │   ├───1_extraction_fichiers
│   │   ├───2_requete_api_gpt
│   │   │   ├───traitement_balises
│   │   │   └───traitement_texte_seul
│   │   ├───3_evaluation_performance_gpt
│   │   │   └───pre_traitement
│   │   ├───4_data
│   │   │   ├───1_verite_terrain
│   │   │   │   ├───gt_balises
│   │   │   │   └───gt_texte
│   │   │   ├───2_input
│   │   │   │   ├───fichiers_balises
│   │   │   │   └───fichiers_texte
│   │   │   └───3_fichiers_alignes_pour_evaluation
│   │   │       ├───output_gpt
│   │   │       └───verite_terrain
│   │   └───languageTool
│   └───traitement_TEI
│       ├───transfos_body
│       │   └───transfos_persName
│       └───transfos_teiHeader
│           └───typologies
└───memoire_latex
    ├───bibliographie
    ├───img
    └───templates
        ├───annexes
        │   ├───citation
        │   ├───dataviz
        │   │   ├───carte
        │   │   └───chronologie
        │   ├───docs_aux
        │   ├───postcorrection
        │   └───traitement_tei
        │       ├───body
        │       └───header
        ├───part1
        ├───part2
        └───part3

```

 ### Citer le mémoire

Pauline Charrier, *Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale*, mémoire de master « Technologies numériques appliquées à l’histoire », dir. Jean-Damien Généro, École nationale des chartes, 2024, [https://github.com/pauline-charrier/M2-TNAH_Memoire](https://github.com/pauline-charrier/M2-TNAH_Memoire).  

 ```bibtex
 @thesis{charrier_entre_2024,
        location = {Paris},
        title = {Entre pratiques éprouvées et ambitions expérimentales, le projet PENSE de l’INHA : une chaîne de traitement des sources de l’histoire de l’art, pour une édition numérique à double vocation, scientifique et patrimoniale},
        url = {https://github.com/pauline-charrier/M2-TNAH_Memoire/},
        pagetotal = {215},
        institution = {École nationale des chartes},
        type = {Mémoire pour le diplôme de master "Technologies numériques appliquées à l'histoire"},
        author = {Charrier, Pauline},        
        date = {2024}
}

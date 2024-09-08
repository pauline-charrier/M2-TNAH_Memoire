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
          |_ chronologie/
    |_ traitement_TEI/
    |_ docs_auxiliaires/
    |_ post_correction/
```

 ### Licence
 
 [Termes de la licence (CC-by-4.0)]

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

xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare option output:method "html";
declare option output:indent "yes";

(:Déclarations de variables:)
let $documents := collection("LesPapiersBarye")
let $fichier :=
  for $doc in $documents
  return $doc  

(:Définition de la transformation:)
let $transformation_doc :=
  for $fichier in collection("LesPapiersBarye_nettoyes")
  return
    let $titre := $fichier//tei:titleStmt/tei:title[@type='main']
    let $titreModifie :=
        if (matches($titre, '^ms'))
        then substring-after($titre, substring($titre, 1, 10))
        else if (matches($titre, '^BCMN'))
        then substring-after($titre, substring($titre, 1, 14))
        else $titre
    let $Calames := $fichier//tei:seriesStmt/tei:ref
    
    let $pbCount := count($fichier//tei:pb)
    let $chiffre := if ($pbCount > 1) then $pbCount else ()
    
    let $transfo_citation_doc :=
    <div class="col-sm-4">
      <div class="card-mb-3">
        <div class="card-body">
          <h5 class="card-title">
            {string($titreModifie)} {if ($chiffre) then concat(' (', $chiffre, ' ', 'feuillets)') else()},
          </h5>
          <p class="card-text">
            dans Victor Claass, Sophie Derrot, France Nerlich (dir.), <i>Les Papiers Antoine-Louis Barye</i>, Plateforme d&apos;édition numérique de sources enrichies, Paris, Institut national d&apos;histoire de l&apos;art, 2022.<br/> URL :
        <a href="https://barye.inha.fr/document/{$fichier//tei:sourceDesc//tei:idno}">Lien vers l&apos;édition numérique.</a><br/>
        {if (string($Calames)) then <a href="{$Calames}">Lien vers la notice Calames.</a> else ()}
          </p>
        </div>
      </div> 
    </div>       
  return $transfo_citation_doc

(:Template de sortie:)
let $html :=
  <html>
    <head>
      <title>Test des listes de citations</title>  
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>       
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">&amp;160;</script>   
    </head>
    <body>
    <div class="container">
      <div class="row">
        {$transformation_doc}
      </div>
    </div>      
    </body>
  </html>

(:instruction d'écriture et ajout de la déclaration html:)
let $fichierSortie := "CHEMIN_A_INDIQUER\citations_doc_multiples.html"
let $doctype := "<!DOCTYPE html>"
let $output := $doctype || serialize($html)
return file:write-text($fichierSortie, $output)
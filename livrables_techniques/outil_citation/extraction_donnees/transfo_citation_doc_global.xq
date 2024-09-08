xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare option output:method "html";
declare option output:indent "yes";

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
      <div style="text-align: justify">
        <span style="font-weight: bold">{string($titreModifie)} {if ($chiffre) then concat(' (', $chiffre, ' ', 'feuillets)') else()},</span>            
        <br/>
        dans Victor Claass, Sophie Derrot, France Nerlich (dir.), <i>Les Papiers Antoine-Louis Barye</i>,<br/> Plateforme d&apos;édition numérique de sources enrichies,<br/> Paris, <br/>Institut national d&apos;histoire de l&apos;art,<br/> 2022.<br/> URL :
        <a href="https://barye.inha.fr/document/{$fichier//tei:sourceDesc//tei:idno}">Lien vers l&apos;édition numérique.</a><br/>
        {if (string($Calames)) then <a href="{$Calames}">Lien vers la notice Calames.</a> else ()}
      <br/><br/></div>
  return <div>{$transfo_citation_doc}</div>

let $html :=
  <html>
    <head>
      <title>Test transformation BaseX - Bouton</title>      
    </head>
    <body>
      {$transformation_doc}
    </body>
  </html>

let $fichierSortie := "CHEMIN_A_INDIQUER\citations_doc.html"
return file:write-text($fichierSortie, serialize($html))
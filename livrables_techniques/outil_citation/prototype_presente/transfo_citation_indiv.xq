xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare option output:method "html";
declare option output:indent "yes";

(:Document individuel tiré de la base pour test:)
let $document := fn:doc("ARCHIVES_166_1_1_009.tei.xml")

(:Variables communes aux deux transformations:)
let $titre := $document//tei:titleStmt/tei:title[@type='main']
let $titreModifie :=
  if (matches($titre, '^ms'))
  then substring-after($titre, substring($titre, 1, 10))
  else if (matches($titre, '^BCMN'))
  then substring-after($titre, substring($titre, 1, 14))
  else $titre
let $Calames := $document//tei:seriesStmt/tei:ref
let $pbCount := count($document//tei:pb)
let $chiffre := if ($pbCount > 1) then $pbCount else ()

(:transformation à l'échelle du document:)
let $transformation_doc :=          
    let $transfo_citation_doc :=
      <div class="citation">
        <div class="citation-copiee">
          <span class="titre_doc">{string($titreModifie)} {if ($chiffre) then concat(' (', $chiffre, ' ', 'feuillets)') else()},</span><br/> dans Victor Claass, Sophie Derrot, France Nerlich (dir.), <i>Les Papiers Antoine-Louis Barye</i>, Plateforme d&apos;édition numérique de sources enrichies, Paris, Institut national d&apos;histoire de l&apos;art, 2022.
        </div>
        URL :
        <a href="https://barye.inha.fr/document/{$document//tei:sourceDesc//tei:idno}">Lien vers l&apos;édition numérique.</a><br/>
        {if (string($Calames)) then <a href="{$Calames}">Lien vers la notice Calames.</a> else ()}
      </div>
  return <div>{$transfo_citation_doc}</div>
  
(:transformation à l'échelle de la page:)
let $transformation_page :=  
  let $transfo_citation_page :=
    <div class="citation">
      <div class="citation-copiee">
        <div class="titre_page">{string($titreModifie)}, <span class="numero-page"></span></div>dans Victor Claass, Sophie Derrot, France Nerlich (dir.), <i>Les Papiers Antoine-Louis Barye</i>, Plateforme d&apos;édition numérique de sources enrichies, Paris, Institut national d&apos;histoire de l&apos;art, 2022.
      </div>
      URL :
        <a href="https://barye.inha.fr/document/{$document//tei:sourceDesc//tei:idno}">Lien vers l&apos;édition numérique.</a><br/>
        {if (string($Calames)) then <a href="{$Calames}">Lien vers la notice Calames.</a> else ()}      
    </div>
 return <div>{$transfo_citation_page}</div>
 
(:page html de sortie:)
let $html :=
  <html>
    <head>
      <title>Test transformation BaseX - Bouton</title>
         
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/> 
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
      <link rel="stylesheet" href="fichiers_externes/papiers_Barye.css"/>          
      <script src="https://code.jquery.com/jquery-3.6.0.min.js">&amp;160;</script>  
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">&amp;160;</script>         
      <script src="fichiers_externes/papiers_Barye.js">&amp;160;</script>     
    </head>
    
    <body>
    <h1 style="text-align: center">Page de test</h1>
      <h2 style="text-align: center">{string($titreModifie)}</h2>
      <br/>
      <br/>
      <br/>
      
      <h4>Boutons de navigation servant à tester l&apos;actualisation du bouton</h4><br/><br/>
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="tab-page-1" data-bs-toggle="tab" data-bs-target="#page-1" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Page <span>1</span></button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-page-2" data-bs-toggle="tab" data-bs-target="#page-2" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Page <span>2</span></button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-page-3" data-bs-toggle="tab" data-bs-target="#page-3" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Page <span>3</span></button>
        </li>        
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-page-4" data-bs-toggle="tab" data-bs-target="#page-4" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Page <span>4</span></button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab-page-5" data-bs-toggle="tab" data-bs-target="#page-5" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Page <span>5</span></button>
        </li> 

        
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="page-1" role="tabpanel" aria-labelledby="tab-page-1" tabindex="0">Contenu page 1</div>
        <div class="tab-pane fade" id="page-2" role="tabpanel" aria-labelledby="tab-page-2" tabindex="0">Contenu page 2</div>
        <div class="tab-pane fade" id="page-3" role="tabpanel" aria-labelledby="tab-page-3" tabindex="0">Contenu page 3</div>
        <div class="tab-pane fade" id="page-4" role="tabpanel" aria-labelledby="tab-page-4" tabindex="0">Contenu page 4</div>
        <div class="tab-pane fade" id="page-5" role="tabpanel" aria-labelledby="tab-page-5" tabindex="0">Contenu page 5</div>

      </div><br/><br/>
      
      <!-- Bouton de citation -->
      <h4>Bouton de citation</h4><br/>
      <button id="button-popover">Citer cette source</button><br/><br/><br/>
      
      <!-- Div cachées stockant la valeur des résultats des transformations -->
      <h4>Div cachées</h4><br/>
      <div id="transformation-doc" style="display:none">     
        {$transformation_doc} 
      </div>
      <div id="transformation-page" style="display:none">
        {$transformation_page}
      </div>           
            
    </body>
  </html>

(:instruction d'écriture et ajout de la déclaration html:)
let $fichierSortie := "CHEMIN_A_INDIQUER\citations_doc_indiv.html"
let $doctype := "<!DOCTYPE html>"
let $output := $doctype || serialize($html)
return file:write-text($fichierSortie, $output)
xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";

(: Fonction pour convertir le contenu CSV en XML :)
declare function local:traiterCsv($contenu as xs:string) as element()* {
  let $lignes := tokenize($contenu, '\n')
 
  return 
    <index>
    {
      for $ligne in $lignes
      let $champs := tokenize($ligne, ';')
      return 
      
      <person>
        <num>{ $champs[1] }</num>
        <version_texte>{ $champs[2] }</version_texte>
        <version_corrigee>{ $champs[3] }</version_corrigee>
        <version_unifiee>{ $champs[4] }</version_unifiee>
        <id>{ $champs[5] }</id>
        <type>{ $champs[6] }</type>
        <lieu>{ $champs[7] }</lieu>
        <ref_agorha>{ $champs[8] }</ref_agorha>
        <bio>{ $champs[9] }</bio>
      </person>
    }
      
    </index>
};

(: Lire le fichier CSV :)
let $csv-path := 'CHEMIN_A_COMPLETER\index_personnes_reagence.csv'
let $csv-content := file:read-text($csv-path)

(: Convertir le contenu CSV en XML :)
let $csv := local:traiterCsv($csv-content)

(:return $csv//person/version_texte/text():)


(: Test :)
let $transformation :=
  let $resultats :=
  for $doc in collection('Doucet2')
  for $persName in $doc//*:persName
  let $matching-persons := 
    for $person in $csv//person
    where $person/version_texte = $persName
    return $person
  return
    if (empty($matching-persons)) then
          <person2>
             <persName_DB>{ $persName }</persName_DB>
              <nom_csv>Aucun résultat</nom_csv>
          </person2>     
    else
      for $person in $matching-persons
      return
              <person>
                <persName_DB>{ $persName/text() }</persName_DB>
                <nom_csv>{ $person/version_texte/text() }</nom_csv>
                <key>{ $person/version_unifiee/text() }</key>
                <correct>{ $person/version_corrigee/text() }</correct>
                <xml-id>{ $person/id/text() }</xml-id>
                <type>{$person/type/text()}</type>
                <subtype>{$person/lieu/text()}</subtype>
                <ref-agorha>{$person/ref_agorha/text()}</ref-agorha>
                <bio>{$person/bio/text()}</bio>
              </person>
          
       return         
         <index>
           { $resultats }
         </index>

        

return
file:write("..\..\..\..\Documents\GitHub\stage_2024\Corpus_Doucet\Traitement_TEI\manipulations_persnames_body\alignement_bdd_csv.xml", $transformation)
    
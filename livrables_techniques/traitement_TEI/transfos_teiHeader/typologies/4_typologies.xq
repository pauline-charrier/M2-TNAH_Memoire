declare namespace tei="http://www.tei-c.org/ns/1.0";

(: Fonction personnalisée pour parser le CSV avec tabulations :)
declare function local:traiterCsv($contenu as xs:string) as element()* {
  (: Séparer les lignes en fonction des sauts de ligne :)
  let $lignes := tokenize($contenu, '\n') 
  return for $ligne in $lignes
         (: Séparer les champs par tabulation :)
         let $champs := tokenize($ligne, '\t') 
         return 
         <row>{
           for $field in $champs
           return <field>{ fn:normalize-space($field) }</field>
         }</row>
};

(: Charger le fichier CSV comme une chaîne de caractères :)
(: chemin relatif depuis BaseX110/basex/bin :)
let $csv-text := file:read-text('CHEMIN_A_COMPLETER\typologies\typologies_modifie.csv')

(: Utiliser la fonction personnalisée pour obtenir les données CSV :)
let $csv-data := local:traiterCsv($csv-text)



(: Traiter les données du CSV :)
for $row in $csv-data
let $id2 := $row/field[3] 
let $typologie := $row/field[2] 
let $terms := tokenize($typologie, ';')

(: Traiter chaque fichier TEI :)
for $file in collection('Doucet_ex')
let $idno := $file//*:sourceDesc//*:idno/text()
where $idno = $id2
let $newTerms := 
  <tei:textClass>
    <tei:keywords>
    {
          for $term in $terms
          return 
          <tei:term>
            { fn:normalize-space($term) }
          </tei:term>
    }
    </tei:keywords>
  </tei:textClass>


return
(
  
    insert node $newTerms into $file//*:teiHeader/*:profileDesc
)

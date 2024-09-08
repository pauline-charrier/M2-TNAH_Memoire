declare option output:method "html";
declare option output:indent "yes";

let $c := collection('Lettres_Doucet')

 (: $liste est une boucle qui itère sur chaque placeName :)
let $liste := for $a in $c//*:placeName//text()
  (:$texte est une version normalisée de chaque placeName :)
  let $texte := normalize-space($a) 
     (:précision qui exclut les placeName vides - car ils doivent forcément avoir une longueur:)
    where string-length($texte)
  (:$id est l'identifiant correspondant à chaque placeName:) 
  let $id := $a/ancestor::*:TEI//*:teiHeader//*:idno 
  (:formation du lien vers chaque document:)
  let $id2 := concat('https://basex.inha.fr/Corpus-Capta/Doucet-ReneJean/document/', $id) 
  (:deuxième variable qui transforme le placeName en bas de casse:)
  let $texte2 := lower-case($texte)
    (:permet de rassembler les placeName similaires en un seul placeName:)
    group by $texte2 
  (:permet de compter le nombre d'occurrences :)
  let $nbr := count($id) 
  
  (:variable qui stocke un tableau, avec UN placeName, UN nombre d'occurrence, et PLUSIEURS id à chaque passage de boucle :)
  let $tableau-html := 
  <html>
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Index des lieux</title>
  </head>
  <body>
    <table>  
      <tbody>   
        <tr>
          <td scope="row">{$texte[1]}</td>
          <td>{$nbr}</td>
          {for $id3 in $id2 
          let $id3-bis := substring-after($id3, 'document/')
          return <td><a href="{$id3}">Voir occurrence(s) dans {$id3-bis}</a></td>}
        </tr>   
      </tbody>
    </table>
  </body>
  </html>
  
  (:le tableau est classé par ordre décroissant d'occurrences:)
  order by $nbr descending 
  
return $tableau-html
return file:write-text("CHEMIN_A_INDIQUER/index_lieux.html", serialize($liste))
(: Code pour extraire automatiquement tous les fichiers de la base :)
(: au format texte brut :)
(: Le code n'extrait que le contenu du //text() ! :)

import module namespace file = "http://expath.org/ns/file";

let $files := collection('Doucet_2')//*:TEI
for $file in $files
let $filename := replace(base-uri($file), '^.*/([^/]+)$', '$1')
let $output-path := concat('CHEMIN_VERS_BASE\BDD_resultat\', replace($filename, '\.tei.xml$', '.txt'))
return
  (
    file:write($output-path, serialize($file, map { 'method': 'text', 'indent': 'no', 'encoding': 'UTF-8' })),
    $output-path
  )

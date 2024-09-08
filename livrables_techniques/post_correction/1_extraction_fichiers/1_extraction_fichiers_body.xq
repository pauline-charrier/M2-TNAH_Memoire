(: Script XQuery pour extraire dans des fichiers .tei.xml seulement les noeuds entre <body></body> :)
(: Cela afin d'alléger le nombre de tokens API :)

import module namespace file = "http://expath.org/ns/file";

let $files := collection('Doucet_2')//*:TEI
for $file in $files
let $filename := replace(base-uri($file), '^.*/([^/]+)$', '$1')
let $output-path := concat('CHEMIN_VERS_BASE\BDD_resultat2\', $filename)
let $body-content := $file//*:body
return
  (
    file:write($output-path, serialize($body-content)),
    $output-path
  )
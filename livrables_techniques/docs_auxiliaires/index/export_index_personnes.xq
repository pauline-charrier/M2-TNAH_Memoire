declare namespace tei="http://www.tei-c.org/ns/1.0";
let $c := collection('Lettres_Doucet')

let $liste := for $a in $c//*:persName//text()

let $texte := normalize-space($a)
where string-length($texte)

let $id := $a/ancestor::*:TEI//*:teiHeader//*:idno

let $texte2 := lower-case($texte)
group by $texte2

let $nbr := count($id)
order by $nbr descending

return
$texte[1] || "; " || $nbr || "; " || <url>{for $url in $id return $url|| "; "}</url> || "; "

let $csv := string-join($liste, "&#10;")
return file:write-text("CHEMIN_A_SPECIFIER\index_personnes_2.csv", $csv, "utf-8")

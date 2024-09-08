let $c := collection('Lettres_Doucet')

let $liste := for $a in $c//*:placeName//text()
let $texte := normalize-space($a)
where string-length($texte)
let $id := $a/ancestor::*:TEI//*:teiHeader//*:idno
let $texte2 := lower-case($texte)
group by $texte2
let $nbr := count($id)
let $tableau := ($texte,$nbr,string-join($id,'; '))
order by $nbr descending
return
$texte[1] || "; " || $nbr || "; " || <url>{for $url in $id return $url|| "; "}</url> || "; "

let $csv := string-join($liste, "&#10;")
return file:write-text("CHEMIN_A_SPECIFIER\index_lieux_2.csv", $csv, "utf-8")
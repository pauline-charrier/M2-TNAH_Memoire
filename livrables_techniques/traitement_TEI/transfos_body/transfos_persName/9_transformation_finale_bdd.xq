let $base := collection('Doucet2')

let $style :=
<xsl:stylesheet version='3.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:prefix1="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="prefix1">       
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" />

  <!-- Variable pour charger le fichier XML à partir du CSV -->
  <!-- Attention au chemin : j'ai placé manuellement le fichier d'alignement dans 'BaseX110\basex\bin' pour éviter les ennuis  -->
  <xsl:variable name="csv-data" select="document('alignement_bdd_csv.xml')"/>


  <!-- Template de correspondance pour le document TEI -->
  <xsl:template match="/tei:TEI">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Template de correspondance pour persName -->
  <xsl:template match="tei:persName">
    <xsl:variable name="current-name" select="text()"/>
    <xsl:variable name="person" select="$csv-data/index/person[persName_DB = $current-name]"/>
    
    <!-- Filtrage pour éviter les doublons -->
    <xsl:variable name="unique-person" select="$person[1]"/>
    
    <xsl:choose>
      <xsl:when test="not(empty($person))">
        <xsl:element name="persName">
          <xsl:attribute name="key">
            <xsl:value-of select="$unique-person/key"/>
          </xsl:attribute>
          <xsl:attribute name="xml:id">
            <xsl:value-of select="$unique-person/xml-id"/>
          </xsl:attribute>
          <xsl:attribute name="type">
            <xsl:value-of select="$unique-person/type"/>
          </xsl:attribute>
          <xsl:if test="normalize-space($unique-person/lieu) != ''">
            <xsl:attribute name="subtype">
              <xsl:value-of select="$unique-person/subtype"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="normalize-space($unique-person/ref_agorha) != ''">
            <xsl:attribute name="ref-agorha">
              <xsl:value-of select="$unique-person/ref_agorha"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Template pour copier les autres éléments -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>

let $transfos :=
for $page at $pos in $base
    let $id := base-uri($page)
    let $transfo := xslt:transform($page,$style)
   return $transfo

let $chemins := 
  for $transfo in $transfos
    let $url_1 := replace($transfo/*:TEI//*:idno/text(), ', ', '_')
    let $url_2 := replace($url_1, '. ', '_')
  return $url_2||'.tei.xml'

return (db:create('Doucet3',$transfos, $chemins))

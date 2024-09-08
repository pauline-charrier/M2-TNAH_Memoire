<!-- A insérer dans le document "./transformations_tei_header/transfo_tei_doucet" -->
<!-- juste avant la fermeture de la balise <xsl:stylesheet> -->

<xsl:template match="//*:lb">
    <xsl:copy-of select="."/>
    <xsl:text>&#x20;</xsl:text>
</xsl:template>
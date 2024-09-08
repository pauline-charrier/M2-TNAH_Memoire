let $doc := doc('CHEMIN_A_COMPLETER\doucet3.tei.xml')

let $style := 
<xsl:stylesheet version='3.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">       
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" />
    
    <!-- Le chemin ici est localisé dans 'BaseX110\basex\bin' -->
    <xsl:variable name="alignement" select="document('alignement_bdd_csv.xml')"/>

    <xsl:template match="teiCorpus">
        <xsl:copy>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>TEI Corpus comprenant les 98 fichiers du corpus de correspondances Doucet</title>
                        <author>SNR</author>
                    </titleStmt>
                    <publicationStmt>
                        <p>Présentation du projet d&apos;édition numérique</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Présentation des sources</p>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p>Présentation de la politique d&apos;encodage</p>
                </encodingDesc>
                <profileDesc>
                    <creation>
                        <country key="FR">France</country>
                        <lang xml:lang="fr">Français</lang>
                        <date>Date de l&apos;édition</date>
                    </creation>
                    
                    <!-- Ajout du particDesc ici -->
                    <particDesc>
                        <listPerson>
                            <xsl:for-each select="$alignement/index/person">
                                <xsl:sort select="xml-id/text()" data-type="text" order="ascending"/>
                                <xsl:if test="not(preceding-sibling::person/xml-id = current()/xml-id)">
                                    <xsl:element name="person" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="xml:id">
                                            <xsl:value-of select="xml-id"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="key">
                                            <xsl:value-of select="key"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="type">
                                            <xsl:value-of select="type"/>
                                        </xsl:attribute>
                                        <xsl:if test="normalize-space(subtype) != ''">
                                            <xsl:attribute name="subtype">
                                                <xsl:value-of select="subtype"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:if test="normalize-space(ref-agorha) != ''">
                                            <xsl:attribute name="ref-agorha">
                                                <xsl:value-of select="ref-agorha"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <persName>
                                            <xsl:value-of select="correct"/>
                                        </persName>
                                        <note>
                                            <xsl:value-of select="bio"/>
                                        </note>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:for-each>
                        </listPerson>
                    </particDesc>
                </profileDesc>

            </teiHeader>
            <xsl:apply-templates select="node() except teiHeader"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template pour transformer les persName dans le body -->
    <xsl:template match="tei:body//tei:persName">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Transformer @xml:id en @ref et ajouter le "#" dans le body -->
    <xsl:template match="tei:body//tei:persName/@xml:id">
        <xsl:attribute name="ref">
            <xsl:value-of select="concat('#', .)"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Copier les autres attributs normalement -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

(: Production d'un nouveau fichier teiCorpus :)
return file:write('doucet3_neuf.tei.xml', xslt:transform($doc, $style))

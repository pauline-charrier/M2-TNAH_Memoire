declare option output:method 'html';
let $xml:= doc('CHEMIN_VERS_LE_FICHIER_TEI')
let $xsl := 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    version="2.0">  
    <xsl:output method="html"/>                
        <xsl:template match="//titleStmt/title[@type='main']">            
            <xsl:choose>                
                <xsl:when test="matches(//titleStmt/title[@type='main'], '^ms')">                    
                    <xsl:value-of select="substring-after(//titleStmt/title[@type='main'], substring(//titleStmt/title[@type='main'], 1, 10))" />                
                </xsl:when>
                <xsl:when test="matches(//titleStmt/title[@type='main'], '^BCMN')">
                    <xsl:value-of select="substring-after(//titleStmt/title[@type='main'], substring(//titleStmt/title[@type='main'], 1, 14))" />
                </xsl:when>
                <xsl:otherwise>                    
                    <xsl:value-of select="//titleStmt/title[@type='main']"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>   
             
        <xsl:template match="//seriesStmt">            
            <xsl:if test="string(ref)">                
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="//seriesStmt/ref"/>
                    </xsl:attribute>
                    <xsl:text>Lien vers la notice Calames.</xsl:text>
                </a>
            </xsl:if>
        </xsl:template>      
         
        <xsl:template match="/">
             <div>                           
                            <xsl:apply-templates select="//titleStmt/title[@type='main']"/>                            
                            <xsl:text>, </xsl:text>
                            dans Victor Claass, Sophie Derrot, France Nerlich (dir.), <i>Les Papiers
                                Antoine-Louis Barye</i>, Plateforme d'édition numérique de sources enrichies,
                                Paris, Institut national d'histoire de l'art, 2022. URL :                             
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:text>https://barye.inha.fr/document/</xsl:text>
                                    <xsl:value-of select="//sourceDesc//idno"/>
                                </xsl:attribute>
                                <xsl:text>Lien vers l'édition numérique.</xsl:text>
                            </a>
                            <xsl:text> </xsl:text>                           
                            <xsl:apply-templates select="//seriesStmt"/>
                         </div>             
        </xsl:template>     
   </xsl:stylesheet>
   
return xslt:transform($xml, $xsl)
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:frus="http://history.state.gov/frus/ns/1.0"
    xmlns:functx="http://www.functx.com" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="3.0">

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:div[@subtype = 'message-of-the-president']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="subtype">historical-document</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:div[ancestor::tei:back][@type = 'section'][not(@subtype)]">
        <xsl:choose>
            <xsl:when test=".[matches(@xml:id, '[Aa]ppendix')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">appendix</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '[Ee]rrata')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">errata</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Ii]ndex|[Pp]ersons|[Ss]ubjects)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">index</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '[Mm]aps?')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">maps</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

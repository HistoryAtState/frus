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

    <xsl:variable name="volume-dates-min" select="//frus:coverage/@notBefore"/>
    <xsl:variable name="volume-dates-max" select="//frus:coverage/@notAfter"/>

    <!-- Add volumes dates as @frus:doc-dateTime-min and @frus:doc-dateTime-max to editorial notes and errata statements for document numbering errors -->

    <xsl:template match="tei:div[@subtype = ('editorial-note', 'errata_document-numbering-error')]">
        <xsl:choose>
            <xsl:when test="not(empty($volume-dates-min)) and not(empty($volume-dates-max))">
                <xsl:choose>
                    <xsl:when test=".[not(@frus:doc-dateTime-min)]">
                        <xsl:copy>
                            <xsl:apply-templates select="@*"/>
                            <xsl:attribute name="frus:doc-dateTime-min">
                                <xsl:value-of select="$volume-dates-min"/>
                            </xsl:attribute>
                            <xsl:attribute name="frus:doc-dateTime-max">
                                <xsl:value-of select="$volume-dates-max"/>
                            </xsl:attribute>
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

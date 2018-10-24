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
    <xsl:variable name="volume-year-min"
        select="substring-before(xs:string($volume-dates-min), '-')"/>
    <xsl:variable name="volume-dates-max" select="//frus:coverage/@notAfter"/>
    <xsl:variable name="volume-year-max"
        select="substring-before(xs:string($volume-dates-max), '-')"/>

    <!-- Add volume-level `content date` -->
    <xsl:template match="tei:publicationStmt">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            
            <xsl:choose>
                <xsl:when
                    test=".[not(tei:date[matches(attribute::type, 'content-date')]) and ancestor::tei:teiHeader/tei:xenoData/frus:coverage]">

                    <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">content-date</xsl:attribute>
                        <xsl:attribute name="calendar">gregorian</xsl:attribute>
                        <xsl:attribute name="notBefore">
                            <xsl:value-of select="$volume-dates-min"/>
                        </xsl:attribute>
                        <xsl:attribute name="notAfter">
                            <xsl:value-of select="$volume-dates-max"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="$volume-year-max eq $volume-year-min">
                                <xsl:value-of select="$volume-year-max"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="concat($volume-year-min, ' to ', $volume-year-max)"/>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

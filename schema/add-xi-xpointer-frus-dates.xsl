<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:frus="http://history.state.gov/frus/ns/1.0"
    xmlns:functx="http://www.functx.com" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" exclude-result-prefixes="xs" version="3.0">

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- 1. Add xmlns:xi to TEI -->

    <xsl:template match="tei:TEI">

        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:namespace name="xi">http://www.w3.org/2001/XInclude</xsl:namespace>

            <xsl:apply-templates select="node()"/>

        </xsl:copy>
    </xsl:template>

    <!-- 2. Add classDecl/xi:include to encodingDesc -->

    <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc">

        <xsl:choose>
            <xsl:when test=".[not(child::tei:classDecl)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>

                    <xsl:element name="classDecl" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="xi:include">
                            <xsl:attribute name="href">../shared/frus-dates.xml</xsl:attribute>
                            <xsl:attribute name="xpointer">frus-dates</xsl:attribute>
                        </xsl:element>
                    </xsl:element>
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

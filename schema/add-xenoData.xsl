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

    <!-- 1. Add descendant min/max dates as @frus:doc-dateTime-min and @frus:doc-dateTime-max to //teiHeader -->

    <xsl:template match="tei:Header">

        <xsl:variable name="earliest">
            <xsl:for-each select="tei:TEI//tei:div/@frus:doc-dateTime-min">
                <xsl:sort select="." order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="latest">
            <xsl:for-each select="tei:TEI//tei:div/@frus:doc-dateTime-max">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test=".[not(descendant::tei:xenoData)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>

                    <xenoData>
                        <xsl:element name="frus:coverage">
                            <xsl:attribute name="frus:doc-dateTime-min">
                                <xsl:value-of select="$earliest"/>
                            </xsl:attribute>
                            <xsl:attribute name="frus:doc-dateTime-max">
                                <xsl:value-of select="$latest"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xenoData>

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

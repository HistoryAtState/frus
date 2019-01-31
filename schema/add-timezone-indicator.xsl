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
    
    <xsl:template match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., 'Berlin')]]">
        <xsl:choose>
            
            <xsl:when
                test=".[matches(xs:string(data(.)), '1941-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[matches(xs:string(data(.)), '189(4|5|6|7|8|9)-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[matches(xs:string(data(.)), '191(1|2|3|4|5|9)-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[matches(xs:string(data(.)), '19(0|2|3|5|6|7)\d{1}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

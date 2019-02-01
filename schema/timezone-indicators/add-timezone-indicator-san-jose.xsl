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

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(San Jose|San José)')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1921 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1921-01-14T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:36')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1920 to 1979 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-01-15T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1954-01-23T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-01-24T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1954-06-25T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-06-26T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1979-02-24T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-02-25T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1979-06-02T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-06-03T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-02-23T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1980s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-02-24T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-05-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-06-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-01-18T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-01-19T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-06-30T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-07-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-01-17T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-01-18T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-03-14T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-15T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('2009-12-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
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

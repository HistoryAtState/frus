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
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Vienna)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1893 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1893-03-31T11:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:05')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1894 to 1916 -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1893-04-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1916-04-30T22:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1917 to 1940 -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-04-30T23:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1916-10-01T00:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-10-01T01:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1917-04-16T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-04-16T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1917-09-17T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-09-17T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1918-04-15T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-15T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1918-09-16T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-16T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1920-04-05T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-05T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1918-09-13T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-13T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1940-04-01T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1940s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-04-01T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1942-11-02T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-11-02T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1943-03-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-03-29T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1943-10-04T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-10-04T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1944-04-03T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-04-03T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1944-10-02T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-10-02T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1945-04-02T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-02T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1945-04-12T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-12T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1946-04-14T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-14T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1946-10-06T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-06T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1947-04-06T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-06T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1947-10-05T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-10-05T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1948-04-18T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-04-18T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1948-10-03T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1948 to 1980 -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-10-03T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-04-05T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1980s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-06T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-09-27T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-09-28T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1981-03-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-29T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1981-09-27T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-09-27T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1982-03-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-03-28T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1982-09-26T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-09-26T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1983-03-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-03-27T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1983-09-25T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-09-25T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1984-03-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-03-25T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1984-09-30T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-09-30T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1985-03-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-03-31T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1985-09-29T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-09-29T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1986-03-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-30T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1986-09-28T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-09-28T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1987-03-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-29T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1987-09-27T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-09-27T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1988-03-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-27T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1988-09-25T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-09-25T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1989-03-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-26T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1989-09-24T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-09-24T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1990-03-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1990s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-25T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1990-09-30T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-09-30T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-03-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-31T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-09-29T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-29T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-03-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-29T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-09-27T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-09-27T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1993-03-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-26T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1993-09-26T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-09-26T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1994-03-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-25T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1994-09-25T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-09-25T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1995-03-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-26T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1995-09-24T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-09-24T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1996-03-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-31T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1996-10-27T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1997-03-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-30T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1997-10-26T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1998-03-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1998-10-25T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1999-03-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T02:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1999-10-31T02:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T03:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('2000-03-26T01:59:59'))]">
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

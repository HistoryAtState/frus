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

    <!-- Berlin and Bonn -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Berlin|Bonn)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1893-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:53')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1893-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-04-30T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-04-30T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-10-01T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-10-01T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-04-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-04-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-09-17T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-09-17T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-04-15T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-15T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-09-16T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-16T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-04-01T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-04-01T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-11-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-11-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-05-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-05-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-11-01T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-11-01T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-04-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-05-11T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-05-11T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-06-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-06-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-10-05T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-10-05T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-04-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-04-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-04-10T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-10T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-04-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-09-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-09-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-09-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-09-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-26T02:00:00'))]">
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


    <!-- Buenos Aires -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Buenos Aires)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1894 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1894-10-31T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:53')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1894-10-31T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1920-05-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:16')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-05-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-12-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-12-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1940s -->


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-07-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-07-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-06-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-06-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-08-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-08-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1963-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1960s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-12-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-12-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-04-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-04-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-04-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-04-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-10-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-10-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-04-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-04-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-10-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-10-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-01-23T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-01-23T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-05-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-05-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-12-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-12-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-10-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-03-04T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-04T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-10-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-10-20T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-20T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-10-18T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-18T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-03:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!--

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(?)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime(''))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    -->


    <!-- Guatemala City -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Guatemala)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">

        <xsl:choose>

            <!-- 1800 to 1918 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-10-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:02')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1918 to 1973 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-10-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-11-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1970s to 2006 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-11-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-02-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-02-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-05-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-05-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-23T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-23T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2006-04-30T00:00:00'))]">
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

    <!-- Havana | Habana -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Habana|Havana)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">

        <xsl:choose>

            <!-- 1800 to 1925 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1925-07-01T12:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:29')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-07-01T12:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-06-10T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-06-10T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-10-10T12:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-10-10T12:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-06-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-06-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-09-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-09-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-06-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-06-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-09-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-09-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-06-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-06-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-09-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-09-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-06-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-06-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-09-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-06-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-06-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-09-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-09-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-06-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-06-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-09-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-09-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-06-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-06-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-10-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-04-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-04-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-09-10T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-09-10T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-04-14T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-04-14T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-09-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-09-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-04-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-04-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-10-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1970s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-10-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1970-04-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-04-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1970-10-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-10-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-04-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-04-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-10-31T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-10-31T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-04-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-04-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-10-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-10-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-04-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-04-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-10-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-10-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-04-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-04-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-10-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-04-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-04-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-10-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-04-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-04-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-10-31T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-10-31T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-04-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-04-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-10-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-10-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-05-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-05-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-10-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-03-18T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-03-18T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-10-14T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-10-14T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-03-16T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-03-16T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-10-12T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1980s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-10-12T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-05-10T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-05-10T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-10-11T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-10-11T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-05-09T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-05-09T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-10-10T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-10-10T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-05-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-05-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-10-09T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-10-09T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-05-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-05-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-10-14T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-10-14T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-05-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-05-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-10-13T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-10-13T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-03-16T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-16T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-10-12T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-10-12T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-03-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-10-11T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-10-11T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-03-20T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-20T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-10-09T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-10-09T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-19T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-19T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-10-08T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-08T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-10-14T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-14T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-04-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-04-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-10-13T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-13T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-04-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-04-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-10-11T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-11T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-04-04T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-04-04T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-10-10T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-10-10T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-04-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-04-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-10-09T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-10-09T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-04-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-04-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-10-08T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-10-08T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-04-07T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-04-07T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-06T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-06T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-04-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-04-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-12T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-12T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-04-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- London -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(London)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1920 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1847-12-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:01')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1847-12-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-05-21T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-05-21T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-10-01T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-10-01T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-04-08T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-04-08T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-09-17T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-09-17T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-03-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-03-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1920-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1920-10-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-10-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1921-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1921-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1922-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1922-10-08T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-10-08T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1923-04-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-04-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1923-09-16T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-09-16T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-03-13T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-03-13T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-09-21T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-09-21T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1925-04-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-04-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1925-10-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-10-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-04-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-04-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-04-10T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-04-10T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-04-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-04-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-04-21T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-04-21T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-10-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-10-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-04-13T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1930s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-04-13T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-10-05T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-10-05T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-04-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-04-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-04-17T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-04-17T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-04-09T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-04-09T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-10-08T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-10-08T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-04-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-04-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-10-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-10-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-04-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-04-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-04-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-04-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-04-10T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-04-10T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-04-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-04-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-11-19T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-11-19T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-02-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1940s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-02-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-05-04T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-05-04T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-08-10T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-08-10T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-08-09T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-08-09T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-04-04T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-04-04T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-08-15T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-08-15T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-09-17T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-09-17T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-07-15T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-07-15T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-03-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-03-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-04-13T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-13T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-08-10T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-08-10T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-11-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-11-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-03-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-03-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-10-31T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-10-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-10-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-04-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-04-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-10-22T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-10-22T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-04-15T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-04-15T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-10-21T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-10-21T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1952-04-20T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-04-20T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1952-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1953-04-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-04-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1953-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-04-11T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-04-11T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1955-04-17T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1955-04-17T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1955-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1955-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1956-04-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-04-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1956-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1957-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1957-10-07T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-10-07T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1958-04-20T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1958-04-20T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1958-10-05T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1958-10-05T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1959-04-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-04-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1959-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1960-04-10T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-04-10T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1960-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1961-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1961-10-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-10-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1962-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1962-10-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-10-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1963-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1963-10-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-10-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-03-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-03-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-10-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-10-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-03-21T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-03-21T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-10-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-10-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-03-20T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-03-20T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-10-23T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-23T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-03-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-03-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-10-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-10-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-02-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-02-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-10-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-02-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-02-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1970s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-10-31T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-03-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-03-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-10-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-10-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-03-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-03-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-10-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-10-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-03-17T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-03-17T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-10-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-03-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-03-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-03-21T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-03-21T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-10-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-10-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-03-20T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-03-20T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-10-23T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-10-23T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-03-19T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-03-19T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-10-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-03-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-03-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-10-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-10-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-03-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-03-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-03-29T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-29T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-03-28T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-03-28T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-10-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-10-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-03-27T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-03-27T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-10-23T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-10-23T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-03-25T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-03-25T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-03-31T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-03-31T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-03-30T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-30T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-03-29T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-29T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-03-27T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-27T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-10-23T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-10-23T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-26T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-26T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-03-25T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-25T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-31T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-31T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-29T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-29T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-28T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-28T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-10-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-10-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-03-27T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-27T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-10-23T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-10-23T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-03-26T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-26T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-10-22T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-10-22T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-03-31T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-31T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-03-30T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-30T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-29T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-28T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-26T01:00:00'))]">
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

    <!-- Madrid -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Madrid)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1900-12-31T23:45:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-00:14')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1900-12-31T23:45:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-04-15T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-15T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-10-07T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-10-07T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-04-06T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-04-06T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-10-07T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-10-07T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-04-16T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-04-16T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-10-05T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-10-05T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-04-17T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-04-17T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-10-03T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-10-03T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-04-09T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-04-09T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-10-02T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-10-02T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-04-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-04-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-10-07T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-10-07T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-04-20T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-04-20T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-10-06T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-10-06T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-06-16T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-06-16T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-10-03T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-10-03T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-04-02T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-04-02T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-04-30T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-04-30T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-10-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-10-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-10-08T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-10-08T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-03-16T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+00:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-03-16T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-05-02T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-05-02T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-09-01T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-09-01T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-04-17T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-04-17T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-10-03T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-10-03T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-04-15T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-04-15T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-10-01T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-10-01T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-04-14T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-14T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-09-30T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-30T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-13T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-13T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-09-29T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-09-29T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-04-30T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-30T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-10-02T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-10-02T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-04-13T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-04-13T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-10-06T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-06T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-04-12T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-04-12T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-10-05T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-05T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-03-27T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-03-27T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-09-26T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-09-26T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-04-02T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-04-02T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-09-25T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-09-25T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-10-01T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-01T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-04-01T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-04-01T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-04-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-09-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-09-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-03-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-03-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-09-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-09-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-26T02:00:00'))]">
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

    <!-- Mexico City -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Mexico)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1922 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1922-01-01T12:23:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:36')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-01-01T12:23:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-06-10T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-07:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-06-10T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-11-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-11-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-05-01T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-07:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-05-01T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-07:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-02-05T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-02-05T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-06-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-06-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-12-09T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-12-09T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-12-16T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-12-16T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-05-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-05-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-02-12T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-02-12T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-07-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-07-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-04-07T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-04-07T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-04-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-04-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-04-04T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-04-04T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-04-02T02:00:00'))]">
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

    <!-- San José -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(San Jose|San José)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1921 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1921-01-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:36')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1920 to 1979 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-01-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-01-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-01-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-06-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-06-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-02-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-02-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-06-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-06-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-02-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1980s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-02-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-06-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-06-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-01-19T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-01-19T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-07-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-07-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-01-18T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-06:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-01-18T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2030-01-01T00:00:00'))]">
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

    <!-- Shanghai -->
    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Shanghai)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1901-01-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:05')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1901-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-06-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-06-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-10-13T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-10-13T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-03-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-03-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-11-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-11-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-01-31T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-01-31T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-09-02T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-02T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-05-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-05-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-04-15T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-15T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-05-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-05-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-10-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-10-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-05-04T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-05-04T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-09-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-09-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-04-12T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-04-12T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-09-13T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-09-13T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-04-17T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-04-17T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-09-11T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-09-11T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-04-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-04-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-09-17T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-09-17T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-04-15T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-04-15T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-09-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-09-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-15T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-15T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2030-01-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+08:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Tehran -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Tehran)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-01-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:25')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-11-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-11-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-03-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-03-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-10-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-01-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-03-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-03-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-09-19T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-09-19T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-03-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-03-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-09-23T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-09-23T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-05-03T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-05-03T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-03-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-09-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-09-21T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-09-22T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+04:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-09-22T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-21T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+03:30')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Tokyo -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Tokyo)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1888-01-01T12:18:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:18')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1888-01-01T12:18:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-05-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-05-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-09-11T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+10:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-09-11T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-09-10T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+10:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-09-10T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-05-07T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-05-07T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-09-09T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+10:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-09-09T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-05-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-05-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-09-08T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+10:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-09-08T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2031-01-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+09:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Vienna -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Vienna)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1893 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1893-04-01T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:05')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1894 to 1916 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1893-04-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-04-30T23:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1917 to 1940 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-04-30T23:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1916-10-01T01:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1916-10-01T01:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-04-16T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-04-16T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1917-09-17T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1917-09-17T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-04-15T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-15T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-09-16T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-16T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-09-13T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-09-13T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-04-01T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1940s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-04-01T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-11-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-11-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1943-10-04T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1943-10-04T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1944-10-02T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1944-10-02T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-04-12T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-04-12T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-14T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-14T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-10-06T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-10-06T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-04-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-10-05T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-10-05T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-04-18T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-04-18T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-10-03T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1948 to 1980 -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-10-03T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-04-06T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1980s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-06T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-09-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-09-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-09-28T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-09-28T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-03-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-09-30T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-09-30T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-09-29T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-09-29T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-09-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-09-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-09-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-09-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-03-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-03-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-09-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-09-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-03-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-03-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-09-24T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-09-24T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-03-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+01:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T03:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '+02:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T03:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-03-26T02:00:00'))]">
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

    <!-- Washington, D.C. and New York -->

    <xsl:template
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Washington|New York)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1883 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1883-11-18T12:02:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:56')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1883 to 1917 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1883-11-18T12:03:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-03-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1918 to 1919 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-03-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1918-10-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-10-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-03-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-03-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1919-10-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-10-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1920-03-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1920s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-03-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1920-10-31T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-10-31T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1921-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1921-09-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-09-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1922-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1922-09-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-09-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1923-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1923-09-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-09-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1924-09-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-09-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1925-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1925-09-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-09-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1926-09-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-09-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1927-09-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-09-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1928-09-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-09-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1929-09-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-09-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1930s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1930-09-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-09-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1931-09-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-09-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1932-09-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-09-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1933-09-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-09-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1934-09-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-09-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1935-09-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-09-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1936-09-27T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-09-27T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1937-09-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-09-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1938-09-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-09-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1939-09-24T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-09-24T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1940s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1940-09-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-09-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1941-09-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-09-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1942-02-09T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-02-09T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1945-09-30T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-30T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1946-09-29T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-09-29T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1947-09-28T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-09-28T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1948-09-26T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-09-26T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1949-09-25T00:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1950s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-09-25T00:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1950-09-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-09-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1951-09-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-09-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1952-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1952-09-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-09-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1953-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1953-09-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-09-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-09-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-09-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1955-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1955-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1954-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1956-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1956-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1957-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1957-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1957-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1958-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1958-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1959-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1959-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1960-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1960s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1960-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1961-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1961-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1962-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1962-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1963-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1963-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1964-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1965-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1966-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1967-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>


            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1968-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1969-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1970-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1970s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1970-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1971-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1972-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1973-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-01-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-01-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1974-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-02-23T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-02-23T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1975-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1976-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1977-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-04-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-04-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1978-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1979-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1980s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1980-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-04-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-04-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1981-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-04-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-04-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1982-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-04-24T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-04-24T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1983-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-04-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-04-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1984-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-04-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-04-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1985-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-04-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-04-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1986-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1987-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1988-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1989-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-04-01T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <!-- 1990s -->

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-04-01T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1990-10-28T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-28T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-04-07T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-04-07T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1991-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1992-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-04-04T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-04-04T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1993-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-04-03T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-04-03T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1994-10-30T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-10-30T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-04-02T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1995-10-29T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-10-29T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-04-07T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-04-07T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1996-10-27T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-04-06T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-04-06T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1997-10-26T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1998-10-25T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-04-05T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-04-05T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('1999-10-31T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T02:00:00')) and (xs:dateTime(.) &lt; xs:dateTime('2000-04-02T02:00:00'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
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

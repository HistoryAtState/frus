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

</xsl:stylesheet>

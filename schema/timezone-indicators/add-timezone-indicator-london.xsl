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

</xsl:stylesheet>

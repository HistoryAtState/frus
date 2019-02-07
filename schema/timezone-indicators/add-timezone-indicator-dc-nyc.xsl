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
    
    <xsl:template match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Washington|New York)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>
            
            <!-- 1800 to 1883 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1883-11-18T12:02:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:56')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1883 to 1917 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1883-11-18T12:03:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1918-03-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1918 to 1919 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-03-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1918-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1918-10-27T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1919-03-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-03-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1919-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1919-10-26T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1920-03-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1920s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-03-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1920-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1920-10-31T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1921-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1921-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1921-09-25T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1922-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1922-09-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1922-09-24T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1923-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1923-09-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1923-09-30T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1924-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1924-09-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1924-09-28T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1925-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1925-09-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-09-27T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1926-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1926-09-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1926-09-26T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1927-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1927-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1927-09-25T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1928-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1928-09-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-09-30T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1929-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1929-09-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1929-09-29T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1930-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1930s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1930-09-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1930-09-28T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1931-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1931-09-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1931-09-27T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1932-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1932-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1932-09-25T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1933-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1933-09-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1933-09-24T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1934-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1934-09-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1934-09-30T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1935-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1935-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1935-09-29T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1936-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1936-09-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1936-09-27T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1937-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1937-09-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1937-09-26T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1938-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1938-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1938-09-25T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1939-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1939-09-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1939-09-24T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1940-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1940s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1940-09-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-09-29T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1941-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1941-09-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-09-28T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1942-02-09T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-02-09T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1945-09-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-30T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1946-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1946-09-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-09-29T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1947-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1947-09-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1947-09-28T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1948-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1948-09-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1948-09-26T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1949-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1949-09-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1950s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1949-09-25T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1950-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1950-09-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-09-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1951-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1951-09-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1951-09-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1952-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1952-09-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1952-09-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1952-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1953-09-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1953-09-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1954-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1954-09-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-09-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1955-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1955-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1954-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1954-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1956-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1956-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1956-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1957-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1957-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1958-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1957-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1958-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1958-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1959-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1959-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1959-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1960-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1960s -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1960-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1960-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1961-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1961-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1961-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1962-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1962-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1962-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1963-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1963-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1963-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1964-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1964-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1964-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1965-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1965-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1966-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1966-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1967-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1967-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1968-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1968-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1969-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1969-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1970-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1970s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1970-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1971-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1971-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1972-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1972-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1973-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1973-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1974-01-06T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-01-06T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1974-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1975-02-23T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-02-23T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1975-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1976-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1976-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1977-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1977-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1978-04-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-04-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1978-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1979-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1979-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1979-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1980s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1980-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1981-04-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-04-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1981-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1982-04-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-04-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1982-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1983-04-24T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-04-24T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1983-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1984-04-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-04-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1984-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1985-04-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-04-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1985-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1986-04-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-04-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1986-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1987-04-05T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-04-05T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1987-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1988-04-03T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-04-03T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1988-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1989-04-02T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-04-02T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1989-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1990-04-01T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1990s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-04-01T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1990-10-28T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-28T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1991-04-07T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-04-07T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1991-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1992-04-05T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-04-05T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1992-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1993-04-04T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-04-04T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1993-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1994-04-03T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-04-03T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1994-10-30T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-10-30T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1995-04-02T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-04-02T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1995-10-29T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-10-29T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1996-04-07T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-04-07T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1996-10-27T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-27T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1997-04-06T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-04-06T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1997-10-26T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-26T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1998-04-05T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-04-05T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1998-10-25T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1999-04-04T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-04-05T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1999-10-31T01:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T02:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('2000-04-02T01:59:59'))]">
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

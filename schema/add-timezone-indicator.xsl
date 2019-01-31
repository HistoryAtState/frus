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
    
    <xsl:template match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Washington|New York)')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1950-01-01T00:00:00')) and (xs:dateTime(.)  &lt;=  xs:dateTime('1950-04-30T01:59:59'))]">
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
            
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

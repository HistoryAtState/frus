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
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Habana|Havana)', 'i')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
        <xsl:choose>

            <!-- 1800 to 1925 -->
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1800-01-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1925-07-19T11:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:29')"/>
                </xsl:attribute>
            </xsl:when>

            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-07-01T12:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1928-06-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1928-06-10T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1928-10-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1925-10-10T12:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1940-06-01T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-06-02T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1940-08-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1940-09-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1941-05-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-05-31T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1941-09-06T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1941-09-07T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1942-06-06T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-06-07T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1942-09-05T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1942-09-06T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1945-06-02T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-06-03T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1945-09-02T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1945-09-03T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1946-06-01T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-06-02T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1946-08-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1946-09-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1965-05-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-06-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1965-09-28T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1965-09-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1966-05-28T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-06-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1966-10-01T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1966-10-02T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1967-04-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-04-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1967-09-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1967-09-10T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1968-04-13T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-04-14T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1968-09-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1968-09-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1969-04-26T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-04-27T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1969-10-25T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1970s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1969-10-26T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1970-04-25T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-04-26T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1970-10-24T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1970-10-25T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1971-04-24T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-04-25T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1971-10-30T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1971-10-31T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1972-04-29T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-04-30T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1972-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1972-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1973-04-28T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-04-29T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1973-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1973-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1974-04-27T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-04-28T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1974-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1974-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1975-04-26T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-04-27T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1975-10-25T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1975-10-26T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1976-04-24T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-04-25T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1976-10-30T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1976-10-31T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1977-04-23T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-04-24T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1977-10-29T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1977-10-30T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1978-05-06T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-05-07T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1978-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1978-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1979-03-17T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-03-18T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1979-10-13T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1979-10-14T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-03-15T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-03-16T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1980-10-11T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1980s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1980-10-12T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1981-05-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-05-10T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1981-10-10T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1981-10-11T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1982-05-08T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-05-09T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1982-10-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1982-10-10T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1983-05-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-05-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1983-10-08T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1983-10-09T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1984-05-05T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-05-06T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1984-10-13T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1984-10-14T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1985-05-04T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-05-05T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1985-10-12T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1985-10-13T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1986-03-15T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-03-16T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1986-10-11T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1986-10-12T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1987-03-14T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-03-15T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1987-10-10T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1987-10-11T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1988-03-19T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-03-20T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1988-10-08T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1988-10-09T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1989-03-18T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-03-19T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1989-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1989-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1990-03-31T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <!-- 1990s -->
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-04-01T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1990-10-13T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1990-10-14T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-04-06T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-04-07T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1991-10-12T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1991-10-13T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-04-04T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-04-05T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1992-10-10T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1992-10-11T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1993-04-03T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-04-04T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1993-10-09T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1993-10-10T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1994-04-02T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-04-03T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1994-10-08T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1994-10-09T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1995-04-01T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-04-02T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1994-10-07T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1995-10-08T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1996-04-06T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-04-07T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1996-10-05T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1996-10-06T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1997-04-05T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-04-06T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1997-10-11T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1997-10-12T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1998-03-28T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-03-29T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1998-10-24T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1998-10-25T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1999-03-27T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-05:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-03-28T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('1999-10-30T23:59:59'))]">
                <xsl:variable name="attribute-name" select="node-name(.)"/>
                <xsl:attribute name="{$attribute-name}">
                    <xsl:value-of select="concat(xs:string(.), '-04:00')"/>
                </xsl:attribute>
            </xsl:when>
            
            <xsl:when
                test=".[(xs:dateTime(.) &gt;= xs:dateTime('1999-10-31T00:00:00')) and (xs:dateTime(.) &lt;= xs:dateTime('2000-04-01T23:59:59'))]">
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

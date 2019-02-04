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
        match="tei:date/attribute::*[ancestor::tei:dateline//tei:placeName[matches(., '(Buenos Aires)')] and matches(xs:string(data(.)), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$')]">
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

</xsl:stylesheet>

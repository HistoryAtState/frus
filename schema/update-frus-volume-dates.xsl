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

    <!-- Delete any existing date[@type="content-date"] -->

    <xsl:template
        match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[matches(attribute::type, 'content-date')]"/>

    <!-- Delete any whitespace from position of removed date[@type="content-date"] -->

    <xsl:template
        match="text()[following-sibling::node()[1][self::tei:date[parent::tei:publicationStmt][matches(attribute::type, 'content-date')]]]"/>

    <!-- Add descendant min/max dates as date[@type="content-date"]/@notBefore | @notAfter -->

    <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt">

        <!-- Set variables for earliest, year value from earliest, latest, and year value from latest -->

        <xsl:variable name="earliest">
            <xsl:for-each select="ancestor::tei:TEI//tei:div/@frus:doc-dateTime-min">
                <xsl:sort select="." order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="earliest-year" select="substring-before(xs:string($earliest), '-')"/>

        <xsl:variable name="latest">
            <xsl:for-each select="ancestor::tei:TEI//tei:div/@frus:doc-dateTime-max">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="latest-year" select="substring-before(xs:string($latest), '-')"/>

        <!-- Add element date[@type="content-date"] -->

        <xsl:choose>

            <!-- <xsl:when test=".[not(tei:date[matches(attribute::type, 'content-date')])]"> -->

            <xsl:when test=".">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>

                    <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">content-date</xsl:attribute>
                        <xsl:attribute name="calendar">gregorian</xsl:attribute>
                        <xsl:attribute name="notBefore">
                            <xsl:value-of select="$earliest"/>
                        </xsl:attribute>
                        <xsl:attribute name="notAfter">
                            <xsl:value-of select="$latest"/>
                        </xsl:attribute>

                        <xsl:choose>
                            <xsl:when test="$latest-year eq $earliest-year">
                                <xsl:value-of select="$latest-year"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($earliest-year, ' to ', $latest-year)"
                                />
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:element>

                </xsl:copy>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>

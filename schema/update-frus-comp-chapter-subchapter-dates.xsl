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

    <!-- 1. Add descendant min/max dates as @frus:doc-dateTime-min and @frus:doc-dateTime-max to //div[@type="subchapter"] -->

    <xsl:template
        match="tei:div[@type = 'subchapter'][not(@subtype = ('historical-document', 'editorial-note', 'referral'))]">

        <xsl:variable name="earliest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-min">
                <xsl:sort select="." order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="latest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-max">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test=".[not(@frus:doc-dateTime-min)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="frus:doc-dateTime-min">
                        <xsl:value-of select="$earliest"/>
                    </xsl:attribute>
                    <xsl:attribute name="frus:doc-dateTime-max">
                        <xsl:value-of select="$latest"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="node()"/>
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

    <!-- 2. Add descendant min/max dates as @frus:doc-dateTime-min and @frus:doc-dateTime-max to //div[@type="chapter"] {Includes subchapter min/max dates added in step 1} -->

    <xsl:template
        match="tei:div[@type = 'chapter'][not(@subtype = ('historical-document', 'editorial-note', 'referral'))]">

        <xsl:variable name="earliest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-min">
                <xsl:sort select="." order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="latest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-max">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test=".[not(@frus:doc-dateTime-min)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="frus:doc-dateTime-min">
                        <xsl:value-of select="$earliest"/>
                    </xsl:attribute>
                    <xsl:attribute name="frus:doc-dateTime-max">
                        <xsl:value-of select="$latest"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="node()"/>
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

    <!-- 3. Add descendant min/max dates as @frus:doc-dateTime-min and @frus:doc-dateTime-max to //div[@type="compilation"] {Includes subchapter and chapter min/max dates added in step 1 and 2} -->

    <xsl:template
        match="tei:div[@type = 'compilation'][not(@subtype = ('historical-document', 'editorial-note', 'referral'))]">

        <xsl:variable name="earliest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-min">
                <xsl:sort select="." order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="latest">
            <xsl:for-each select="descendant::tei:div/@frus:doc-dateTime-max">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test=".[not(@frus:doc-dateTime-min)]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="frus:doc-dateTime-min">
                        <xsl:value-of select="$earliest"/>
                    </xsl:attribute>
                    <xsl:attribute name="frus:doc-dateTime-max">
                        <xsl:value-of select="$latest"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="node()"/>
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

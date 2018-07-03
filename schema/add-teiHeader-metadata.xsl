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
        match="tei:teiHeader/tei:fileDesc/tei:publicationStmt[not(tei:distributor)]">
        <xsl:choose>
            <xsl:when test=".">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:element name="distributor" namespace="http://www.tei-c.org/ns/1.0">United States Department of State, The Office of The Historian</xsl:element>
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
    <xsl:template
        match="tei:teiHeader/tei:fileDesc/tei:publicationStmt[not(tei:availability)]">
        <xsl:choose>
            <xsl:when test=".">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:element name="availability" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="status">free</xsl:attribute>
                        <p>As a product of the United States government, this electronic edition may be considered as being in the public domain.</p>
                        <license target="https://creativecommons.org/publicdomain/mark/1.0/"/>
                    </xsl:element>
                    <xsl:element name="availability" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="status">restricted</xsl:attribute>
                        <p>Non-United States government content contained herein may be governed by U.S. and international copyright laws.</p>
                        <p>Per Public Domain Mark 1.0:
                            <p>“The work may not be free of known copyright restrictions in all jurisdictions.”</p>
                            <p>“Persons may have other rights in or related to the work, such as patent or trademark rights, and others may have rights in how the work is used, such as publicity or privacy rights.”</p>
                            <p>“In some jurisdictions moral rights of the author may persist beyond the term of copyright. These rights may include the right to be identified as the author and the right to object to derogatory treatments.”</p>
                            <p>“Unless expressly stated otherwise, the person who identified the work makes no warranties about the work, and disclaims liability for all uses of the work, to the fullest extent permitted by applicable law.”</p>
                            <p>“When using or citing the work, you should not imply endorsement by the author or the person who identified the work.”</p>
                        </p>
                    </xsl:element>
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

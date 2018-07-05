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

    <!-- Add `profileDesc / langUsage | textClass -->
    <xsl:template match="tei:teiHeader[not(tei:profileDesc)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <xsl:choose>
                <xsl:when test=".[not(tei:profileDesc)]">

                    <xsl:element name="profileDesc" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="langUsage" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="language" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="ident">en</xsl:attribute>English</xsl:element>
                        </xsl:element>

                        <xsl:element name="textClass" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="keywords" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="scheme"
                                    >https://history.state.gov/tags/topics</xsl:attribute>
                                <xsl:element name="list" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="item" namespace="http://www.tei-c.org/ns/1.0">[...]</xsl:element>
                                    <xsl:element name="item" namespace="http://www.tei-c.org/ns/1.0">[...]</xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <!-- Add `profileDesc / langUsage | textClass -->
    <xsl:template match="tei:teiHeader/tei:profileDesc">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <xsl:choose>
                <xsl:when test=".[not(tei:textClass)]">
                        <xsl:element name="textClass" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="keywords" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="scheme"
                                    >https://history.state.gov/tags/topics</xsl:attribute>
                                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0">[...]</xsl:element>
                                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0">[...]</xsl:element>
                                
                            </xsl:element>
                        </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    

    <!-- Add `seriesStmt` to `fileDesc` -->
    <xsl:template match="tei:teiHeader/tei:fileDesc">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <xsl:choose>
                <xsl:when test=".[not(tei:seriesStmt)]">
                    <xsl:element name="seriesStmt" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0">Foreign
                            Relations of the United States</xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    

    <!-- Add `distributor` and `availability` to `publicationStmt` -->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:publicationStmt">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <xsl:choose>
                <xsl:when test=".[not(tei:distributor)]">
                    <xsl:element name="distributor" namespace="http://www.tei-c.org/ns/1.0">United
                        States Department of State, The Office of The Historian</xsl:element>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=".[not(tei:availability)]">
                    <xsl:element name="availability" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="status">free</xsl:attribute>
                        <p>As a product of the United States government, this electronic edition may
                            be considered as being in the public domain.</p>
                        <license target="https://creativecommons.org/publicdomain/mark/1.0/"/>
                    </xsl:element>
                    <xsl:element name="availability" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="status">restricted</xsl:attribute>
                        <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">Non-United
                            States government content contained herein may be governed by U.S. and
                            international copyright laws.</xsl:element>
                        <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">Per Creative
                            Commons Public Domain Mark 1.0: <xsl:element name="p"
                                namespace="http://www.tei-c.org/ns/1.0">“The work may not be free of
                                known copyright restrictions in all jurisdictions.”</xsl:element>
                            <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">“Persons
                                may have other rights in or related to the work, such as patent or
                                trademark rights, and others may have rights in how the work is
                                used, such as publicity or privacy rights.”</xsl:element>
                            <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">“In some
                                jurisdictions moral rights of the author may persist beyond the term
                                of copyright. These rights may include the right to be identified as
                                the author and the right to object to derogatory
                                treatments.”</xsl:element>
                            <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">“Unless
                                expressly stated otherwise, the person who identified the work makes
                                no warranties about the work, and disclaims liability for all uses
                                of the work, to the fullest extent permitted by applicable
                                law.”</xsl:element>
                            <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">“When
                                using or citing the work, you should not imply endorsement by the
                                author or the person who identified the work.”</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

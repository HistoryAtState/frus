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
    <xsl:template match="tei:div[@subtype = 'message-of-the-president']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="subtype">historical-document</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:div[ancestor::tei:front][@type = 'section'][not(@subtype)]">
        <xsl:choose>
            <xsl:when
                test=".[matches(@xml:id, '(AbouttheSeries|[Aa]bout|[Aa]boutseries|[Aa]bouttheseries|[Aa]btseries)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">about-frus-series</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Aa]cknowledge|[Aa]cknowledgments)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">acknowledgements</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '(subseriesvols|[Vv]olumes)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">additional-volumes</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '[Ee]ditorial')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">editorial-policies</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '[Ee]rrata')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">errata</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '[Hh]istorian')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">historian-statement</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test=".[matches(@xml:id, '(message-of-the-president|messages-of-the-president|address-of-the-president)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">historical-document</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test=".[matches(@xml:id, '([Nn]otes?|actionsstatement|actionssatement|actionstatement|covert)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">notes</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test=".[matches(@xml:id, '([Cc]harts|[Gg]uide|[Ii]ndex|[Ii]ndex-persons|[Ii]ndex-subjects|list-of-illustrations|[Pp]apers-countries|[Pp]apers|[Pp]apers-topics|[Pp]hotos?|[Pp]hotographs?|[Pp]ersons|[Pp]ersons-mentioned|[Ss]horttitles|[Ss]ubjects|[Ss]ymbols|[Tt]erms|[Tt]oc-countries|[Tt]oc-papers|[Tt]oc-topics|[Tt]opical)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">index</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when
                test=".[matches(@xml:id, '([Ii]ntro|[Ii]ntroduction|[Ii]ntroductory|[Pp]reface|[Pp]refatory)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">preface</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Pp]ress-releases?|[Pp]ressreleases?)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">press-release</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Ss]ources?|[Pp]ublished|[Uu]npublished)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">sources</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Cc]ontents|toc)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">table-of-contents</xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test=".[matches(@xml:id, '([Ss]ummary|[Vv]olumesummary)')]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="subtype">volume-summary</xsl:attribute>
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

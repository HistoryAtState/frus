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
        match="tei:div[@subtype = 'historical-document'][matches(tei:head/., '[Mm]emorandum\s+of\s+(a\s+)?(Trans-Atlantic\s+|Transatlantic\s+)?(Telephone\s+)?[Cc]onversation')]/tei:dateline[not(descendant::frus:attachment)]//tei:date">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="type">conversation-or-meeting-date</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

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

    <xsl:template match="tei:div[@type = 'document']">
        <xsl:choose>

            <!-- Add or update existing attributes where suitable date is found -->

            <xsl:when
                test=".//tei:dateline[not(ancestor::frus:attachment)]//tei:date[(@from or @notBefore or @when) or (@to or @notAfter or @when)]">
                <xsl:variable name="date-min"
                    select="subsequence(.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@from or @notBefore or @when], 1, 1)/(@from, @notBefore, @when)[. ne ''][1]/string()"/>
                <xsl:variable name="date-max"
                    select="subsequence(.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@to or @notAfter or @when], 1, 1)/(@to, @notAfter, @when)[. ne ''][1]/string()"/>
                <xsl:variable name="timezone" select="xs:dayTimeDuration('-PT5H')"/>
                <xsl:copy>
                    <xsl:apply-templates
                        select="@*[not(name(.) = ('frus:doc-dateTime-min', 'frus:doc-dateTime-max'))]"/>
                    <xsl:attribute name="frus:doc-dateTime-min">
                        <xsl:value-of select="frus:normalize-low($date-min, $timezone)"/>
                    </xsl:attribute>
                    <xsl:attribute name="frus:doc-dateTime-max">
                        <xsl:value-of select="frus:normalize-high($date-max, $timezone)"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:when>

            <!-- Remove mistakenly added attributes-->

            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates
                        select="@*[not(name(.) = ('frus:doc-dateTime-min', 'frus:doc-dateTime-max'))]"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>

        </xsl:choose>
    </xsl:template>

    <!-- Functions to normalize dates -->

    <xsl:function name="frus:normalize-low">
        <xsl:param name="date"/>
        <xsl:param name="timezone"/>
        <xsl:choose>
            <xsl:when test="$date castable as xs:dateTime">
                <xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime($date), $timezone)"/>
            </xsl:when>
            <xsl:when test="$date castable as xs:date">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:date($date) cast as xs:dateTime, $timezone)"
                />
            </xsl:when>
            <xsl:when test="matches($date, '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$')">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || ':00'), $timezone)"/>
            </xsl:when>
            <xsl:when test="matches($date, '^\d{4}-\d{2}$')">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || '-01T00:00:00'), $timezone)"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || '-01-01T00:00:00'), $timezone)"
                />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="frus:normalize-high">
        <xsl:param name="date"/>
        <xsl:param name="timezone"/>
        <xsl:choose>
            <xsl:when test="$date castable as xs:dateTime">
                <xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime($date), $timezone)"/>
            </xsl:when>
            <xsl:when test="$date castable as xs:date">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:date($date) cast as xs:dateTime, $timezone) + xs:dayTimeDuration('PT23H59M59S')"
                />
            </xsl:when>
            <xsl:when test="matches($date, '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$')">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || ':59'), $timezone)"/>
            </xsl:when>
            <xsl:when test="matches($date, '^\d{4}-\d{2}$')">
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || '-' || functx:days-in-month($date || '-01') || 'T23:59:59'), $timezone)"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="adjust-dateTime-to-timezone(xs:dateTime($date || '-12-31T23:59:59'), $timezone)"
                />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Functions borrowed from functx library -->

    <xsl:function name="functx:days-in-month" as="xs:integer?" xmlns:functx="http://www.functx.com">
        <xsl:param name="date" as="xs:anyAtomicType?"/>

        <xsl:sequence
            select="
                if (month-from-date(xs:date($date)) = 2 and functx:is-leap-year($date)) then
                    29
                else
                    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[month-from-date(xs:date($date))]"/>

    </xsl:function>

    <xsl:function name="functx:is-leap-year" as="xs:boolean" xmlns:functx="http://www.functx.com">
        <xsl:param name="date" as="xs:anyAtomicType?"/>

        <xsl:sequence
            select="
                for $year in xs:integer(substring(string($date), 1, 4))
                return
                    ($year mod 4 = 0 and $year mod 100 != 0) or $year mod 400 = 0"/>

    </xsl:function>
</xsl:stylesheet>

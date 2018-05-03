<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:functx="http://www.functx.com">
    <title>FRUS TEI Rules - Date Rules</title>

    <p>This schematron file contains only the date-related rules from frus.sch.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

    <let name="category-ids" value="//tei:category/@xml:id"/>

    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule context="tei:date[@ana]">
            <assert test="substring-after(@ana, '#') = $category-ids">date/@ana='<value-of
                    select="@ana"/>' is an invalid value. No category has been defined with an
                @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:date[@type]">
            <assert role="warn"
                test="./@type = ('content-date', 'conversation-or-meeting-date', 'creation-date', 'publication-date', 'received-date')"
                    >date/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: conversation-or-meeting-date, content-date, creation-date,
                received-date</assert>
        </rule>
        <rule context="tei:date[@calendar]">
            <assert role="warn"
                test="tokenize(./@calendar) = ('brazilian-republic', 'chinese-era', 'chinese-lunisolar', 'chinese-republic', 'ethiopian-geez', 'gregorian', 'haitian-republic', 'hijri', 'iranian-persian', 'japanese-nengō', 'julian', 'korean-era', 'korean-lunisolar', 'masonic-anno-lucis', 'papal-era', 'roman', 'rumi', 'thai-era', 'tibetan-phugpa', 'us-republic')"
                    >date/@calendar='<value-of select="@calendar"/>' is an invalid value. Only the
                following values are allowed: brazilian-republic, chinese-era, chinese-lunisolar,
                chinese-republic, ethiopian-geez, gregorian, haitian-republic, hijri,
                iranian-persian, japanese-nengō, julian, korean-era, korean-lunisolar,
                masonic-anno-lucis, papal-era, roman, rumi, thai-era, tibetan-phugpa, us-republic.
                If you need to add additional calendar value(s), please add to frus.sch,
                dates-only.sch, and dates-only-initial-review.sch</assert>
        </rule>
    </pattern>

    <pattern id="dateline-date-checks">
        <title>Dateline Date Checks</title>
        <rule
            context="tei:dateline[not(ancestor::frus:attachment)][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert test="exists(.//tei:date)">Please tag "undated" phrase in this document dateline
                with a &lt;date&gt; element.</assert>
        </rule>
        <rule
            context="tei:dateline[ancestor::frus:attachment][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert role="warn" test="exists(.//tei:date)">Please tag "undated" phrase in this
                attachment dateline with a &lt;date&gt; element.</assert>
        </rule>
        <!--
        <rule context="tei:dateline[not(ancestor::frus:attachment)]">
            <assert test=".//tei:date">Document datelines must contain a date element</assert>
        </rule>
        -->
        <rule
            context="tei:dateline[not(ancestor::frus:attachment)][ancestor::tei:div[attribute::subtype eq 'historical-document'][not(descendant::tei:dateline[not(ancestor::frus:attachment)]//tei:date)]]">
            <assert test=".//tei:date">Within historical documents, at least one dateline must
                contain a date element</assert>
        </rule>
        <!--
        <rule context="tei:dateline[ancestor::frus:attachment]">
            <assert role="warn" test=".//tei:date">Attachment datelines should contain a date
                element if this information is present</assert>
        </rule>
        -->
        <rule
            context="tei:dateline[ancestor::frus:attachment[not(descendant::tei:dateline//tei:date)]]">
            <assert role="warn" test=".//tei:date">Within attachments, at least one dateline must
                contain a date element</assert>
        </rule>
        <!-- Tentative rule -->
        <!-- <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]"> -->
        <rule
            context="tei:date[ancestor::tei:dateline][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert
                test="(@notBefore and @notAfter and @ana) or (@when and @ana) or (@from and @to and @ana)"
                >Undated documents must be tagged with @when/@ana --OR-- @from/@to/@ana --OR--
                @notBefore/@notAfter/@ana. &#10; Use @when/@ana for a single date/dateTime that can
                be inferred concretely (such as a date listed in the original document). &#10; Use
                @from/@to/@ana for a date/dateTime range that can be inferred concretely (such as a
                meeting day and time span). &#10; Use @notBefore/@notAfter/@ana for an inferred,
                fuzzy dateTime range (such as an unknown date/time between two documents or
                events).</assert>
        </rule>
        <!-- <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][. ne '' and not(matches(., 'undated|not\s+dated|not\s+declassified', 'i'))]"> -->
        <rule
            context="tei:date[ancestor::tei:dateline][. ne '' and not(matches(., 'undated|not\s+dated|not\s+declassified', 'i'))]">
            <assert
                test="@when or (@from and @to) or (@notBefore and @notAfter and @ana) or (@when and @notBefore and @notAfter and @ana)"
                >Supplied dates must have @when (for single dates) or @from/@to (for supplied date
                ranges) or @notBefore/@notAfter/@ana/(/@when) (for imprecise year or year-month only
                dates)</assert>
        </rule>
        <rule context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)]">
            <assert role="warn" test="normalize-space(.) ne ''">Dateline date should not be
                empty.</assert>
            <assert test="(@from and @to) or (not(@from) and not(@to))">Dateline date @from must
                have a corresponding @to.</assert>
            <assert test="(@notBefore and @notAfter) or (not(@notBefore) and not(@notAfter))"
                >Dateline date @notBefore must have a corresponding @notAfter.</assert>
            <assert role="warn"
                test="(@notBefore and @notAfter and @ana) or (not(@notBefore) and not(@notAfter))"
                >Missing @ana explaining the analysis used to determine @notBefore and
                @notAfter.</assert>
            <assert
                test="
                    every $date in @when
                        satisfies ((matches($date, '^\d{4}$') and ($date || '-01-01') castable as xs:date) or (matches($date, '^\d{4}-\d{2}$') and ($date || '-01') castable as xs:date) or $date castable as xs:date or $date castable as xs:dateTime)"
                >Dateline date @when values must be YYYY, YYYY-MM, or xs:date or
                xs:dateTime</assert>
            <assert
                test="
                    every $date in (@from, @to, @notBefore, @notAfter)
                        satisfies ($date castable as xs:date or $date castable as xs:dateTime)"
                >Dateline date @from/@to/@notBefore/@notAfter must be valid xs:date or xs:dateTime
                values.</assert>
            <assert
                test="
                    every $attribute in @*
                        satisfies not(matches($attribute, '[A-Z]$'))"
                >Please use timezone offset instead of military time zone (e.g., replace Z with
                +00:00).</assert>
            <assert
                test="
                    if (@from and @to) then
                        (@from le @to)
                    else
                        true()"
                >Dateline date @from must come before @to.</assert>
            <assert
                test="
                    if (@notBefore and @notAfter) then
                        (@notBefore le @notAfter)
                    else
                        true()"
                >Dateline date @notBefore must come before @notAfter.</assert>
        </rule>
    </pattern>

    <pattern id="document-date-metadata-checks">
        <title>Document Date Metadata Checks</title>
        <rule
            context="tei:div[@type eq 'document'][not(@subtype = ('editorial-note', 'errata_document-numbering-error', 'index'))][not(.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@from or @to or @notBefore or @notAfter or @when])]">
            <assert test=".//tei:dateline[not(ancestor::frus:attachment)]"
                sqf:fix="add-dateline-date-only add-full-dateline">Non-editorial note documents must
                have a dateline with date metadata.</assert>
            <sqf:fix id="add-dateline-date-only">
                <sqf:description>
                    <sqf:title>Add dateline with empty date</sqf:title>
                </sqf:description>
                <sqf:add use-when="not(tei:opener)" match="tei:head[1]" position="after">
                    <dateline xmlns="http://www.tei-c.org/ns/1.0">
                        <date/>
                    </dateline>
                </sqf:add>
                <sqf:add use-when="tei:opener" match="tei:opener[1]" position="last-child">
                    <dateline xmlns="http://www.tei-c.org/ns/1.0">
                        <date/>
                    </dateline>
                </sqf:add>
            </sqf:fix>
            <sqf:fix id="add-full-dateline">
                <sqf:description>
                    <sqf:title>Add dateline with empty placeName and date</sqf:title>
                </sqf:description>
                <sqf:add use-when="not(tei:opener)" match="tei:head[1]" position="after">
                    <dateline xmlns="http://www.tei-c.org/ns/1.0">
                        <placeName/>, <date/>
                    </dateline>
                </sqf:add>
                <sqf:add use-when="tei:opener" match="tei:opener[1]" position="last-child">
                    <dateline xmlns="http://www.tei-c.org/ns/1.0">
                        <placeName/>, <date/>
                    </dateline>
                </sqf:add>
            </sqf:fix>
        </rule>

        <rule
            context="tei:div[@type eq 'document'][.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@from or @to or @notBefore or @notAfter or @when]]">
            <let name="date-min"
                value="subsequence(.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@from or @notBefore or @when], 1, 1)/(@from, @notBefore, @when)[. ne ''][1]/string()"/>
            <let name="date-max"
                value="subsequence(.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@to or @notAfter or @when], 1, 1)/(@to, @notAfter, @when)[. ne ''][1]/string()"/>
            <let name="timezone" value="xs:dayTimeDuration('-PT5H')"/>
            <assert test="@frus:doc-dateTime-min and @frus:doc-dateTime-max"
                sqf:fix="add-doc-dateTime-attributes">Missing @frus:doc-dateTime-min and
                @frus:doc-dateTime-max.</assert>
            <assert
                test="
                    if (@frus:doc-dateTime-min) then
                        frus:normalize-low($date-min, $timezone) eq @frus:doc-dateTime-min
                    else
                        true()"
                sqf:fix="fix-doc-dateTime-min-attribute">Value of @frus:doc-dateTime-min <value-of
                    select="@frus:doc-dateTime-min"/> does not match normalized value of dateline
                    <value-of select="frus:normalize-low($date-min, $timezone)"/>.</assert>
            <assert
                test="
                    if (@frus:doc-dateTime-max) then
                        frus:normalize-high($date-max, $timezone) eq @frus:doc-dateTime-max
                    else
                        true()"
                sqf:fix="fix-doc-dateTime-max-attribute">Value of @frus:doc-dateTime-max <value-of
                    select="@frus:doc-dateTime-max"/> does not match normalized value of dateline
                    <value-of select="frus:normalize-high($date-max, $timezone)"/>.</assert>
            <sqf:fix id="add-doc-dateTime-attributes" role="add">
                <sqf:description>
                    <sqf:title>Add missing @frus:doc-dateTime-min and @frus:doc-dateTime-max
                        attributes</sqf:title>
                </sqf:description>
                <sqf:add target="frus:doc-dateTime-min" node-type="attribute"
                    select="frus:normalize-low($date-min, $timezone)"/>
                <sqf:add target="frus:doc-dateTime-max" node-type="attribute"
                    select="frus:normalize-high($date-max, $timezone)"/>
            </sqf:fix>
            <sqf:fix id="fix-doc-dateTime-min-attribute" role="replace">
                <sqf:description>
                    <sqf:title>Fix @frus:doc-dateTime-min attribute</sqf:title>
                </sqf:description>
                <sqf:replace match="@frus:doc-dateTime-min" target="frus:doc-dateTime-min"
                    node-type="attribute" select="frus:normalize-low($date-min, $timezone)"/>
            </sqf:fix>
            <sqf:fix id="fix-doc-dateTime-max-attribute" role="replace">
                <sqf:description>
                    <sqf:title>Fix @frus:doc-dateTime-max attribute</sqf:title>
                </sqf:description>
                <sqf:replace match="@frus:doc-dateTime-max" target="frus:doc-dateTime-max"
                    node-type="attribute" select="frus:normalize-high($date-max, $timezone)"/>
            </sqf:fix>
        </rule>
        <rule context="tei:div[@frus:doc-dateTime-min]">
            <assert role="error" test="./@frus:doc-dateTime-min castable as xs:dateTime"
                >@frus:doc-dateTime-min must be castable as dateTime</assert>
            <assert role="error" test="./@frus:doc-dateTime-max">div must have both
                @frus:doc-dateTime-min and @frus:doc-dateTime-max</assert>
        </rule>
        <rule context="tei:div[@frus:doc-dateTime-max]">
            <assert role="error" test="./@frus:doc-dateTime-max castable as xs:dateTime"
                >@frus:doc-dateTime-max must be castable as dateTime</assert>
            <assert role="error" test="./@frus:doc-dateTime-min">div must have both
                @frus:doc-dateTime-min and @frus:doc-dateTime-max</assert>
        </rule>
    </pattern>

    <!-- Pre-U.S. Independence Dates Check -->
    <pattern id="date-1776">
        <title>Pre-U.S. Independence Dates Check</title>
        <rule context="tei:date[attribute::*]/@when | @from | @to | @notBefore | @notAfter">
            <let name="year" value="substring(xs:string(.), 1, 4)"/>
            <assert role="warn" test="xs:numeric($year) >= 1776">For the vast majority of FRUS
                documents, date attributes should be greater than or equal to the year 1776. (Verify
                correctness of: <value-of select="."/>)</assert>
        </rule>
    </pattern>

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

</schema>

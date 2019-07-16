<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3">
    <title>FRUS TEI Rules - Date Rules for Initial Review</title>

    <p>This schematron file contains date-related rules augmenting frus.sch. This file is
        appropriate for evaluating vendor deliveries and first review of a volume for date encoding
        and values.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="xi" uri="http://www.w3.org/2001/XInclude"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="functx" uri="http://www.functx.com"/>

    <let name="category-ids" value="//tei:category/@xml:id"/>

    <pattern id="date-pointer-checks">
        <title>Date-Related Ref and Pointer Checks</title>
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
                If you need to add additional calendar value(s), please add to frus.odd as
                well.</assert>
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
                >Dateline date/@from dateTime value must come before @to dateTime value.</assert>
            <assert
                test="
                    if (@notBefore and @notAfter) then
                        (@notBefore le @notAfter)
                    else
                        true()"
                >Dateline date/@notBefore dateTime value must come before @notAfter dateTime
                value.</assert>
        </rule>
    </pattern>

</schema>

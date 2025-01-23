<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:dates="http://history.state.gov/ns/xslt/dates"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>FRUS TEI Rules - Date Rules for Initial Review</title>

    <p>This schematron file contains date-related rules augmenting frus.sch. This file is
        appropriate for evaluating vendor deliveries and first review of a volume for date encoding
        and values.</p>
    
    <xsl:include href="frus-dates.xsl"/>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="dates" uri="http://history.state.gov/ns/xslt/dates"/>

    <pattern id="date-pointer-checks">
        <title>Date-Related Ref and Pointer Checks</title>

        <let name="category-ids" value="//tei:category/@xml:id"/>

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
            <assert test="
                    every $date in @when
                        satisfies ((matches($date, '^\d{4}$') and ($date || '-01-01') castable as xs:date) or (matches($date, '^\d{4}-\d{2}$') and ($date || '-01') castable as xs:date) or $date castable as xs:date or $date castable as xs:dateTime)"
                >Dateline date @when values must be YYYY, YYYY-MM, or xs:date or
                xs:dateTime</assert>
            <assert test="
                    every $date in (@from, @to, @notBefore, @notAfter)
                        satisfies ($date castable as xs:date or $date castable as xs:dateTime)"
                >Dateline date @from/@to/@notBefore/@notAfter must be valid xs:date or xs:dateTime
                values.</assert>
            <assert test="
                    every $attribute in @*
                        satisfies not(matches($attribute, '[A-Z]$'))">Please use
                timezone offset instead of military time zone (e.g., replace Z with
                +00:00).</assert>
            <assert test="
                    if (@from and @to) then
                        (@from le @to)
                    else
                        true()">Dateline date/@from dateTime value must come before @to
                dateTime value.</assert>
            <assert test="
                    if (@notBefore and @notAfter) then
                        (@notBefore le @notAfter)
                    else
                        true()">Dateline date/@notBefore dateTime value must come before
                @notAfter dateTime value.</assert>

            <!-- Begin date attribute analysis with the dates:analyze-date function -->

            <let name="actual-attributes" value="@when, @from, @to, @notBefore, @notAfter"/>
            <let name="date-analysis" value="dates:analyze-date(.)"/>
            <let name="expected-attributes" value="$date-analysis?output"/>
            <let name="warn" value="$date-analysis?warn"/>

            <!-- 
                Check the actual attributes against the expected attributes, as identified by dates:analyze-date:
                (1) that expected attribute names are present; and 
                (2) that each expected attribute's value matches the corresponding actual attribute. 
                
                In the 2nd check, the starts-with function is used instead of the equals operator, since:
                (1) date enrichment may result in timezones being tacked on, based on the dateline's place name; and
                (2) it's ok for the vendor to leave an empty notBefore/notAfter attribute pair for undated documents, 
                    flagging them for further enrichment by us.
            -->
            <let name="attribute-name-mismatch" value="
                    every $date in $expected-attributes
                        satisfies exists($actual-attributes[name() eq $date/name()])"/>
            <let name="attribute-value-mismatch" value="
                    every $date in $expected-attributes
                        satisfies starts-with($actual-attributes[name() eq $date/name()]/data(), data($date))"/>

            <!-- Assert to check if actual date attributes match expected values -->
            <assert id="date-matches-attributes" role="warning" sqf:fix="fix-date-attributes"
                test="$attribute-name-mismatch and $attribute-value-mismatch">Date attribute
                    <value-of select="serialize($actual-attributes, map {'method': 'adaptive'})"/>
                does not match expected: <value-of
                    select="serialize($expected-attributes, map {'method': 'adaptive'})"/>
            </assert>

            <!-- Pass any warnings through from dates:analyze-date; e.g., no patterns matched the date -->
            <assert role="warning" test="empty($warn)"><value-of select="$warn"/>: <value-of
                    select="normalize-space(.)"/></assert>

            <!-- Schematron Quick Fix to replace any existing date attributes with the expected ones -->
            <sqf:fix id="fix-date-attributes">
                <sqf:description>
                    <sqf:title>Overwrite date attributes with <value-of
                            select="serialize($expected-attributes, map {'method': 'adaptive'})"
                        /></sqf:title>
                </sqf:description>
                <sqf:delete match="@when, @from, @to, @notBefore, @notAfter"/>
                <sqf:add node-type="attribute" target="when"
                    use-when="$expected-attributes[name() eq 'when']">
                    <value-of select="$expected-attributes[name() eq 'when']"/>
                </sqf:add>
                <sqf:add node-type="attribute" target="from"
                    use-when="$expected-attributes[name() eq 'from']">
                    <value-of select="$expected-attributes[name() eq 'from']"/>
                </sqf:add>
                <sqf:add node-type="attribute" target="to"
                    use-when="$expected-attributes[name() eq 'to']">
                    <value-of select="$expected-attributes[name() eq 'to']"/>
                </sqf:add>
                <sqf:add node-type="attribute" target="notBefore"
                    use-when="$expected-attributes[name() eq 'notBefore']">
                    <value-of select="$expected-attributes[name() eq 'notBefore']"/>
                </sqf:add>
                <sqf:add node-type="attribute" target="notAfter"
                    use-when="$expected-attributes[name() eq 'notAfter']">
                    <value-of select="$expected-attributes[name() eq 'notAfter']"/>
                </sqf:add>
            </sqf:fix>

        </rule>
    </pattern>

</schema>

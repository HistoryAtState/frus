<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:functx="http://www.functx.com"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:historyatstate="https://history.state.gov/historyatstate">
    <title>FRUS TEI Rules - Date Rules for Secondary Review</title>

    <p>This schematron file contains date-related rules augmenting frus.sch. This schematron extends
        the frus-dates.sch.</p>
    <p>This current version is oriented towards secondary review of legacy volumes but is also
        valuable for contemporary publishing.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="xi" uri="http://www.w3.org/2001/XInclude"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="functx" uri="http://www.functx.com"/>
    <ns prefix="historyatstate" uri="https://history.state.gov/historyatstate"/>

    <extends href="frus-dates.sch"/>

    <pattern id="dateline-date-checks-secondary-review">
        <title>Dateline Date Checks - Secondary Review</title>
        <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert
                test="(@notBefore and @notAfter and @ana) or (@when and @ana) or (@from and @to and @ana)"
                >Undated documents must be tagged with @when/@ana –OR– @from/@to/@ana –OR–
                @notBefore/@notAfter/@ana. &#10; Use @when/@ana for a single date/dateTime that can
                be inferred concretely (such as a date listed in the original document). &#10; Use
                @from/@to/@ana for a date/dateTime range that can be inferred concretely (such as a
                meeting day and time span). &#10; Use @notBefore/@notAfter/@ana for an inferred,
                fuzzy dateTime range (such as an unknown date/time between two documents or
                events).</assert>
        </rule>
        <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][. ne '' and not(matches(., 'undated|not\s+dated|not\s+declassified', 'i'))]">
            <assert
                test="@when or (@from and @to) or (@notBefore and @notAfter and @ana) or (@when and @notBefore and @notAfter and @ana)"
                >Supplied dates must have @when (for single dates) or @from/@to (for supplied date
                ranges) or @notBefore/@notAfter/@ana/(/@when) (for imprecise year or year-month only
                dates)</assert>
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
    </pattern>

    <pattern id="errant-or-empty-doc-dateTime-values">
        <title>Div dateTime Attribute Value Checks</title>
        <rule context="tei:div[@frus:doc-dateTime-min]">
            <assert role="error" test="./@frus:doc-dateTime-min castable as xs:dateTime">The value
                of @frus:doc-dateTime-min is not a valid dateTime for this div.
                @frus:doc-dateTime-min must be a valid ISO dateTime.</assert>
            <assert role="error" test="./@frus:doc-dateTime-max">This div has a
                @frus:doc-dateTime-min attribute but not a @frus:doc-dateTime-max
                attribute.</assert>
        </rule>
        <rule context="tei:div[@frus:doc-dateTime-max]">
            <assert role="error" test="./@frus:doc-dateTime-max castable as xs:dateTime">The value
                of @frus:doc-dateTime-max is not a valid dateTime for this div.
                @frus:doc-dateTime-max must be a valid ISO dateTime.</assert>
            <assert role="error" test="./@frus:doc-dateTime-min">This div has a
                @frus:doc-dateTime-max attribute but not a @frus:doc-dateTime-min attribute</assert>
        </rule>
    </pattern>

    <!-- Date Attributes Duration Checks -->
    <pattern id="date-attribute-durations">
        <title>Date Attributes Duration Checks</title>
        <!-- @from and @to -->
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@from castable as xs:dateTime and @to castable as xs:dateTime]">
            <let name="from-to-duration" value="xs:dateTime(./@to) - xs:dateTime(./@from)"/>
            <assert role="warn"
                test="xs:dayTimeDuration($from-to-duration) &lt; xs:dayTimeDuration('P32D')">For the
                majority of FRUS documents, the duration between @from and @to attributes would
                likely be less than one month. Please verify the correctness of: @from="<value-of
                    select="./@from"/>" and @to="<value-of select="./@to"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@from castable as xs:date and @to castable as xs:date]">
            <let name="from-to-duration"
                value="xs:dateTime(xs:date(./@to)) - xs:dateTime(xs:date(./@from))"/>
            <assert role="warn"
                test="xs:dayTimeDuration($from-to-duration) &lt; xs:dayTimeDuration('P32D')">For the
                majority of FRUS documents, the duration between @from and @to attributes would
                likely be less than one month. Please verify the correctness of: @from="<value-of
                    select="./@from"/>" and @to="<value-of select="./@to"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@from castable as xs:dateTime and @to castable as xs:date]">
            <let name="from-to-duration" value="xs:dateTime(xs:date(./@to)) - xs:dateTime(./@from)"/>
            <assert role="warn"
                test="xs:dayTimeDuration($from-to-duration) &lt; xs:dayTimeDuration('P32D')">For the
                majority of FRUS documents, the duration between @from and @to attributes would
                likely be less than one month. Please verify the correctness of: @from="<value-of
                    select="./@from"/>" and @to="<value-of select="./@to"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@from castable as xs:date and @to castable as xs:dateTime]">
            <let name="from-to-duration" value="xs:dateTime(./@to) - xs:dateTime(xs:date(./@from))"/>
            <assert role="warn"
                test="xs:dayTimeDuration($from-to-duration) &lt; xs:dayTimeDuration('P32D')">For the
                majority of FRUS documents, the duration between @from and @to attributes would
                likely be less than one month. Please verify the correctness of: @from="<value-of
                    select="./@from"/>" and @to="<value-of select="./@to"/>"</assert>
        </rule>

        <!-- @notBefore and @notAfter -->
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@notBefore castable as xs:dateTime and @notAfter castable as xs:dateTime]">
            <let name="duration-between-notBefore-and-notAfter"
                value="xs:dateTime(./@notAfter) - xs:dateTime(./@notBefore)"/>
            <assert role="warn"
                test="xs:dayTimeDuration($duration-between-notBefore-and-notAfter) &lt; xs:dayTimeDuration('P365D')"
                >For the majority of FRUS documents, the duration between @notBefore and @notAfter
                attributes would likely be less than one year. Please verify the correctness of:
                    @from="<value-of select="./@notBefore"/>" and @to="<value-of
                    select="./@notAfter"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@notBefore castable as xs:date and @notAfter castable as xs:date]">
            <let name="duration-between-notBefore-and-notAfter"
                value="xs:dateTime(xs:date(./@notAfter)) - xs:dateTime(xs:date(./@notBefore))"/>
            <assert role="warn"
                test="xs:dayTimeDuration($duration-between-notBefore-and-notAfter) &lt; xs:dayTimeDuration('P365D')"
                >For the majority of FRUS documents, the duration between @notBefore and @notAfter
                attributes would likely be less than one year. Please verify the correctness of:
                    @notBefore="<value-of select="./@notBefore"/>" and @notAfter="<value-of
                    select="./@notAfter"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@notBefore castable as xs:dateTime and @notAfter castable as xs:date]">
            <let name="duration-between-notBefore-and-notAfter"
                value="xs:dateTime(xs:date(./@notAfter)) - xs:dateTime(./@notBefore)"/>
            <assert role="warn"
                test="xs:dayTimeDuration($duration-between-notBefore-and-notAfter) &lt; xs:dayTimeDuration('P365D')"
                >For the majority of FRUS documents, the duration between @notBefore and @notAfter
                attributes would likely be less than one year. Please verify the correctness of:
                    @notBefore="<value-of select="./@notBefore"/>" and @notAfter="<value-of
                    select="./@notAfter"/>"</assert>
        </rule>
        <rule
            context="tei:date[not(ancestor::tei:publicationStmt)][@notBefore castable as xs:date and @notAfter castable as xs:dateTime]">
            <let name="duration-between-notBefore-and-notAfter"
                value="xs:dateTime(./@notAfter) - xs:dateTime(xs:date(./@notBefore))"/>
            <assert role="warn"
                test="xs:dayTimeDuration($duration-between-notBefore-and-notAfter) &lt; xs:dayTimeDuration('P365D')"
                >For the majority of FRUS documents, the duration between @notBefore and @notAfter
                attributes would likely be less than one year. Please verify the correctness of:
                    @notBefore="<value-of select="./@notBefore"/>" and @notAfter="<value-of
                    select="./@notAfter"/>"</assert>
        </rule>

    </pattern>

    <!-- Pre-U.S. Independence Dates Check -->
    <pattern id="date-1776">
        <title>Pre-U.S. Independence Dates Check</title>
        <rule context="tei:date[attribute::*]/@when | @from | @to | @notBefore | @notAfter">
            <let name="year" value="substring(xs:string(.), 1, 4)"/>
            <assert role="warn" test="xs:numeric($year) >= 1776">For the vast majority of FRUS
                documents, date attributes should be greater than or equal to the year 1776. Please
                verify correctness of: <value-of select="."/></assert>
        </rule>
    </pattern>

    <!-- Post-Publication Run Dates Check -->
    <pattern id="date-2030">
        <title>Post-Publication Run Dates Check</title>
        <!-- Note: This upper bound [2030] will eventually need to be updated. -->
        <rule context="tei:date[attribute::*]/@when | @from | @to | @notBefore | @notAfter">
            <let name="year" value="substring(xs:string(.), 1, 4)"/>
            <assert role="warn" test="xs:numeric($year) &lt;= 2030">For the vast majority of FRUS
                documents, date attributes should be less than or equal to the year 2030. Please
                verify correctness of: <value-of select="."/></assert>
        </rule>
    </pattern>

    <!-- Date Analytics Checks -->

    <pattern id="undated-analytics-mismatch">
        <rule context="tei:date[matches(., '(undated|no date|not dated)')]/@ana">
            <assert test=".[contains(., 'undated')]" role="warn">This undated date has been given an
                @ana value of <value-of select="."/>. Please verify that the date/@ana value should
                not start with "#date_undated-..." instead.</assert>
        </rule>
    </pattern>

    <!-- Non-Gregorian Calendar Checks -->

    <!-- Chinese Era/Reign-Based Calendar Checks/Fixes -->
    <pattern id="chinese-era-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'chinese-era'))]">
            <assert role="info"
                test="not(.[matches(., 'Qi[áa]nl[óo]ng|G[āa]oz[ōo]ng|H[óo]nglì|Ji[āa]q[ìi]ng|R[ée]nzōng|Y[óo]ngy[ǎa]n|D[àa]ogu[āa]ng|Xu[āa]nz[ōo]ng|M[íi]nn[íi]ng|Xianfeng|W[ée]nz[o]ōng|Wenzong|Y[ìi]zh[ǔu]|Dongzhi|M[ùu]z[ōo]ng|Muzong|Z[ǎa]ich[úu]n|Tongzhi|[TFJ]ung?chih?|[TFJ](&#8217;)?ung?((\s+)?|-)Chih?|Guangxu|K[uw]anghs[üu]|K[uw]ang((\s+)?|-)Hs[üu]|K[uw]ang((\s+)?|-)S[üu]|Dézōng|Tezong|Z[ǎa]iti[áa]n|Xuantong|Gongz[ōo]ng|Pui', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Chinese era/reign-based calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-chinese-era-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-era" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('chinese-era ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'moon', 'i')][@calendar][not(matches(@calendar, 'chinese-lunisolar'))]"
                    id="add-chinese-era-chinese-lunisolar-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-era chinese-lunisolar" to existing
                            @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('chinese-era chinese-lunisolar ', $calendar-value)"
                        />
                    </sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'moon', 'i')][@calendar][not(matches(@calendar, 'chinese-lunisolar'))][not(matches(@calendar, 'gregorian'))]"
                    id="add-chinese-era-chinese-lunisolar-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-era chinese-lunisolar gregorian" to existing
                            @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of
                            select="concat('chinese-era chinese-lunisolar gregorian', $calendar-value)"
                        />
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-chinese-era-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-era gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('chinese-era gregorian', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-chinese-era">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[matches(., 'moon', 'i')][@calendar]"
                    id="replace-calendar-attribute-chinese-era-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-era chinese-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[matches(., 'moon', 'i')][@calendar]"
                    id="replace-calendar-attribute-chinese-era-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-era
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-chinese-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)][matches(., 'moon', 'i')]"
                    id="add-chinese-era-chinese-lunisolar">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era chinese-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era
                        chinese-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-chinese-era-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era chinese-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-chinese-era-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era gregorian</sqf:add>
                </sqf:fix>

            </sqf:group>

        </rule>
    </pattern>

    <!-- Chinese Lunisolar Calendar Checks/Fixes -->
    <pattern id="chinese-lunar-calendar-checks">
        <rule
            context="tei:date[not(matches(@calendar, 'chinese-lunisolar'))][not(matches(@calendar, 'korean-lunisolar'))][not(matches(@calendar, 'thai-lunisolar'))]">
            <assert role="info" test="not(.[matches(., 'moon', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Chinese lunisolar calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-chinese-lunisolar-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-lunisolar" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('chinese-lunisolar ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-chinese-lunisolar-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "chinese-lunisolar gregorian" to existing
                            @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('chinese-lunisolar gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-chinese-era-chinese-lunisolar">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-era
                            chinese-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era
                        chinese-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-chinese-era-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-era chinese-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-chinese-lunisolar">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="chinese-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-chinese-era-chinese-lunisolar">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era chinese-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era
                        chinese-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-chinese-era-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era chinese-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-chinese-lunisolar">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-chinese-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-lunisolar gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

            </sqf:group>

        </rule>
    </pattern>

    <!-- Ethiopian Ge’ez Calendar Checks/Fixes -->
    <pattern id="ethiopian-geez-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'ethiopian-geez'))]">

            <assert role="info"
                test="not(.[matches(., 'Mäskäräm|Maskaram|Ṭəqəmt|Teqemt|Ṭəqəmti|Teqemti|Ḫədar|Hedar|Taḫśaś|Tahsas|Tehsass|Yäkatit|Yakatit|Läkatit|Lakatit|Mägabit|Magabit|Miyazya|Mazia|Gənbo|Genbo|Gənbot|Genbot|Säne|Sane|Ḥamle|Hamle|Nähase|Nahase|Ṗagʷəmen|Pagwemen|Ṗagume|Pagume', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Ethopian ge’ez calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-ethiopian-geez-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "ethiopian-geez" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('ethiopian-geez ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-ethiopian-geez-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "ethiopian-geez gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('ethiopian-geez gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-ethiopian-geez">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="ethiopian-geez"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">ethiopian-geez</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-ethiopian-geez-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="ethiopian-geez
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">ethiopian-geez
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-ethiopian-geez">
                    <sqf:description>
                        <sqf:title>Add @calendar="ethopian-geez"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">ethopian-ge’ez</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-ethiopian-geez-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="ethopian-geez gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">ethopian-geez</sqf:add>
                </sqf:fix>
            </sqf:group>

        </rule>
    </pattern>

    <!-- Hijri Calendar Checks/Fixes -->
    <pattern id="hijri-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'hijri'))]">
            <assert role="info"
                test="not(.[matches(., 'Muḥarram|Muharram|Moharram|Ṣafar|Safar|Sefer|Rabī&#8217;\s+al-awwal|Rebbi-al-ewel|Rabih|Rabī&#8216;\s+ath-thānī|Rabī&#8216;\s+al-Thānī|Rabī&#8216;\s+al-Tānī|Rabī’\s+al-Ākhir|Rabi\s+el\s+tami|Rabee\s+El\s+Thani|Rabi&#8217;Tani|Rebbi-ul-Akbir|Rebi-ul-Ewel|Rabih|Jumādá\s+al-ūlá|Ǧumādā\s+al-Awwal|Jumada\s+al-awwal|Jumada\s+al-ula|Jumada\s+al-Ula|Jumada|Jumada\s+I|Jamadi-ol-Aval|Jumada\s+al-Oola|Jamad-el-Ewel|Jumadil\s+Awwal|Djémazi-ul-ewel|Djemazi-ul-evvel|Youmada|Youmada\s+I|Youmada\s+1st|Jamadi-es-Sani|Jumādá\s+al-ākhirah|Ǧumādā\s+al-Āḫir|Ǧumādā\s+aṮ-Ṯānī|Iamadi|Jumaada\s+al-Akhir|Jumada\s+al-Akhira|Jumādā\s+al-āḵir|Jumada\s+II|Rajab|Rajah|Sha&#8217;bān|Sha&#8216;ban|Sha&#8216;bān|Sha&#8216;ban|Shaaban|Chaban|Ramaḍān|Ramadan|Ramadhan|Ramazam|Shawwāl|Shawwal|Shawal|Dhū\s+al-Qa&#8216;dah|Dhu[:punct:]l-Qi[:punct:]dah|Dhu.?l-Qa[:punct:]dah|Ḏū\s+l-Qa[:punct:]dah|Zulqida|Zeekadeh|Zee\s+Radah|Zee\s+Kadah|Dhū\s+al-Ḥijjah|Dhu\s+al-Hijjah|Dhu[:punct:]l-Hijjah|Zulhijja|Zi\s+El-Hidjah|Zil-Hajj', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a hijri calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-hijri-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "hijri" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('hijri ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-hijri-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "hijri gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('hijri gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-hijri">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="hijri"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">hijri</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-hijri-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="hijri gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">hijri gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-hijri">
                    <sqf:description>
                        <sqf:title>Add @calendar="hijri"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">hijri</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-hijri-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="hijri gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">hijri gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Iranian/Persian/Solar Hijri Calendar Checks/Fixes -->
    <pattern id="iranian-persian-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'iranian-persian'))]">

            <assert role="info"
                test="not(.[matches(., 'farvardin|Farvardin|Farvardīn|ordibehešt|Ordibehesht|Ordībehešt|xordâd|Khordad|Khordād|[^A-z]tir[^A-z]|[^A-z]Tir[^A-z]|mordâd|Mordad|A-Mordād|šahrivar|Shahrivar|Shahrīvar|[^A-z]mehr[^A-z]|[^A-z]Mehr[^A-z]|Mehrmah|[^A-z]âbân[^A-z]|[^A-z]Aban[^A-z]|[^A-z]Ābān[^A-z]|[^A-z]âzar[^A-z]|[^A-z]Azar[^A-z]|[^A-z]Āzar[^A-z]|[^A-z]dey[^A-z]|[^A-z]Dey[^A-z]|bahman|Bahman|esfand|Esfand|Espand', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating an Iranian/Persian (Solar Hijri) calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar  -->
                <sqf:fix use-when=".[@calendar]" id="add-iranian-persian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "iranian-persian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('iranian-persian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-iranian-persian-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "iranian-persian gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('iranian-persian gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-iranian-persian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="iranian-persian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">iranian-persian</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-iranian-persian-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="iranian-persian
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">iranian-persian
                        gregorian</sqf:add>
                </sqf:fix>


                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-iranian-persian">
                    <sqf:description>
                        <sqf:title>Add @calendar="iranian-persian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">iranian-persian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-iranian-persian-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="iranian-persian gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">iranian-persian
                        greogrian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Japanese Nengō Calendar Checks/Fixes -->
    <pattern id="japanese-nengō-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'japanese-nengō'))]">
            <assert role="info"
                test="not(.[matches(., 'An&#8217;ei|K[ōo]kaku|Tenmei|Kansei|Ky[ōo]waBunka|Nink[ōo]|Bunsei|Tenpō|Tenpo|Tenh[ōo]|Kōka|Koka|K[ōo]mei|Kaei|Ansei|Man&#8217;en|Bunkyū|Bunkyu|Genji|Kei[ōo]|Meiji|Taishō|Taisho|Sh[ōo]wa(\s+|,)|Heisei|Akihito', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Japanese nengō calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-japanese-nengo-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "japanese-nengō" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('japanese-nengō ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-japanese-nengo-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "japanese-nengō gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('japanese-nengō gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-japanese-nengo">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="japanese-nengō"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">japanese-nengō</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-japanese-nengo-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="japanese-nengō
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">japanese-nengō
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-japanese-nengo">
                    <sqf:description>
                        <sqf:title>Add @calendar="japanese-nengō"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">japanese-nengō</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-japanese-nengo-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="japanese-nengō gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">japanese-nengō
                        gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Korean Era Calendar Checks/Fixes -->
    <pattern id="korean-era-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'korean-era'))]">
            <assert role="info"
                test="not(.[matches(., 'Yi\s+Geum|Gunjin|Songheon|Taejo|Emperor\s+Go|Yi\s+San|Hyeongun|Hongjae|Jeongjo|Yi\s+Gong|Gongbo|Sunjae|Sunjo|Yi\s+Hwan|Muneung|Wonheon|\s+Heonjong|Yi\s+Byeon|Doseung|Daeyongjae|Cheoljong|Yi\s+Myeong-bok|Yi\s+Hui|Seongrim|Juyeon|Gojong|Kojong|Emperor\s+Tae|Gaeguk|Geonyang|Gwangmu|Kwangmu|Kwang\s+Mu|Gwangmuje|Kwangmuje|Yi\s+Cheok|Gundang|Jeongheon|Sunjong|Emperor\s+Hyo|Emperor\s+Yunghui|Yunghui|Yunghuije|Yunghŭije|Lyung\s+Heni', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Korean era calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-korean-era-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "korean-era" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('korean-era ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-korean-era-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "korean-era gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('korean-era gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-korean-era">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="korean-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-korean-era-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="korean-era
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-korean-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="korean-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-korean-era-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="korean-era gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Korean Lunisolar Calendar Checks/Fixes -->
    <pattern id="korean-lunisolar-calendar-checks">
        <rule
            context="tei:date[not(matches(@calendar, 'korean-lunisolar'))][matches(@calendar, 'korean-era')]">
            <assert role="info" test="not(.[matches(., 'moon', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Korean lunisolar calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-korean-lunisolar-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "korean-lunisolar" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('korean-lunisolar ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-korean-era-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "korean-lunisolar gregorian" to existing
                            @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('korean-lunisolar gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-korean-era-korean-lunisolar">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="korean-era
                            korean-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era
                        korean-lunisolar</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-korean-era-korean-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="korean-era korean-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era korean-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-korean-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="korean-era korean-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era
                        korean-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-korean-era-korean-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="korean-era korean-lunisolar gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Masonic Calendar Checks/Fixes -->
    <pattern id="masonic-anno-lucis-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'masonic-anno-lucis'))]">

            <assert role="info"
                test="not(.[matches(., '((in\s+the\s+year\s+of\s+light)|(anno\s+lucis))', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Masonic calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-masonic-anno-lucis-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "masonic-anno" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('masonic-anno ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-masonic-anno-lucis-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "masonic-anno gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('masonic-anno gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-masonic-anno-lucis">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="masonic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">masonic-anno-lucis</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-masonic-anno-lucis-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="masonic gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">masonic-anno-lucis
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-masonic-anno-lucis">
                    <sqf:description>
                        <sqf:title>Add @calendar="masonic-anno-lucis"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">masonic-anno-lucis</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-masonic-anno-lucis-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="masonic-anno-lucis gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">masonic-anno-lucis
                        gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>

        </rule>
    </pattern>

    <!-- Papal Era Calendar Checks/Fixes -->
    <pattern id="papal-era-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'papal-era'))]">
            <assert role="info" test="not(.[matches(., 'pontif*', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a papal era calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-papal-era-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "papal-era" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('papal-era ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-papal-era-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "papal-era gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('papal-era gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-papal-era">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="papal-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">papal-era</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-papal-era-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="papal-era
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">papal-era gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-papal-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="papal-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">papal-era</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-papal-era-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="papal-era gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">papal-era gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Roman Calendar Checks/Fixes -->
    <pattern id="roman-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'roman'))]">
            <assert role="info" test="not(.[matches(., 'nones|ides|kalends', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Roman calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-roman-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "roman" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('roman ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-roman-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "roman gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('roman gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-roman">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="roman"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">roman</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-papal-era-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="roman gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">roman gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-roman">
                    <sqf:description>
                        <sqf:title>Add @calendar="roman"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">roman</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-roman-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="roman gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">roman gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Rumi Calendar Checks/Fixes -->
    <pattern id="rumi-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'rumi'))]">
            <assert role="info"
                test="not(.[matches(., 'Kânûn-ı\s+Sânî|Kanun-i Sani|Şubat|Subat|[^A-z]Mart[^A-z]|Nisan|Mayıs|Mayis|Haziran|Temmuz|Ağustos|Agustos|Eylül|EylulTeşrin-i\s+Evvel|Tesrin-i\s+Evvel|Teşrin-i\s+Sânî|Tesrin-i Sani|Kânûn-ı\s+Evvel|Kanun-i\s+Evvel', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Rumi calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-rumi-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "rumi" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('rumi ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-rumi-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "rumi gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('rumi gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-rumi">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="rumi"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">rumi</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-rumi-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="rumi gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">rumi gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-rumi">
                    <sqf:description>
                        <sqf:title>Add @calendar="rumi"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">rumi</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-rumi-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="rumi gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">rumi gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Thai Calendar Checks/Fixes -->
    <pattern id="thai-era-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'thai-era'))]">
            <assert role="info"
                test="not(.[matches(., 'Thai|Rama\s+IV|Phrabat\s+Somdet\s+Phra\s+Paramenthra|Maha\s+Mongkut|Phra\s+Chom\s+Klao\s+Chao\s+Yu\s+Hua|Rama\s+V|Phrabat\s+Somdet\s+Phra\s+Paraminthra|Maha\s+Chulalongkorn|Phra\s+Chulachomklao\s+Chao\s+Yu\s+Hua|Phra\s+Piya\s+Maharaj|Rama\s+VI|Phrabat\s+Somdet\s+Phra\s+Paramenthra|Maha\s+Vajiravudh|Phra\s+Mongkut\s+Klao\s+Chao\s+Yu\s+Hua|Phra\s+Maha\s+Dhiraraj\s+Chao|Rama\s+VII|Phrabat\s+Somdet\s+Phra\s+Paraminthra|Maha\s+Prajadhipok|Phra\s+Pok\s+Klao\s+Chao\s+Yu\s+Hua|Rama VIII|Phrabat\s+Somdet\s+Phra\s+Paramenthra|Maha\s+Ananda\s+Mahidol|Phra\s+Atthama\s+Ramathibodin|Rama\s+IX|Phrabat\s+Somdet\s+Phra\s+Paraminthra|Maha\s+Bhumibol\s+Adulyadej|Siamindradhiraj\s+Borommanathbobitra|Somdet\s+Phra\s+Phatthara\s+Maharat|Rama\s+X|Somdet\s+Phra\s+Chao\s+Yu\s+Hua|Maha\s+Vajiralongkorn|Bodindradebayavarangkun', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Thai era calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-thai-era-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "thai-era" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('thai-era ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][matches(., 'moon', 'i')]"
                    id="add-thai-era-thai-lunisolar-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "thai-era thai-lunisolar" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('thai-era thai-lunisolar ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-thai-era-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "thai-era gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('thai-era gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[@calendar][not(matches(@calendar, 'gregorian'))][matches(., 'moon', 'i')]"
                    id="add-thai-era-thai-lunisolar-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "thai-era thai-lunisolar" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of
                            select="concat('thai-era thai-lunisolar gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-thai-era">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="thai-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-thai-era-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="thai-era gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era gregorian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][matches(., 'moon', 'i')]"
                    id="replace-calendar-attribute-thai-era-thai-lunisolar">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="thai-era
                            thai-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era
                        thai-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][matches(., 'moon', 'i')]"
                    id="replace-calendar-attribute-thai-era-thai-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="thai-era thai-lunisolar
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era thai-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-thai-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="thai-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-thai-era-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="thai-era gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era gregorian</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)][matches(., 'moon', 'i')]"
                    id="add-calendar-attribute-thai-era-thai-lunisolar">
                    <sqf:description>
                        <sqf:title>Add @calendar="thai-era thai-lunisolar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era
                        thai-lunisolar</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)][matches(., 'moon', 'i')]"
                    id="add-calendar-attribute-thai-era-thai-lunisolar-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="thai-era thai-lunisolar gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">thai-era thai-lunisolar
                        gregorian</sqf:add>
                </sqf:fix>

            </sqf:group>
        </rule>
    </pattern>

    <!-- Tibetan Phugpa Calendar Checks/Fixes -->
    <pattern id="tibetan-phugpa-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'tibetan-phugpa'))]">
            <assert role="info"
                test="not(.[matches(., 'Rabbit|Dragon|Snake|Horse|Goat|Monkey|Rooster|Dog|Pig|Rat|Ox|Tiger', 'i') and matches(., 'Fire|Earth|Iron|Water|Wood', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Tibetan phugpa calendar reference.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-tibetan-phugpa-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "tibetan-phugpa" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('tibetan-phugpa ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-tibetan-phugpa-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "tibetan-phugpa gregorian" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat('tibetan-phugpa gregorian ', $calendar-value)"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-tibetan-phugpa">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="tibetan-phugpa"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">tibetan-phugpa</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-tibetan-phugpa-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="tibetan-phugpa
                            gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">tibetan-phugpa
                        gregorian</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-tibetan-phugpa">
                    <sqf:description>
                        <sqf:title>Add @calendar="tibetan-phugpa"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">tibetan-phugpa</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-tibetan-phugpa-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="tibetan-phugpa gregorian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">tibetan-phugpa
                        gregorian</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- US Republic/Independence Calendar Checks/Quick Fixes -->
    <pattern id="us-republic-calendar-checks">
        <rule context="tei:date[not(matches(@calendar, 'us-republic'))]">
            <assert role="info"
                test="not(.[matches(., 'of\s+the\s+Independence\s+of\s+the\s+United\s+States', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating reference to United States independence/republic.</assert>

            <let name="calendar-value" value="string(./@calendar)"/>

            <sqf:group id="add-calendar-attributes">

                <!-- Add to existing @calendar -->
                <sqf:fix use-when=".[@calendar]" id="add-us-republic-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "us-republic" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat($calendar-value, ' us-republic')"/>
                    </sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[@calendar][not(matches(@calendar, 'gregorian'))]"
                    id="add-us-republic-gregorian-to-existing-calendar">
                    <sqf:description>
                        <sqf:title>Add "gregorian us-republic" to existing @calendar</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">
                        <value-of select="concat($calendar-value, ' gregorian us-republic')"/>
                    </sqf:add>
                </sqf:fix>

                <!-- Replace @calendar -->
                <sqf:fix use-when=".[@calendar]" id="replace-calendar-attribute-us-republic">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="us-republic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">us-republic</sqf:add>
                </sqf:fix>
                <sqf:fix use-when=".[@calendar]"
                    id="replace-calendar-attribute-us-republic-gregorian">
                    <sqf:description>
                        <sqf:title>Replace @calendar with @calendar="gregorian
                            us-republic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">gregorian us-republic</sqf:add>
                </sqf:fix>

                <!-- Add new @calendar -->
                <sqf:fix use-when=".[not(@calendar)]" id="add-calendar-attribute-us-republic">
                    <sqf:description>
                        <sqf:title>Add @calendar="us-republic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">us-republic</sqf:add>
                </sqf:fix>

                <sqf:fix use-when=".[not(@calendar)]"
                    id="add-calendar-attribute-us-republic-gregorian">
                    <sqf:description>
                        <sqf:title>Add @calendar="gregorian us-republic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">gregorian us-republic</sqf:add>
                </sqf:fix>
            </sqf:group>
        </rule>
    </pattern>

    <!-- Unencoded Date Checks -->
    <pattern id="unencoded-dates">
        <title>Unencoded Dates Checks</title>

        <!-- For Documents and Attachments without `date`, Look for Unencoded Dates in Closers -->
        <rule
            context="(tei:div[attribute::subtype eq 'historical-document'] | frus:attachment)[not(descendant::tei:date) and not(descendant::tei:quote)]/tei:closer[not(descendant::tei:dateline)]">
            <assert role="info"
                test="not(.[matches(., '(the\s+)?(\d{1,2})(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4})|((January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{1,2})(st|d|nd|rd|th)?,?\s+(\d{4}))', 'i')])"
                >[FYI] This closer possibly contains an unencoded dateline/date.</assert>

            <assert role="info"
                test="not(.[matches(., '((?:(?:the|this)\s+)?(\d{1,2})(?:st|d|nd|rd|th)?\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                >[FYI] This closer possibly contains an unencoded dateline/date (with date phrase
                partially spelled out).</assert>

            <assert role="info"
                test="not(.[matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                >[FYI] This closer possibly contains an unencoded dateline/date (with date phrase
                spelled out).</assert>

            <assert role="info"
                test="not(.[matches(., '(le\s+)?\d{1,2}(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+\d{4}|((janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre)\s+\d{1,2}(eme|ème|re)?,?\s+\d{4})', 'i')])"
                >[FYI] This closer possibly contains an unencoded French-language
                dateline/date.</assert>

            <assert role="info"
                test="not(.[matches(., '((el\s+)?(\d{1,2})\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?(\d{4}))', 'i')])"
                >[FYI] This closer possibly contains an unencoded Spanish-language
                dateline/date.</assert>

        </rule>

        <!-- For Dates without Attributes -->
        <rule context="tei:date[not(@when | @from | @to | @notBefore | @notAfter)]">
            <!-- dates from/to, in English -->
            <let name="month-eng"
                value="('january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december')"/>
            <let name="month-machine-readable-eng"
                value="('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12')"/>

            <!-- dates from/to, in French -->
            <let name="month-fr"
                value="('janvier', 'février', 'fevrier', 'mart', 'avril', 'mai', 'juin', 'juillet', 'août', 'aout', 'septembre', 'octobre', 'novembre', 'décembre', 'decembre')"/>
            <let name="month-machine-readable-fr"
                value="('01', '02', '02', '03', '04', '05', '06', '07', '08', '08', '09', '10', '11', '12', '12')"/>

            <!-- dates from/to, in Spanish -->
            <let name="month-sp"
                value="('enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'setiembre', 'octubre', 'noviembre', 'diciembre')"/>
            <let name="month-machine-readable-sp"
                value="('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12')"/>

            <assert role="warn"
                test="not(.[matches(., '(the\s+)?(\d{1,2})(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+\d{4}|((January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2}(st|d|nd|rd|th)?,?\s+\d{4})', 'i')])"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a date phrase that could be
                used for @when.</assert>

            <assert role="warn"
                test="not(matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i'))"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a date phrase that could be
                used for @from and @to.</assert>

            <assert role="warn"
                test="not(.[matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a date phrase (spelled out)
                that could be used for @when.</assert>

            <assert role="warn"
                test="not(matches(., '((?:(?:the|this)\s+)?(\d{1,2})(?:st|d|nd|rd|th)?\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i'))"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a date phrase (partially
                spelled out) that could be used for @when.</assert>

            <assert role="warn"
                test="not(.[matches(., '(le\s+)?\d{1,2}(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+\d{4}', 'i')])"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a French-language date
                phrase that could be used for @when.</assert>

            <assert role="warn"
                test="not(.[matches(., '((el\s+)?(\d{1,2})\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?(\d{4}))', 'i')])"
                sqf:fix="add-when-attribute">This &lt;date&gt; contains a Spanish-language date
                phrase that could be used for @when.</assert>

            <sqf:group id="add-when-attribute">

                <!-- Add @when Fix 1: month-day-year-regex-eng -->
                <sqf:fix
                    use-when="matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(d|nd|rd|st|th)?,?\s+(\d{4}))', 'i')"
                    id="add-when-attribute-MMDDYYYY-eng">
                    <let name="date-match"
                        value="analyze-string(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(d|nd|rd|st|th)?,?\s+(\d{4}))', 'i')"/>

                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '5']"/>
                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '2']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-eng, $month-machine-readable-eng)"/>
                    <let name="date"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '3'], '00')"/>
                    <let name="when" value="concat($year, '-', $month-digit, '-', $date)"/>

                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

                <!-- Add @when Fix 2: day-month-year-regex-eng -->
                <sqf:fix
                    use-when="matches(., '((the\s+)?(\d{1,2})(d|nd|rd|st|th)?(\s+of)?\s+?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4}))', 'i')"
                    id="add-when-attribute-DDMMYYYY-eng">
                    <let name="date-match"
                        value="analyze-string(., '((the\s+)?(\d{1,2})(d|nd|rd|st|th)?(\s+of)?\s+?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4}))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '7']"/>
                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-eng, $month-machine-readable-eng)"/>
                    <let name="date"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '3'], '00')"/>
                    <let name="when" value="concat($year, '-', $month-digit, '-', $date)"/>
                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

                <!-- Add @when Fix 3: month-day-range-year-regex-eng -->
                <sqf:fix
                    use-when="matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i')"
                    id="add-when-attribute-range-eng">
                    <let name="date-match"
                        value="analyze-string(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '5']"/>
                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '2']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-eng, $month-machine-readable-eng)"/>
                    <let name="date-from"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '3'], '00')"/>
                    <let name="date-to"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '4'], '00')"/>
                    <let name="from" value="concat($year, '-', $month-digit, '-', $date-from)"/>
                    <let name="to" value="concat($year, '-', $month-digit, '-', $date-to)"/>

                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="from" select="$from"/>
                    <sqf:add match="." node-type="attribute" target="to" select="$to"/>
                </sqf:fix>

                <!-- Add @when Fix 4: date-spelled-out-regex-eng -->
                <sqf:fix
                    use-when="matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')"
                    id="add-when-attribute-spelled-out-eng">
                    <let name="date-match"
                        value="analyze-string(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '4']"/>
                    <let name="year-thousands" value="$date-match-1//fn:group[attribute::nr eq '5']"/>
                    <let name="year-thousands-digit"
                        value="
                            if (matches($year-thousands, 'two\s+thousand')) then
                                '2'
                            else
                                if (matches($year-thousands, 'one\s+thousand')) then
                                    '1'
                                else
                                    ''"/>

                    <let name="year-hundreds" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="year-hundreds-digit"
                        value="
                            if (matches($year-hundreds, 'nine\s+hundred')) then
                                '9'
                            else
                                if (matches($year-hundreds, 'eight\s+hundred')) then
                                    '8'
                                else
                                    if (matches($year-hundreds, 'seven\s+hundred')) then
                                        '7'
                                    else
                                        ''"/>

                    <let name="year-tens-ones" value="$date-match-1//fn:group[attribute::nr eq '8']"/>
                    <let name="year-tens-digit"
                        value="
                            if (matches($year-tens-ones, 'ninety')) then
                                '9'
                            else
                                if (matches($year-tens-ones, 'eighty')) then
                                    '8'
                                else
                                    if (matches($year-tens-ones, 'seventy')) then
                                        '7'
                                    else
                                        if (matches($year-tens-ones, 'sixty')) then
                                            '6'
                                        else
                                            if (matches($year-tens-ones, 'fifty')) then
                                                '5'
                                            else
                                                if (matches($year-tens-ones, 'forty')) then
                                                    '4'
                                                else
                                                    if (matches($year-tens-ones, 'thirty')) then
                                                        '3'
                                                    else
                                                        if (matches($year-tens-ones, 'twenty')) then
                                                            '2'
                                                        else
                                                            if (matches($year-tens-ones, '(twelve$|eleven$|ten$|teen$)')) then
                                                                '1'
                                                            else
                                                                '0'"/>

                    <let name="year-ones-digit"
                        value="
                            if (matches($year-tens-ones, 'nine$|nineteen$')) then
                                '9'
                            else
                                if (matches($year-tens-ones, 'eight$|eighteen$')) then
                                    '8'
                                else
                                    if (matches($year-tens-ones, 'seven$|seventeen$')) then
                                        '7'
                                    else
                                        if (matches($year-tens-ones, 'six$|sixteen$')) then
                                            '6'
                                        else
                                            if (matches($year-tens-ones, 'five$|fifteen$')) then
                                                '5'
                                            else
                                                if (matches($year-tens-ones, 'four$|fourteen$')) then
                                                    '4'
                                                else
                                                    if (matches($year-tens-ones, 'three$|thirteen$')) then
                                                        '3'
                                                    else
                                                        if (matches($year-tens-ones, 'two$|twelve')) then
                                                            '2'
                                                        else
                                                            if (matches($year-tens-ones, 'one$|eleven')) then
                                                                '1'
                                                            else
                                                                '0'"/>

                    <let name="year-combined"
                        value="concat($year-thousands-digit, $year-hundreds-digit, $year-tens-digit, $year-ones-digit)"/>

                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '3']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-eng, $month-machine-readable-eng)"/>

                    <let name="date-phrase" value="$date-match-1//fn:group[attribute::nr eq '2']"/>

                    <let name="date-tens"
                        value="
                            if (matches($date-phrase, 'thirty')) then
                                '3'
                            else
                                if (matches($date-phrase, 'twenty')) then
                                    '2'
                                else
                                    if (matches($date-phrase, '(twelfth$|eleventh$|tenth$|teenth$)')) then
                                        '1'
                                    else
                                        '0'"/>

                    <let name="date-ones"
                        value="
                            if (matches($date-phrase, '(ninth$|nineteenth$)')) then
                                '9'
                            else
                                if (matches($date-phrase, '(eighth$|eighteenth$)')) then
                                    '8'
                                else
                                    if (matches($date-phrase, '(seventh$|seventeenth$)')) then
                                        '7'
                                    else
                                        if (matches($date-phrase, '(sixth$|sixteenth$)')) then
                                            '6'
                                        else
                                            if (matches($date-phrase, '(fifth$|fifteenth$)')) then
                                                '5'
                                            else
                                                if (matches($date-phrase, '(fourth$|fourteenth$)')) then
                                                    '4'
                                                else
                                                    if (matches($date-phrase, '(third$|thirteenth$)')) then
                                                        '3'
                                                    else
                                                        if (matches($date-phrase, '(second$|twelfth$)')) then
                                                            '2'
                                                        else
                                                            if (matches($date-phrase, '(first$|eleventh$)')) then
                                                                '1'
                                                            else
                                                                '0'"/>

                    <let name="date-digit" value="concat($date-tens, $date-ones)"/>

                    <let name="when"
                        value="concat($year-combined, '-', $month-digit, '-', $date-digit)"/>
                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

                <!-- Add @when Fix 5: day-month-year-partially-spelled-out-regex-eng -->
                <sqf:fix
                    use-when="matches(., '((?:(?:the|this)\s+)?(\d{1,2})(?:st|d|nd|rd|th)?\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')"
                    id="add-when-attribute-partially-spelled-out-eng">
                    <let name="date-match"
                        value="analyze-string(., '((?:(?:the|this)\s+)?(\d{1,2})(?:st|d|nd|rd|th)?\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>

                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '4']"/>

                    <let name="year-thousands" value="$date-match-1//fn:group[attribute::nr eq '5']"/>
                    <let name="year-thousands-digit"
                        value="
                            if (matches($year-thousands, 'two\s+thousand')) then
                                '2'
                            else
                                if (matches($year-thousands, 'one\s+thousand')) then
                                    '1'
                                else
                                    ''"/>

                    <let name="year-hundreds" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="year-hundreds-digit"
                        value="
                            if (matches($year-hundreds, 'nine\s+hundred')) then
                                '9'
                            else
                                if (matches($year-hundreds, 'eight\s+hundred')) then
                                    '8'
                                else
                                    if (matches($year-hundreds, 'seven\s+hundred')) then
                                        '7'
                                    else
                                        ''"/>

                    <let name="year-tens-ones" value="$date-match-1//fn:group[attribute::nr eq '8']"/>

                    <let name="year-tens-digit"
                        value="
                            if (matches($year-tens-ones, 'ninety')) then
                                '9'
                            else
                                if (matches($year-tens-ones, 'eighty')) then
                                    '8'
                                else
                                    if (matches($year-tens-ones, 'seventy')) then
                                        '7'
                                    else
                                        if (matches($year-tens-ones, 'sixty')) then
                                            '6'
                                        else
                                            if (matches($year-tens-ones, 'fifty')) then
                                                '5'
                                            else
                                                if (matches($year-tens-ones, 'forty')) then
                                                    '4'
                                                else
                                                    if (matches($year-tens-ones, 'thirty')) then
                                                        '3'
                                                    else
                                                        if (matches($year-tens-ones, 'twenty')) then
                                                            '2'
                                                        else
                                                            if (matches($year-tens-ones, '(twelve$|eleven$|ten$|teen$)')) then
                                                                '1'
                                                            else
                                                                '0'"/>

                    <let name="year-ones-digit"
                        value="
                            if (matches($year-tens-ones, 'nine$|nineteen$')) then
                                '9'
                            else
                                if (matches($year-tens-ones, 'eight$|eighteen$')) then
                                    '8'
                                else
                                    if (matches($year-tens-ones, 'seven$|seventeen$')) then
                                        '7'
                                    else
                                        if (matches($year-tens-ones, 'six$|sixteen$')) then
                                            '6'
                                        else
                                            if (matches($year-tens-ones, 'five$|fifteen$')) then
                                                '5'
                                            else
                                                if (matches($year-tens-ones, 'four$|fourteen$')) then
                                                    '4'
                                                else
                                                    if (matches($year-tens-ones, 'three$|thirteen$')) then
                                                        '3'
                                                    else
                                                        if (matches($year-tens-ones, 'two$|twelve')) then
                                                            '2'
                                                        else
                                                            if (matches($year-tens-ones, 'one$|eleven')) then
                                                                '1'
                                                            else
                                                                '0'"/>

                    <let name="year-combined"
                        value="concat($year-thousands-digit, $year-hundreds-digit, $year-tens-digit, $year-ones-digit)"/>

                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '3']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-eng, $month-machine-readable-eng)"/>

                    <let name="date" value="$date-match-1//fn:group[attribute::nr eq '2']"/>

                    <let name="date-digit" value="format-number($date, '00')"/>

                    <let name="when"
                        value="concat($year-combined, '-', $month-digit, '-', $date-digit)"/>
                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

                <!-- Add @when Fix 6: month-day-year-regex-fr -->
                <sqf:fix
                    use-when="matches(., '((le\s+)?(\d{1,2})(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+(\d{4}))', 'i')"
                    id="add-when-attribute-MMDDYYYY-fr">
                    <let name="date-match"
                        value="analyze-string(., '((le\s+)?(\d{1,2})(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+(\d{4}))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '7']"/>
                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-fr, $month-machine-readable-fr)"/>
                    <let name="date"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '3'], '00')"/>
                    <let name="when" value="concat($year, '-', $month-digit, '-', $date)"/>
                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

                <!-- Add @when Fix 7a: month-day-year-regex-sp -->
                <sqf:fix
                    use-when="matches(., '((el\s+)?(\d{1,2})\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?(\d{4}))', 'i')"
                    id="add-when-attribute-MMDDYYYY-sp">
                    <let name="date-match"
                        value="analyze-string(., '((el\s+)?(\d{1,2})\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?(\d{4}))', 'i')"/>
                    <let name="date-match-1" value="$date-match/fn:match[1]"/>
                    <let name="year" value="$date-match-1//fn:group[attribute::nr eq '9']"/>
                    <let name="month" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="month-digit"
                        value="functx:replace-multi(lower-case($month), $month-sp, $month-machine-readable-sp)"/>
                    <let name="date"
                        value="format-number($date-match-1//fn:group[attribute::nr eq '3'], '00')"/>

                    <let name="when" value="concat($year, '-', $month-digit, '-', $date)"/>
                    <sqf:description>
                        <sqf:title>Add @when attribute to &lt;date&gt;</sqf:title>
                    </sqf:description>
                    <sqf:add match="." node-type="attribute" target="when" select="$when"/>
                </sqf:fix>

            </sqf:group>
        </rule>

        <!-- For Unencoded PlaceNames in Datelines -->
        <rule context="tei:dateline[not(descendant::tei:placeName)]">

            <assert role="info"
                test=".[not(matches(., '(Aarhus|Aberdeen|Abidjan|Abo|Abu\s+Dhabi|Abuja|Acajutla|Acapulco|Accra|Adana|Addis\s+Ababa|Adelaide|Aden|Adrianople|Aegean\s+Sea\s+Islands|Agua\s+Prieta|Aguadilla|Aguas\s+Calientes|Aguatulco|Aintab|Aix\s+La\s+Chapelle|Akyab|Alamos|Albany|Albert\s+Town|Aleppo|Alexandretta|Alexandria|Algeciras|Algiers|Algoma|Alicante|Almaty|Almeria|Almirante|Altata|Altona|Alvouro\s+Obregon|Amapala|Amherstburg|Amiens|Amman|Amoor\s+River|Amoy|Ampala|Amsterdam|Ancona|Andorra|Andorra\s+la\s+Vella|Angers|Ankara|Antananarivo|Antilla|Antioch|Antofagasta|Antung|Antwerp|Apia|Aquin|Aracaju|Archangel|Arecibo|Arendal|Arequipa|Arica|Arnprior|Aruba|Ashgabat|Asmara|Aspinwall|Assioot|Assouan|Astana|Asuncion|Athens|Athlone|Auckland|Augsburg|Aux\s+Cayes|Aveiro|Avlona|Ayamonte|Babelsberg|Baden-Baden|Baghdad|Bahia|Bahia\s+Blanca|Bahia\s+de\s+Caraqeuz|Baida|Baku|Ballina|Ballymena|Bamako|Bamberg|Bandar\s+Seri\s+Begawan|Banes|Bangalore|Bangkok|Bangui|Banja\s+Luca|Banjul|Baracoa|Barcelona|Bari|Barmen|Barnsley|Barranquilla|Barrie|Basel|Basrah|Bassein|Basseterre|Bassorah|Batavian\s+Republic|Batopilas|Batum|Bay\s+of\s+Islands|Bayonne|Beaumaris|Beijing|Beirut|Belem|Belfast|Belgrade|Belize\s+City|Belleville|Bello\s+Horizonte|Belmopan|Benghazi|Beni\s+Saf|Benisouef|Bergen|Berlin|Bern|Biarritz|Bien\s+Hoa|Bilboa|Birmingham|Bishkek|Bissau|Bizerta|Black\s+River|Bloemfontein|Bluefields|Bocas\s+del\s+Toro|Bogota|Boguillas|Bologna|Boma|Bonacca|Bone-Bona|Bonn|Boodroom|Bordeaux|Boulogne|Bradford|Brake|Brantford|Brasilia|Bratislava|Brazoria|Brazzaville|Bremen|Bremerhaven|Breslau|Brest|Bridgetown|Brindisi|Brisbane|Bristol|Brockville|Brousa|Brunn|Brussels|Bucharest|Budapest|Buenaventura|Buenos\s+Aires|Bujumbura|Bukavu|Burslem|Burtscheid|Busan|Cadiz|Cagliari|Caibarien|Caimanera|Cairo|Calais|Caldera|Calgary|Cali|Callao|Camaguey|Camargo|Camp\s+David|Campbellton|Campeachy|Can\s+Tho|Cananea|Canberra|Candia|Cannes|Canton|Cape\s+Gracias\s+a\s+Dios|Cape\s+Haitien|Cape\s+Palmas|Cape\s+Town|Capri|Caracas|Cardenas|Cardiff|Carini|Caripito|Carleton|Carlisle|Carlsruhe|Carrara|Carril|Cartagena|Carthagena|Carupano|Casablanca|Cassel|Castellamare|Castries|Catania|Caudry|Cayenne|Ceara|Cebu|Cephalonia\s+Island|Cerro\s+de\s+Pasco|Cette|Ceuta|Champerico|Chanaral|Changchun|Changsha|Charleroi|Chatham|Chaux-de-fonds|Chefoo|Chengdu|Chennai|Cherbourg|Chiang\s+Mai|Chiclayo|Chicoutimi|Chihuahua|Chimbote|Chinanfu|Chinkiang|Chisinau|Chittagong|Christchurch|Christiansand|Chungking|Chunking|Chuquicamata|Cienfuegos|Ciudad\s+Bolivar|Ciudad\s+Del\s+Carmen|Ciudad\s+Juarez|Ciudad\s+Obregon|Ciudad\s+Porfirio\s+Diaz|Ciudad\s+Trujillo|Civita\s+Vecchia|Clarenceville|Clifton|Clinton|Cluj-Napoca|Coatzacoalcos|Cobh|Coblentz|Coburg|Cochabamba|Cochin|Coconada|Cognac|Collingwood|Collo|Cologne|Colombo|Colon|Colonia|Comayagua|Conakry|Concepcion|Concepcion\s+Del\s+Oro|Constantine|Copalquin|Copenhagen|Coquimbo|Corcubion|Cordoba|Corfu|Corinto|Cork|Corn\s+Island|Cornwall|Cornwallis|Coro|Coronel|Corunna|Coteau|Cotonou|Courtwright|Crefeld|Cronstadt|Cruz\s+Grande|Cumana|Curacao|Curitiba|Curityba|Cuxhaven|Daiguiri|Dairen|Dakar|Damascus|Damietta|Danang|Danzig|Dar\s+es\s+Salaam|Dardanelles|Dartmouth|Denia|Derby|Deseronto|Desterro|Dhahran|Dhaka|Dieppe|Dijon|Dili|Djibouti|Doha|Douala|Dover|Dresden|Duart|Dubai|Dublin|Dundee|Dunedin|Dunfermline|Dunkirk|Dunmore\s+Town|Durango|Durban|Dushanbe|Dyreford|Düsseldorf|East\s+London|Edinburgh|Edmonton|Eibenstock|El\s+Jadida|Elizabethville|Elsinore|Emden|Emerson|Ensenada|Enugu|Erbil|Erfurt|Erie|Erzerum|Esbjerg|Esmeraldas|Essaouira|Essen|Eten|Fajardo|Falmouth|Farnham|Faro|Fayal|Ferrol|Fiume|Florence|Flores|Florianopolis|Flushing|Foochow|Fort\s+Erie|Fort\s+William\s+and\s+Port\s+Authur|Fortaleza|Foynes|Frankfurt|Fredericia|Fredericton|Freetown|Frelighsburg|Frieburg|Frontera|Fukuoka|Funchal|Furth|Gaborone|Galashiels|Galliod|Gallipoli|Galt|Galveston|Galway|Gananoque|Garita\s+Gonzales|Garrucha|Gaspe|Gdansk|Geestemunde|Gefle|Geneva|Genoa|Georgetown|Gera|Ghent|Gibara|Gibraltar|Gijon|Gioja|Girgeh|Girgenti|Glasgow|Glauchau|Gloucester|Goderich|Godthaab|Golfito|Gonaives|Gore\s+Bay|Gothenburg|Governor’s\s+Harbor|Graciosa|Granada|Grand\s+Bassa|Grao|Green\s+Turtle\s+Cay|Greenock|Grenoble|Grenville|Guadalajara|Guadalupe\s+Y\s+Calvo|Guanajuato|Guangzhou|Guantanamo|Guatemala|Ciudad\s+de\s+Guatemala|Guatemala\s+City|Guayama|Guayaquil|Guaymas|Guazacualco|Guben|Guelph|Guernsey|Guerrero|Haida|Haifa|Hakodate|Halifax|Halsingborg|Hamburg|Hamilton|Hammerfest|Hangchow|Hankow|Hanoi|Hanover|Harare|Harbin|Harburg|Harput|Hartlepool|Habana|Havana|Havre|Havre\s+De\s+Grace|Helder|Helsingborg|Helsinki|Hemmingford|Herat|Hermosillo|Hesse\s+Cassel|Hesse\s+Darmstadt|Hilo|Hinchenbrooke|Ho\s+Chi\s+Minh\s+City|Holy\s+See|Holyhead|Homs|Honda|Honfleur|Hong\s+Kong|Honiara|Honolulu|Hoochelaga\s+and\s+Longeuil|Horgen|Horta|Huangpu|Huddersfield|Hue|Huelva|Hull|Huntington|Hyde\s+Park|Hyderabad|Ibadan|Ichang|Ile\s+De\s+Re|Ilo|Innsbruck|Iquique|Iquitos|Isfahan|Iskenderun|Islamabad|Isle\s+of\s+Wight|Ismaila|Istanbul|Ivica|Izmir|Jacmel|Jaffa|Jaffna|Jakarta|Jalapa|Jeddah|Jeremie|Jeres\s+de\s+la\s+Frontera|Jerusalem|Johannesburg|Juba|Kabul|Kaduna|Kahului|Kalamata|Kalgan|Kampala|Kanagawa|Karachi|Kathmandu|Kehl|Keneh|Kenora|Khartoum|Khorramshahr|Kidderminster|Kiev|Kigali|Kingston|Kingston\s+upon\s+Hull|Kingstown|Kinshasa|Kirkaldy|Kirkuk|Kisangani|Kishinev|Kiu\s+Kiang|Kobe|Kolding|Kolkata|Kolonia|Konigsberg|Koror|Kovno|Krakow|Kuala\s+Lumpur|Kuching|Kunming|Kuwait\s+City|Kweilin|Kyiv|La\s+Ceiba|La\s+Guaira|La\s+Oroya|La\s+Paz|La\s+Rochelle|La\s+Romana|Lachine|Lacolle|Lagos|Laguna\s+De\s+Terminos|Lahore|Lambayeque|Langen\s+Schwalbach|Laraiche\s+and\s+Asilah|Latakia|Lausanne|Lauthala|Leeds|Leghorn|Leicester|Leige|Leipzig|Leith|Leningrad|Leone|Lethbridge|Levis|Levuka|Libau|Libreville|Lille|Lilongwe|Lima|Limassol|Limerick|Limoges|Lindsay|Lisbon|Liverpool|Livingston|Ljubljana|Llanelly|Lobos|Lodz|Lome|Londenderry|London|Londonderry|Los\s+Mochis|Luanda|Lubeck|Lucerne|Lugano|Luneburg|Lurgan|Lusaka|Luxembourg|Luxor|Lyon|Macau|Maceio|Madras|Madrid|Magallanes|Magdalen\s+Islands|Magdalena|Magdeburg|Mahukona|Mainz|Majuro|Malabo|Malaga|Maldives|Male|Malmo|Malta|Managua|Manama|Manaos|Manaus|Manchester|Mandalay|Manila|Mannheim|Mansurah|Manta|Manzanillo|Maputo|Maracaibo|Maranhao|Marash|Markneukirchen|Marseille|Maseru|Matagalpa|Matagorda|Matamoros|Matanzas|Matthew\s+Town|Mayaguez|Mazar-e-Sharif|Mazatlan|Mbabana|Mbabane|Medan|Medellin|Melbourne|Melekeok|Melilla|Mendoza|Mentone|Merida|Mersine|Meshed|Messina|Mexicali|México|Mexico\s+City|Mexico,\s+D.\s+F.|México,\s+D.\s+F.|Midland|Mier|Milan|Milazzo|Milford\s+Haven|Milk\s+River|Minatitlan|Minich|Minsk|Miragoane|Mogadishu|Mollendo|Mombasa|Monaco|Monganui|Monrovia|Montego\s+Bay|Monterrey|Montevideo|Montreal|Morelia|Morlaix|Moroni|Morpeth|Morrisburgh|Moscow|Mostar|Moulmein|Mukden|Mulhausen|Mumbai|Munich|Murree|Muscat|Nacaome|Nagasaki|Nagoya|Naguabo|Naha,\s+Okinawa|Nairobi|Nancy|Nanking|Nantes|Napanee|Naples|Nassau|Natal|Neustadt|New\s+Delhi|New\s+York|Newcastle|Newchwang|Newport|Newry|Nha\s+Trang|Niagara\s+Falls|Niamey|Nice|Nicosia|Niewediep|Ningpo|Nogales|Norrkoping|North\s+Bay|Nottingham|Nouakchott|Nuevitas|Nuevo\s+Laredo|Nukualofa|Nuku’alofa|Nuremberg|Nuuk|N’Djamena|N’Djamena|Oaxaca|Ocean\s+Falls|Ocos|Odense|Odessa|Old\s+Harbor|Omoa|Omsk|Oporto|Oran|Orillia|Oruro|Osaka|Oshawa|Oslo|Otranto|Ottawa|Ouagadougou|Owen\s+Sound|Pago\s+Pago|Paita|Palamos|Palermo|Palikir|Palma\s+de\s+Mallorca|Panamá|Panama|Panama\s+City|Pará|Paraiba|Paramaribo|Paris|Parral|Parry\s+Sound|Paso\s+Del\s+Norte|Paspebiac|Patras|Pau|Paysandu|Peiping|Peking|Penang|Penedo|Perigueux|Pernambuco|Perth|Peshawar|Pesth|Peterborough|Petit\s+Goave|Petrograd|Phnom\s+Penh|Picton|Piedras\s+Negras|Piraeus|Piura|Plauen|Plymouth|Podgorica|Point\s+De\s+Galle|Point\s+Levi|Ponce|Ponta\s+Delgada,\s+Azores|Porsgrund|Port\s+Antonio|Port\s+Arthur|Port\s+Elizabeth|Port\s+Hope|Port\s+Limon|Port\s+Louis|Port\s+Maria|Port\s+Morant|Port\s+Moresby|Port\s+Rowan|Port\s+Said|Port\s+St.\s+Mary’s|Port\s+Stanley|Port\s+Vila|Port\s+au\s+Prince|Port\s+de\s+Paix|Port\s+of\s+Marbella|Port\s+of\s+Spain|Port-au-Prince|Porto\s+Alegre|Porto\s+Novo|Portsmouth|Potosi|Potsdam|Poznan|Pozzuoli|Prague|Praha|Praia|Prescott|Pretoria|Prince\s+Rupert|Pristina|Progreso|Puebla|Puerto\s+Armuelles|Puerto\s+Barrios|Puerto\s+Bello|Puerto\s+Cabello|Puerto\s+Cabezas|Puerto\s+La\s+Cruz|Puerto\s+Libertador|Puerto\s+Mexico|Puerto\s+Perez|Puerto\s+Plata|Puerto\s+Principe|Puerto\s+Vallarta|Punta\s+Arenas|Puntarenas|Pyongyang|Quebec|Quepos|Quezaltenango|Quito|Rabat|Rangoon|Ravenna|Rawalpindi|Recife|Redditch|Reggio|Regina|Reichenberg|Rennes|Reval|Reykjavik|Reynosa|Rheims|Rhenish|Ribe|Riga|Rio\s+Bueno|Rio\s+Grande\s+Do\s+Sul|Rio\s+Hacha|Rio\s+de\s+Janeiro|Ritzebuttel|Riviere\s+Du\s+Loup|Riyadh|Rochefort|Rodi\s+Garganico|Rome|Rosario|Roseau|Rostoff|Rotterdam|Roubaix|Rouen|Ruatan|Rustchuk|Sabanilla|Sabine|Safi|Sagua\s+La\s+Granda|Saigon|Saint\s+George’s|Saint\s+John’s|Salango|Salaverry|Salerno|Salina\s+Cruz|Salonika|Saltillo|Salvador|Salzburg|Samana|San\s+Andres|San\s+Antonio|San\s+Benito|San\s+Cristobal|San\s+Felin\s+de\s+Guxols|San\s+Francisco|San\s+Jose|San\s+José|San\s+Juan|San\s+Juan\s+de\s+los\s+Remedios|San\s+Juan\s+del\s+Norte|San\s+Juan\s+del\s+Sur|San\s+Lucar\s+de\s+Barrameda|San\s+Luis\s+Potosi|San\s+Marino|San\s+Pedro\s+Sula|San\s+Pedro\s+de\s+Macoris|San\s+Remo|San\s+Salvador|San\s+Sebastian|Sanaa|Sana’a|Sancti\s+Spiritus|Santa\s+Clara|Santa\s+Cruz|Santa\s+Cruz\s+Point|Santa\s+Fe|Santa\s+Marta|Santa\s+Rosalia|Santander|Santiago|Santiago\s+de\s+Los\s+Caballeros|Santo\s+Domingo|Santos|Sao\s+Tome|Sapporo|Sarajevo|Sarnia|Sault\s+Ste.\s+Marie|Savannah\s+La\s+Mar|Schiedam|Sedan|Seoul|Setubal|Seville|Seychelles|Shanghai|Sheffield|Shenyang|Sherbrooke|Shimonoseki|Shiraz|Sidon|Sierra\s+Mojada|Simoda|Simonstown|Singapore|Sivas|Skopje|Sligo|Smith’s\s+Falls|Sofia|Sohag|Solingen|Songkhla|Sonneberg|Sorau|Sorrento|Southampton|Spezzia|St.\s+Andero|St.\s+Ann’s\s+Bay|St.\s+Catherines|St.\s+Etienne|St.\s+Eustatius|St.\s+Gall|St.\s+George|St.\s+George’s|St.\s+Helen’s|St.\s+John|St.\s+Johns|St.\s+Leonards|St.\s+Malo|St.\s+Marc|St.\s+Michael’s|St.\s+Nazaire|St.\s+Petersburg|St.\s+Salvador|St.\s+Stephen|Stanbridge|Stanleyville|Stanstead\s+Junction|Stavanger|Stettin|Stockholm|Stoke\s+on\s+Trent|Strasbourg|Stratford|Stuttgart|Sudbury|Suez|Sunderland|Sundsvall|Surabaya|Sutton|Suva|Swatow|Swinemunde|Sydney|Syra|São\s+Paulo|Tabasco|Tabriz|Tacna|Taganrog|Taipei|Taiz|Talcahuano|Tallinn|Tamatave|Tampico|Tangier|Tapachula|Taranto|Tarawa\s+Atoll|Tarragona|Tarsus|Tashkent|Tbilisi|Tegucigalpa|Teheran|Tehran|Tehuantepect|Tel\s+Aviv|Tela|Tereira|Tetouan|The\s+Hague|Thessaloniki|Thimphu|Tientsin|Tiflis|Tihwa|Tijuana|Tirana|Tirane|Tlacotalpam|Tocopilla|Tokyo|Topia|Topolobampo|Toronto|Torreon|Torrevieja|Toulon|Toulouse|Tovar|Trapani|Trebizond|Trenton|Trieste|Trinidad|Tripoli|Tromso|Trondhjem|Troon|Troyes|Trujillo|Tsinan|Tsingtao|Tumbes|Tunis|Tunstall|Turin|Tutuila|Tuxpam|Udorn|Ulaanbaatar|Utilla|Vaduz|Vaiaku\s+village|Valdivia|Valencia|Valera|Valletta|Valparaiso|Vancouver|Vardo|Vatican\s+City|Velasco|Venice|Vera\s+Cruz|Verona|Versailles|Verviers|Vevey|Vianna|Viborg|Vichy|Victoria|Vienna|Vientiane|Vigo|Vilnius|Vivero|Vlaardingen|Vladivostok|Volo|Warsaw|Washington|Washington,\s+D.C.|Waterford|Waterloo|Waubaushene|Weimar|Wellington|Weymouth|Whitby|White\s+Horse|Wiarton|Windhoek|Windsor|Wingham|Winnipeg|Winterthur|Wolverhampton|Worcester|Wuhan|Yalta|Yamoussoukro|Yangon|Yaounde|Yekaterinburg|Yenan|Yerevan|Yokkaichi|Yokohama|Yuscaran|Zacatecas|Zagreb|Zante|Zanzibar|Zaza|Zittau|Zomba|Zurich)'))]"
                >[FYI] This dateline contains a candidate for &lt;placeName&gt;.</assert>

        </rule>

        <!-- For Documents and Attachments without `date`, Look for Unencoded Dates in First Paragraphs -->
        <rule
            context="(tei:div[attribute::subtype eq 'historical-document'] | frus:attachment)[not(descendant::tei:date) and not(descendant::tei:quote)]/tei:p[position() = 1][starts-with(., '[')]">
            <let name="first-paragraph" value="."/>
            <let name="first-paragraph-content" value="./node()"/>
            <let name="rendition"
                value="
                    if (./attribute::rend eq 'left') then
                        '#left'
                    else
                        if (./attribute::rend eq 'center') then
                            '#center'
                        else
                            null"/>
            <let name="line-break" value="element(tei:lb)"/>
            <let name="opener-dateline" value="element(tei:opener)/element(tei:dateline)"/>

            <assert role="info"
                test="not(.[matches(., '(the\s+)?\d{1,2}(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4})|((January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2}(st|d|nd|rd|th)?,?\s+\d{4})')])"
                sqf:fix="fix-date-in-first-paragraph">[FYI] This first paragraph possibly contains
                an unencoded dateline/date.</assert>

            <assert role="info"
                test="not(matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i'))"
                sqf:fix="fix-date-in-first-paragraph">[FYI] This first paragraph possibly contains
                an unencoded dateline/date range.</assert>

            <assert role="info"
                test="not(.[matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                sqf:fix="fix-date-in-first-paragraph">[FYI] This first paragraph possibly contains
                an unencoded dateline/date (with date phrase spelled out).</assert>

            <sqf:group id="fix-date-in-first-paragraph">

                <!-- First Paragraph: Fix 1a -->
                <sqf:fix id="convert-p-to-opener-dateline">
                    <sqf:description>
                        <sqf:title>Convert first paragraph to opener/dateline</sqf:title>
                        <sqf:p>Convert first &lt;p&gt; to &lt;opener/dateline&gt; in the current
                            document; retain node content</sqf:p>
                    </sqf:description>
                    <sqf:replace
                        use-when=".[not(preceding-sibling::*[position() = 1][self::tei:opener])] and .[not(attribute::rend)]"
                        node-type="element" target="tei:opener">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#center">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:replace>
                    <sqf:replace
                        use-when=".[not(preceding-sibling::*[position() = 1][self::tei:opener])] and ./attribute::rend = 'center'"
                        node-type="element" target="tei:opener">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#center">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:replace>
                    <sqf:replace
                        use-when=".[not(preceding-sibling::*[position() = 1][self::tei:opener])] and ./attribute::rend = ('left', 'flushleft')"
                        node-type="element" target="tei:opener">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:replace>
                    <sqf:replace
                        use-when=".[not(preceding-sibling::*[position() = 1][self::tei:opener])] and ./attribute::rend = 'right'"
                        node-type="element" target="tei:opener">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#right">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:replace>
                </sqf:fix>

                <!-- Last Paragraph: Fix 1b -->
                <sqf:fix id="add-dateline-in-existing-opener">
                    <sqf:description>
                        <sqf:title>Add paragraph content as `dateline` in existing
                            `opener`</sqf:title>
                        <sqf:p>Add &lt;p&gt; content as `dateline` in existing &lt;opener&gt;;
                            retain node content</sqf:p>
                    </sqf:description>
                    <sqf:add
                        use-when=".[preceding-sibling::*[position() = 1][self::tei:opener]] and .[not(attribute::rend)]"
                        match="./preceding-sibling::tei:opener" position="last-child">
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#center">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:add>
                    <sqf:add
                        use-when=".[preceding-sibling::*[position() = 1][self::tei:opener]] and ./attribute::rend eq 'center'"
                        match="./preceding-sibling::tei:opener" position="last-child">
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#center">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:add>
                    <sqf:add
                        use-when=".[preceding-sibling::*[position() = 1][self::tei:opener]] and ./attribute::rend = ('left', 'flushleft')"
                        match="./preceding-sibling::tei:opener" position="last-child">
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:add>
                    <sqf:add
                        use-when=".[preceding-sibling::*[position() = 1][self::tei:opener]] and ./attribute::rend eq 'right'"
                        match="./preceding-sibling::tei:opener" position="last-child">
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#right">
                            <sqf:copy-of select="$first-paragraph-content"/>
                        </dateline>
                    </sqf:add>

                    <sqf:delete match="."/>
                </sqf:fix>

            </sqf:group>

        </rule>


        <!-- For Documents and Attachments without `date`, Look for Unencoded Dates in Last Paragraphs -->
        <rule
            context="(tei:div[attribute::subtype eq 'historical-document'] | frus:attachment)[not(descendant::tei:date) and not(descendant::tei:quote)]/tei:p[position() = last()]">
            <let name="last-paragraph" value="."/>
            <let name="last-paragraph-content" value="./node()"/>
            <let name="line-break" value="element(tei:lb)"/>
            <let name="closer-dateline" value="element(tei:closer)/element(tei:dateline)"/>
            <assert role="info"
                test="not(.[matches(., '(the\s+)?\d{1,2}(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4})|((January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2}(st|d|nd|rd|th)?,?\s+\d{4})')])"
                sqf:fix="fix-date-in-last-paragraph">[FYI] This last paragraph possibly contains an
                unencoded dateline/date.</assert>

            <assert role="info"
                test="not(matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i'))"
                sqf:fix="fix-date-in-last-paragraph">[FYI] This last paragraph possibly contains an
                unencoded dateline/date range.</assert>

            <assert role="info"
                test="not(.[matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                sqf:fix="fix-date-in-last-paragraph">[FYI] This last paragraph possibly contains an
                unencoded dateline/date (with date phrase spelled out).</assert>

            <assert role="info"
                test="not(.[matches(., '(le\s+)?\d{1,2}(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+\d{4}|((janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre)\s+\d{1,2}(eme|ème|re)?,?\s+\d{4})', 'i')])"
                sqf:fix="fix-date-in-last-paragraph">[FYI] This last paragraph possibly contains an
                unencoded French-language dateline/date.</assert>

            <assert role="info"
                test="not(.[matches(., '(el\s+)?\d{1,2}\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?\d{4}|((enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre)\s+\d{1,2},?\s+\d{4})', 'i')])"
                sqf:fix="fix-date-in-last-paragraph">[FYI] This last paragraph possibly contains an
                unencoded Spanish-language dateline/date.</assert>

            <sqf:group id="fix-date-in-last-paragraph">

                <!-- Last Paragraph: Fix 1a -->
                <sqf:fix id="convert-p-to-closer-dateline">
                    <sqf:description>
                        <sqf:title>Convert last paragraph to closer/dateline</sqf:title>
                        <sqf:p>Convert last &lt;p&gt; to &lt;closer/dateline&gt; in the current
                            document; retain node content</sqf:p>
                    </sqf:description>
                    <sqf:replace
                        use-when=".[not(following-sibling::*[position() = 1][self::tei:closer])]"
                        node-type="element" target="tei:closer">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$last-paragraph-content"/>
                        </dateline>
                    </sqf:replace>
                </sqf:fix>

                <!-- Last Paragraph: Fix 1b -->
                <sqf:fix id="add-dateline-in-existing-closer">
                    <sqf:description>
                        <sqf:title>Add paragraph content as `dateline` in existing
                            `closer`</sqf:title>
                        <sqf:p>Add &lt;p&gt; content as `dateline` in existing &lt;closer&gt;;
                            retain node content</sqf:p>
                    </sqf:description>
                    <sqf:add use-when=".[following-sibling::*[position() = 1][self::tei:closer]]"
                        match="./following-sibling::tei:closer" position="first-child">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$last-paragraph-content"/>
                        </dateline>
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                    </sqf:add>
                    <sqf:delete match="."/>
                </sqf:fix>

            </sqf:group>
        </rule>

        <!-- For Documents and Attachments without `date`, Look for Unencoded Dates in Postscripts -->
        <rule
            context="tei:postscript[not(parent::tei:div[attribute::subtype = ('editorial-note', 'errata')]) and not(parent::tei:div[descendant::tei:date]) and not(parent::frus:attachment[descendant::tei:date]) and not(parent::tei:quote)]">
            <assert role="info"
                test="not(.[matches(., '(the\s+)?\d{1,2}(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+\d{4}|((January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2}(st|d|nd|rd|th)?,?\s+\d{4})')])"
                sqf:fix="fix-date-in-postscript">[FYI] This postscript possibly contains an
                unencoded dateline/date.</assert>

            <assert role="info"
                test="not(matches(., '((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(?:st|d|nd|rd|th)?\s*[-–—]\s*(\d{1,2})(?:st|d|nd|rd|th)?,?\s+(\d{4}))', 'i'))"
                sqf:fix="fix-date-in-postscript">[FYI] This postscript possibly contains an
                unencoded dateline/date range.</assert>

            <assert role="info"
                test="not(.[matches(., '((?:(?:the|this)\s+)?((?:thirty|twenty)?(?:-|–)?(?:thirtieth|twentieth|nineteenth|eighteenth|seventeenth|sixteenth|fifteenth|fourteenth|thirteenth|twelfth|eleventh|tenth|ninth|eighth|seventh|sixth|fifth|fourth|third|second|first))\s+day\s+of\s+(January|February|March|April|May|June|July|August|September|October|November|December),?\s+in\s+the\s+year\s+of\s+(?:our|the)\s+lord\s+(((?:one|two)\s+thousand)\s+((?:nine|eight)?\s+hundred)\s+(and\s+)?((?:ninety|eighty|seventy|sixty|fifty|forty|thirty|twenty)?(?:-|–)?\s*(?:nineteen|eighteen|seventeen|sixteen|fifteen|fourteen|thirteen|twelve|eleven|ten|nine|eight|seven|six|five|four|three|two|one)?)))', 'i')])"
                sqf:fix="fix-date-in-postscript">[FYI] This postscript possibly contains an
                unencoded dateline/date (with date phrase spelled out).</assert>

            <assert role="info"
                test="not(.[matches(., '(le\s+)?\d{1,2}(eme|ème|re)?\s+(de\s+)?(janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre),?\s+\d{4}|((janvier|février|fevrier|mart|avril|mai|juin|juillet|août|aout|septembre|octobre|novembre|décembre|decembre)\s+\d{1,2}(eme|ème|re)?,?\s+\d{4})')])"
                sqf:fix="fix-date-in-postscript">[FYI] This postscript possibly contains an
                unencoded French-language dateline/date.</assert>

            <assert role="info"
                test="not(.[matches(., '(el\s+)?\d{1,2}\s+((de|del)\s+)?(enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre),?\s+((de|del)\s+)?\d{4}|((enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|setiembre|octubre|noviembre|diciembre)\s+\d{1,2},?\s+\d{4})')])"
                sqf:fix="fix-date-in-postscript">[FYI] This postscript possibly contains an
                unencoded Spanish-language dateline/date.</assert>

            <let name="postscript" value="."/>
            <let name="postscript-content" value="./tei:p/node()"/>

            <sqf:group id="fix-date-in-postscript">

                <!-- Postscript: Fix 1 -->
                <sqf:fix id="convert-postscript-to-new-closer-dateline">
                    <sqf:description>
                        <sqf:title>Convert &lt;postscript&gt; to new
                            &lt;closer/dateline&gt;</sqf:title>
                        <sqf:p>Convert &lt;postscript&gt; to new &lt;closer/dateline&gt; in the
                            current document; retain node content</sqf:p>
                    </sqf:description>
                    <sqf:replace use-when="." node-type="element" target="tei:closer">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$postscript-content"/>
                        </dateline>
                    </sqf:replace>
                </sqf:fix>

                <!-- Postscript: Fix 2 -->
                <sqf:fix id="convert-postscript-to-dateline-in-preceding-closer">
                    <sqf:description>
                        <sqf:title>Convert &lt;postscript&gt; to &lt;dateline&gt; in the preceding
                            &lt;closer&gt;</sqf:title>
                        <sqf:p>Convert &lt;postscript&gt; to &lt;dateline&gt; in the preceding
                            &lt;closer&gt; in the current document; retain node content</sqf:p>
                    </sqf:description>
                    <sqf:add use-when=".[preceding-sibling::tei:closer]"
                        match="./preceding-sibling::tei:closer" position="last-child">
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$postscript-content"/>
                        </dateline>
                    </sqf:add>
                    <sqf:delete match="$postscript-content"/>
                    <sqf:add node-type="comment">The date phrase has been added to the preceding
                        closer. Edit or delete existing postscript as necessary.</sqf:add>
                </sqf:fix>

                <!-- Postscript: Fix 3 -->
                <sqf:fix id="convert-postscript-to-dateline-in-following-closer">
                    <sqf:description>
                        <sqf:title>Convert &lt;postscript&gt; to &lt;dateline&gt; in the following
                            &lt;closer&gt;</sqf:title>
                        <sqf:p>Convert &lt;postscript&gt; to &lt;dateline&gt; in the preceding
                            &lt;closer&gt; in the current document; retain node content</sqf:p>
                    </sqf:description>
                    <sqf:add use-when=".[following-sibling::*[position() = 1][self::tei:closer]]"
                        match="./following-sibling::tei:closer" position="first-child">
                        <dateline xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
                            <sqf:copy-of select="$postscript-content"/>
                        </dateline>
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/>
                    </sqf:add>
                    <sqf:delete match="$postscript-content"/>
                    <sqf:add node-type="comment">The date phrase has been added to the following
                        closer. Edit or delete existing postscript as necessary.</sqf:add>
                </sqf:fix>

            </sqf:group>

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

    <xsl:function name="functx:if-absent" as="item()*" xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="item()*"/>
        <xsl:param name="value" as="item()*"/>

        <xsl:sequence
            select="
                if (exists($arg)) then
                    $arg
                else
                    $value"/>

    </xsl:function>

    <xsl:function name="functx:replace-multi" as="xs:string?" xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:param name="changeFrom" as="xs:string*"/>
        <xsl:param name="changeTo" as="xs:string*"/>

        <xsl:sequence
            select="
                if (count($changeFrom) > 0) then
                    functx:replace-multi(replace($arg, $changeFrom[1], functx:if-absent($changeTo[1], '')), $changeFrom[position() > 1], $changeTo[position() > 1])
                else
                    $arg"/>

    </xsl:function>

</schema>

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
            <assert role="warning" sqf:fix="fix-date-attributes"
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

    <!-- Supporting XSLT functions for date processing -->

    <!-- Function to analyze a date string and perform analysis. The returned map's 'output' entry contains the expected date attribute(s). -->
    <xsl:function as="map(*)?" name="dates:analyze-date">
        <xsl:param as="xs:string" name="date-string"/>
        <xsl:variable as="xs:string" name="date-s" select="normalize-space($date-string)"/>
        <xsl:variable as="map(*)*" name="candidates">
            <!-- Apply the regex patterns one by one, passing matches to the functions defined for capturing and formatting date components -->
            <xsl:for-each select="dates:patterns()">
                <xsl:variable name="pattern" select="."/>
                <xsl:variable name="analyze"
                    select="analyze-string($date-s, '^' || $pattern?regex || '$')"/>
                <xsl:if test="$analyze/fn:match">
                    <xsl:variable as="map(*)*" name="components">
                        <xsl:for-each select="$analyze/fn:match/fn:group">
                            <xsl:variable name="n" select="position()"/>
                            <xsl:variable name="capture" select="$pattern?capture[$n]"/>
                            <xsl:sequence select="$capture(.)"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:sequence
                        select="$pattern => map:put('analyze', $analyze) => map:put('input', $date-s) => map:put('output', $pattern?format[2]($pattern?format[1]($components)))"
                    />
                </xsl:if>
            </xsl:for-each>
            <!-- Try again without the anchors, to find matches anywhere in the date string -->
            <xsl:for-each select="dates:patterns()">
                <xsl:variable name="pattern" select="."/>
                <xsl:variable name="analyze" select="analyze-string($date-s, $pattern?regex)"/>
                <xsl:if test="$analyze/fn:match">
                    <xsl:variable as="map(*)*" name="components">
                        <xsl:for-each select="$analyze/fn:match/fn:group">
                            <xsl:variable name="n" select="position()"/>
                            <xsl:variable name="capture" select="$pattern?capture[$n]"/>
                            <xsl:sequence select="$capture(.)"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:sequence
                        select="$pattern => map:put('analyze', $analyze) => map:put('input', $date-s) => map:put('output', $pattern?format[2]($pattern?format[1]($components)))"
                    />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <!-- Return only the first set of result; pass a warning if none matched -->
        <xsl:sequence select="
                if (exists($candidates)) then
                    head($candidates)
                else
                    map {
                        'input': $date-s,
                        'warn': 'Date did not match any known pattern; please review'
                    }"/>
    </xsl:function>

    <!-- This function defines regular expression patterns for various date components (e.g., months, days, times). -->
    <xsl:function as="map(*)*" name="dates:patterns">
        <xsl:variable as="xs:string" name="month"
            select="'(January|February|March|April|May|June|July|August|September|October|November|December)'"/>
        <xsl:variable as="xs:string" name="day" select="'(3[01]|[12][0-9]|[1-9])'"/>
        <xsl:variable as="xs:string" name="year" select="'(\d{4})'"/>
        <xsl:variable as="xs:string" name="zulu" select="'(\d{4}Z)'"/>
        <xsl:variable as="xs:string" name="am-pm" select="'(a\.m\.|p\.m\.)'"/>
        <xsl:variable as="xs:string" name="hours" select="'(1[0-2]|[1-9])'"/>
        <xsl:variable as="xs:string" name="minutes" select="'([0-5][0-9])'"/>
        <xsl:variable as="xs:string" name="noon" select="'(noon)'"/>
        <xsl:variable as="xs:string" name="midnight" select="'(midnight)'"/>
        <!-- Ordering of time-related regex groups is significant in dates:analyze-time function -->
        <xsl:variable as="xs:string" name="time"
            select="'(' || (: Groups 1-3 :) $hours || ':' || $minutes || ' ' || $am-pm || '|' || (: 4-5 :) $hours || ':' || $minutes || '|' || (: 6-7 :) $hours || ' ' || $am-pm || '|' || (: 8 :) $hours || '|' || (: 9 :) $noon || '|' || (: 10 :) $midnight || ')'"/>
        <xsl:variable as="xs:string" name="time-range" select="'(' || $time || '–' || $time || ')'"/>
        <xsl:variable as="xs:string" name="undated" select="'(undated|Undated)'"/>
        <!-- Patterns ordered from longest to shortest, to ensure longest matches are found first, when used without regex anchors. -->
        <xsl:sequence select="
                (map {
                    'name': 'M-D1-D2-Y-T1-T2',
                    'regex': $month || ' ' || $day || '–' || $day || ', ' || $year || ', ' || $time-range,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-day#1, dates:capture-year#1, dates:capture-time-range#1),
                    'format': (dates:format-ymd1t1d2t2#1, dates:from-to#1)
                },
                map {
                    'name': 'M-D1-D2-Y',
                    'regex': $month || ' ' || $day || '–' || $day || ', ' || $year,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-day#1, dates:capture-year#1),
                    'format': (dates:format-ymd1-ymd2#1, dates:from-to#1)
                },
                map {
                    'name': 'M-D-Y-Z',
                    'regex': $month || ' ' || $day || ', ' || $year || ', ' || $zulu,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-year#1, dates:capture-zulu#1),
                    'format': (dates:format-ymdz#1, dates:when#1)
                },
                map {
                    'name': 'M-D-Y-T1-T2',
                    'regex': $month || ' ' || $day || ', ' || $year || ', ' || $time-range,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-year#1, dates:capture-time-range#1),
                    'format': (dates:format-ymdt1t2#1, dates:from-to#1)
                },
                map {
                    'name': 'M-D-Y-T',
                    'regex': $month || ' ' || $day || ', ' || $year || ', ' || $time,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-year#1, dates:capture-time#1),
                    'format': (dates:format-ymdt#1, dates:when#1)
                },
                map {
                    'name': 'M-D-Y',
                    'regex': $month || ' ' || $day || ', ' || $year,
                    'capture': (dates:capture-month#1, dates:capture-day#1, dates:capture-year#1),
                    'format': (dates:format-ymd#1, dates:when#1)
                },
                map {
                    'name': 'M-Y',
                    'regex': $month || ' ' || $year,
                    'capture': (dates:capture-month#1, dates:capture-year#1),
                    'format': (dates:format-ym#1, dates:when#1)
                },
                map {
                    'name': 'U',
                    'regex': $undated,
                    'capture': dates:capture-undated#1,
                    'format': (dates:format-undated#1, (: swallow results to avoid raising errors when notBefore/notAfter is not present :) dates:nullify#1)
                })"/>
    </xsl:function>

    <!-- Function to capture and process a month string -->
    <xsl:function as="map(*)" name="dates:capture-month">
        <xsl:param as="xs:string" name="month"/>
        <xsl:variable as="xs:string*" name="months"
            select="('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')"/>
        <xsl:variable as="xs:integer" name="month-n" select="index-of($months, $month)"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'month'"/>
            <xsl:map-entry key="'input'" select="$month"/>
            <xsl:map-entry key="'output'" select="format-integer($month-n, '00')"/>
        </xsl:map>
    </xsl:function>

    <!-- Function to capture and process a day string -->
    <xsl:function as="map(*)" name="dates:capture-day">
        <xsl:param as="xs:string" name="day"/>
        <xsl:variable as="xs:integer" name="day-n" select="xs:integer($day)"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'day'"/>
            <xsl:map-entry key="'input'" select="$day"/>
            <xsl:map-entry key="'output'" select="format-integer($day-n, '00')"/>
        </xsl:map>
    </xsl:function>

    <!-- Function to capture and process a year string -->
    <xsl:function as="map(*)" name="dates:capture-year">
        <xsl:param as="xs:string" name="year"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'year'"/>
            <xsl:map-entry key="'input'" select="$year"/>
            <xsl:map-entry key="'output'" select="$year"/>
        </xsl:map>
    </xsl:function>

    <!-- This function captures and normalizes "Z" time values to the format expected in later date enrichment checks. -->
    <xsl:function as="map(*)" name="dates:capture-zulu">
        <xsl:param as="xs:string" name="zulu"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'zulu'"/>
            <xsl:map-entry key="'input'" select="$zulu"/>
            <xsl:map-entry key="'output'"
                select="substring($zulu, 1, 2) || ':' || substring($zulu, 3, 2) || ':00+00:00'"/>
        </xsl:map>
    </xsl:function>

    <!-- This function processes a time group, using analysis to determine components like hour, minute, and AM/PM offset. -->
    <xsl:function as="map(*)" name="dates:capture-time">
        <xsl:param as="element(fn:group)" name="group"/>
        <xsl:variable name="time" select="dates:analyze-time($group)"/>
        <xsl:sequence select="dates:process-time($group, $time)"/>
    </xsl:function>

    <!-- This function handles date-time ranges, ensuring start and end times are analyzed and aligned appropriately. -->
    <xsl:function as="map(*)+" name="dates:capture-time-range">
        <xsl:param as="element(fn:group)" name="group"/>
        <xsl:variable name="start-time" select="$group/fn:group[1]"/>
        <xsl:variable name="end-time" select="$group/fn:group[2]"/>
        <xsl:variable name="start-time-analysis" select="dates:analyze-time($start-time)"/>
        <xsl:variable name="end-time-analysis" select="dates:analyze-time($end-time)"/>
        <!-- Adjust the '1' in '1–2 p.m.' to '13:00', but don't adjust the '12' in '12–1 p.m.' to '24:00' -->
        <xsl:variable name="adjusted-start-time-analysis" select="
                if (empty($start-time-analysis?am-pm-offset) and exists($end-time-analysis?am-pm-offset)) then
                    if ($start-time-analysis?hour eq 12) then
                        $start-time-analysis
                    else
                        map:put($start-time-analysis, 'am-pm-offset', $end-time-analysis?am-pm-offset)
                else
                    $start-time-analysis"/>
        <xsl:sequence
            select="(dates:process-time($start-time, $adjusted-start-time-analysis), dates:process-time($end-time, $end-time-analysis))"
        />
    </xsl:function>

    <!-- This function processes undated values, primarily preserving and returning them unchanged. -->
    <xsl:function as="map(*)" name="dates:capture-undated">
        <xsl:param as="xs:string" name="undated"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'undated'"/>
            <xsl:map-entry key="'input'" select="$undated"/>
            <xsl:map-entry key="'output'" select="$undated"/>
        </xsl:map>
    </xsl:function>

    <!-- This function analyzes time expressions, extracting components like hour, minute, and AM/PM markers. -->
    <xsl:function as="map(*)" name="dates:analyze-time">
        <xsl:param as="element(fn:group)" name="group"/>
        <xsl:variable as="xs:integer" name="outer-group-nr" select="xs:integer($group/@nr)"/>
        <xsl:variable as="element(fn:group)*" name="inner-groups" select="$group/fn:group"/>
        <!-- Determine the group offset to align the captured groups with the original regular expression groups defined in dates:patterns -->
        <xsl:variable as="xs:integer?" name="inner-group-start-nr"
            select="$inner-groups[1]/@nr ! xs:integer(.)"/>
        <xsl:variable as="xs:integer" name="group-nr-offset" select="
                if (exists($inner-group-start-nr)) then
                    $inner-group-start-nr - $outer-group-nr
                else
                    0"/>
        <xsl:choose>
            <xsl:when test="$group-nr-offset = 1">
                <xsl:variable as="xs:integer" name="hour" select="xs:integer($inner-groups[1])"/>
                <xsl:variable as="xs:integer" name="minute" select="xs:integer($inner-groups[2])"/>
                <xsl:variable as="xs:string" name="am-pm" select="$inner-groups[3]"/>
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="$hour"/>
                    <xsl:map-entry key="'minute'" select="$minute"/>
                    <!-- capture a.m. or p.m. as a number of hours that can be used to offset the supplied hour -->
                    <xsl:map-entry key="'am-pm-offset'" select="
                            if ($am-pm eq 'a.m.') then
                                if ($hour eq 12) then
                                    -12
                                else
                                    0
                            else
                                if ($hour eq 12) then
                                    0
                                else
                                    12"/>
                </xsl:map>
            </xsl:when>
            <xsl:when test="$group-nr-offset = 4">
                <xsl:variable as="xs:integer" name="hour" select="xs:integer($inner-groups[1])"/>
                <xsl:variable as="xs:integer" name="minute" select="xs:integer($inner-groups[2])"/>
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="$hour"/>
                    <xsl:map-entry key="'minute'" select="$minute"/>
                    <xsl:map-entry key="'am-pm-offset'" select="()"/>
                </xsl:map>
            </xsl:when>
            <xsl:when test="$group-nr-offset = 6">
                <xsl:variable as="xs:integer" name="hour" select="xs:integer($inner-groups[1])"/>
                <xsl:variable as="xs:string" name="am-pm" select="$inner-groups[2]"/>
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="$hour"/>
                    <xsl:map-entry key="'minute'" select="()"/>
                    <!-- capture a.m. or p.m. as a number of hours that can be used to offset the supplied hour -->
                    <xsl:map-entry key="'am-pm-offset'" select="
                            if ($am-pm eq 'a.m.') then
                                if ($hour eq 12) then
                                    -12
                                else
                                    0
                            else
                                if ($hour eq 12) then
                                    0
                                else
                                    12"/>
                </xsl:map>
            </xsl:when>
            <xsl:when test="$group-nr-offset = 8">
                <xsl:variable as="xs:integer" name="hour" select="xs:integer($inner-groups[1])"/>
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="$hour"/>
                    <xsl:map-entry key="'minute'" select="()"/>
                    <xsl:map-entry key="'am-pm-offset'" select="()"/>
                </xsl:map>
            </xsl:when>
            <xsl:when test="$group-nr-offset = 9">
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="12"/>
                    <xsl:map-entry key="'minute'" select="()"/>
                    <xsl:map-entry key="'am-pm-offset'" select="()"/>
                </xsl:map>
            </xsl:when>
            <!-- TODO find examples of midnight at start/end of date range and if assumption is 00:00 on day mentioned or the following day -->
            <xsl:when test="$group-nr-offset = 10">
                <xsl:map>
                    <xsl:map-entry key="'hour'" select="0"/>
                    <xsl:map-entry key="'minute'" select="()"/>
                    <xsl:map-entry key="'am-pm-offset'" select="()"/>
                </xsl:map>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">Invalid time format</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- This function formats time analysis results into xs:time representation (e.g., "12:30:00"). -->
    <xsl:function as="map(*)" name="dates:process-time">
        <xsl:param as="element(fn:group)" name="input"/>
        <xsl:param as="map(*)" name="time-analysis"/>
        <xsl:map>
            <xsl:map-entry key="'type'" select="'time'"/>
            <xsl:map-entry key="'input'" select="$input"/>
            <xsl:map-entry key="'output'" select="
                    format-integer(if (exists($time-analysis?am-pm-offset)) then
                        $time-analysis?hour + $time-analysis?am-pm-offset
                    else
                        $time-analysis?hour, '00') || ':' || format-integer(if (exists($time-analysis?minute)) then
                        $time-analysis?minute
                    else
                        0, '00') || ':00'"/>
        </xsl:map>
    </xsl:function>

    <!-- This function formats year and month components into "YYYY-MM" format. -->
    <xsl:function as="xs:string" name="dates:format-ym">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:value-of select="$components[2]?output || '-' || $components[1]?output"/>
    </xsl:function>

    <!-- This function formats year, month, and day components into xs:date format. -->
    <xsl:function as="xs:string" name="dates:format-ymd">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:value-of
            select="$components[3]?output || '-' || $components[1]?output || '-' || $components[2]?output"
        />
    </xsl:function>

    <!-- This function formats date-time components including a Zulu time into xs:dateTime format. -->
    <xsl:function as="xs:string" name="dates:format-ymdz">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:value-of
            select="$components[3]?output || '-' || $components[1]?output || '-' || $components[2]?output || 'T' || $components[4]?output"
        />
    </xsl:function>

    <!-- This function formats date-time components without an explicit timezone into xs:dateTime format. -->
    <xsl:function as="xs:string" name="dates:format-ymdt">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:value-of
            select="$components[3]?output || '-' || $components[1]?output || '-' || $components[2]?output || 'T' || $components[4]?output"
        />
    </xsl:function>

    <!-- This function formats date-time components with a time range into a pair of start and end xs:dateTime values. -->
    <xsl:function as="xs:string+" name="dates:format-ymdt1t2">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:sequence
            select="($components[3]?output || '-' || $components[1]?output || '-' || $components[2]?output || 'T' || $components[4]?output, $components[3]?output || '-' || $components[1]?output || '-' || $components[2]?output || 'T' || $components[5]?output)"
        />
    </xsl:function>

    <!-- This function formats date components with a range into a pair of start and end xs:date values. -->
    <xsl:function as="xs:string+" name="dates:format-ymd1-ymd2">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:sequence
            select="($components[4]?output || '-' || $components[1]?output || '-' || $components[2]?output, $components[4]?output || '-' || $components[1]?output || '-' || $components[3]?output)"
        />
    </xsl:function>

    <!-- This function formats date-time components into a pair of start and end xs:dateTime values. -->
    <xsl:function as="xs:string+" name="dates:format-ymd1t1d2t2">
        <xsl:param as="map(*)*" name="components"/>
        <xsl:sequence
            select="($components[4]?output || '-' || $components[1]?output || '-' || $components[2]?output || 'T' || $components[5]?output, $components[4]?output || '-' || $components[1]?output || '-' || $components[3]?output || 'T' || $components[6]?output)"
        />
    </xsl:function>

    <!-- This function processes an 'undated' date into a pair of empty strings (bound for notBefore and notAfter). -->
    <xsl:function as="xs:string+" name="dates:format-undated">
        <xsl:param as="map(*)" name="components"/>
        <xsl:sequence select="('', '')"/>
    </xsl:function>

    <!-- This function creates a single "when" attribute with a formatted date value. -->
    <xsl:function as="attribute()" name="dates:when">
        <xsl:param as="xs:string" name="date"/>
        <xsl:attribute name="when" select="$date"/>
    </xsl:function>

    <!-- This function creates "from" and "to" attributes for date ranges. -->
    <xsl:function as="attribute()*" name="dates:from-to">
        <xsl:param as="xs:string+" name="dates"/>
        <xsl:attribute name="from" select="$dates[1]"/>
        <xsl:attribute name="to" select="$dates[2]"/>
    </xsl:function>

    <!-- This function creates "notBefore" and "notAfter" attributes for approximate date ranges. -->
    <xsl:function as="attribute()*" name="dates:not-before-not-after">
        <xsl:param as="xs:string+" name="dates"/>
        <xsl:attribute name="notBefore" select="$dates[1]"/>
        <xsl:attribute name="notAfter" select="$dates[2]"/>
    </xsl:function>

    <!-- This function drops any received date info to prevent any comparisons in dates:analyze-string with actual dates. -->
    <xsl:function as="empty-sequence()" name="dates:nullify">
        <xsl:param as="xs:string+" name="dates"/>
    </xsl:function>

</schema>

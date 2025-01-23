<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs math" version="3.0"
    xmlns:dates="http://history.state.gov/ns/xslt/dates"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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

</xsl:stylesheet>

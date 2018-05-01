<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:functx="http://www.functx.com"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:historyatstate="https://history.state.gov/historyatstate">
    <title>FRUS TEI Rules - Date Rules</title>

    <p>This schematron file contains date-related rules from and augmenting frus.sch. This current
        version is geared towards secondary-review of legacy volumes.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="xi" uri="http://www.w3.org/2001/XInclude"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="functx" uri="http://www.functx.com"/>
    <ns prefix="historyatstate" uri="https://history.state.gov/historyatstate"/>

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
                test="tokenize(./@calendar) = ('chinese-era', 'chinese-lunar', 'ethiopian-ge&#8217;ez', 'gregorian', 'haitian-era', 'hijri', 'iranian-persian', 'japanese-nengō', 'julian', 'korean-era', 'korean-lunar', 'masonic-anno-lucis', 'papal-era', 'roman', 'rumi', 'thai-era', 'tibetan-phugpa')"
                    >date/@calendar='<value-of select="@type"/>' is an invalid value. Only the
                following values are allowed: chinese-era, chinese-lunar, ethiopian-ge&#8217;ez,
                gregorian, haitian-era, hijri, iranian-persian, japanese-nengō, julian, korean-era,
                korean-lunar, masonic-anno-lucis, papal-era, roman, rumi, thai-era, tibetan-phugpa.
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

    <!-- Non-Gregorian Date Checks -->
    <pattern id="non-gregorian-calendars">

        <rule context="tei:date[not(@calendar)]">
            <assert role="info"
                test="not(.[matches(., 'Muḥarram|Muharram|Moharram|Ṣafar|Safar|Sefer|Rabī&#8217; al-awwal|Rebbi-al-ewel|Rabih|Rabī&#8216; ath-thānī|Rabī&#8216; al-Thānī|Rabī&#8216; al-Tānī|Rabī’ al-Ākhir|Rabi el tami|Rabee El Thani|Rabi&#8217;Tani|Rebbi-ul-Akbir|Rebi-ul-Ewel|Rabih|Jumādá al-ūlá|Ǧumādā al-Awwal|Jumada al-awwal|Jumada al-ula|Jumada al-Ula|Jumada|Jumada I|Jamadi-ol-Aval|Jumada al-Oola|Jamad-el-Ewel|Jumadil Awwal|Djémazi-ul-ewel|Youmada|Youmada I|Youmada 1st|Jamadi-es-Sani|Jumādá al-ākhirah|Ǧumādā al-Āḫir|Ǧumādā aṮ-Ṯānī|Iamadi|Jumaada al-Akhir|Jumada al-Akhira|Jumādā al-āḵir|Jumada II|Rajab|Rajah|Sha&#8217;bān|Sha&#8216;ban|Sha&#8216;bān|Sha&#8216;ban|Shaaban|Chaban|Ramaḍān|Ramadan|Ramadhan|Ramazam|Shawwāl|Shawwal|Shawal|Dhū al-Qa&#8216;dah|Dhu[:punct:]l-Qi[:punct:]dah|Dhu.?l-Qa[:punct:]dah|Ḏū l-Qa[:punct:]dah|Zulqida|Zeekadeh|Zee Radah|Zee Kadah|Dhū al-Ḥijjah|Dhu al-Hijjah|Dhu[:punct:]l-Hijjah|Zulhijja|Zi El-Hidjah|Zil-Hajj', 'i')])"
                sqf:fix="add-calendar-attribute-hijri">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a hijri calendar reference.</assert>

            <assert role="info"
                test="not(.[matches(., 'Qianlong|Qiánlóng|Gāozōng|Hónglì|Jiaqing|Rénzōng|Jiāqìng|Yóngyǎn|Daoguang|Dàoguāng|Xuānzōng|Mínníng|Xianfeng|Wénzōng|Wenzong|Yìzhǔ|Dongzhi|Mùzōng|Muzong|Zǎichún|Tongzhi|Tungchi|T&#8217;ung Chi|Guangxu|Kuanghsü|Kuang Hsü|Kuang Sü|Dézōng|Tezong|Zǎitián|Xuantong|Gongzōng|Pui', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Chinese era/reign-based calendar reference.</assert>

            <assert role="info"
                test="not(.[matches(., 'Mäskäräm|Maskaram|Ṭəqəmt|Teqemt|Ṭəqəmti|Teqemti|Ḫədar|Hedar|Taḫśaś|Tahsas|Tehsass|Yäkatit|Yakatit|Läkatit|Lakatit|Mägabit|Magabit|Miyazya|Mazia|Gənbo|Genbo|Gənbot|Genbot|Säne|Sane|Ḥamle|Hamle|Nähase|Nahase|Ṗagʷəmen|Pagwemen|Ṗagume|Pagume', 'i')])"
                sqf:fix="add-calendar-attributes">[FYI] This &lt;date&gt; has a word or phrase
                possibly indicating a Ethopian ge’ez calendar reference.</assert>

            <assert role="info"
                test="not(.[matches(., 'farvardin|Farvardin|Farvardīn|ordibehešt|Ordibehesht|Ordībehešt|xordâd|Khordad|Khordād|tir|Tir|mordâd|Mordad|A-Mordād|šahrivar|Shahrivar|Shahrīvar|mehr|Mehr|Mehrmah|âbân|Aban|Ābān|âzar|Azar|Āzar|dey|Dey|bahman|Bahman|esfand|Esfand|Espand', 'i')])"
                sqf:fix="add-calendar-attribute-iranian-persian">[FYI] This &lt;date&gt; has a word
                or phrase possibly indicating an Iranian/Persian (Solar Hijri) calendar
                reference.</assert>

            <assert role="info"
                test="not(.[matches(., 'An&#8217;ei|Kōkaku|Kokaku|Tenmei|Kansei|Kyōwa|Kyowa|Bunka|Ninkō|Ninko|Bunsei|Tenpō|Tenpo|Tenhō|Tenho|Kōka|Koka|Kōmei|Komei|Kaei|Ansei|Man&#8217;en|Bunkyū|Bunkyu|Genji|Keiō|Keio|Meiji|Taishō|Taisho|Shōwa|Showa|Heisei|Akihito', 'i')])"
                sqf:fix="add-calendar-attribute-japanese-nengo">[FYI] This &lt;date&gt; has a word
                or phrase possibly indicating a Japanese nengō calendar reference.</assert>

            <assert role="info"
                test="not(.[matches(., 'Yi Geum|Gunjin|Songheon|Taejo|Emperor Go|Yi San|Hyeongun|Hongjae|Jeongjo|Yi Gong|Gongbo|Sunjae|Sunjo|Yi Hwan|Muneung|Wonheon| Heonjong|Yi Byeon|Doseung|Daeyongjae|Cheoljong|Yi Myeong-bok|Yi Hui|Seongrim|Juyeon|Gojong|Kojong|Emperor Tae|Gaeguk|Geonyang|Gwangmu|Kwangmu|Kwang Mu|Gwangmuje|Kwangmuje|Yi Cheok|Gundang|Jeongheon|Sunjong|Emperor Hyo|Emperor Yunghui|Yunghui|Yunghuije|Yunghŭije|Lyung Heni', 'i')])"
                sqf:fix="add-calendar-attribute-korean-era">[FYI] This &lt;date&gt; has a word or
                phrase possibly indicating a Korean era calendar reference.</assert>


            <assert role="info"
                test="not(.[matches(., '((in\s+the\s+year\s+of\s+light)|(anno\s+lucis))', 'i')])"
                sqf:fix="add-calendar-attribute-masonic-anno-lucis">[FYI] This &lt;date&gt; has a
                word or phrase possibly indicating a Masonic calendar reference.</assert>

            <sqf:group id="add-calendar-attributes">

                <sqf:fix
                    use-when=".[matches(., 'Muḥarram|Muharram|Moharram|Ṣafar|Safar|Sefer|Rabī&#8217; al-awwal|Rebbi-al-ewel|Rabih|Rabī&#8216; ath-thānī|Rabī&#8216; al-Thānī|Rabī&#8216; al-Tānī|Rabī’ al-Ākhir|Rabi el tami|Rabee El Thani|Rabi&#8217;Tani|Rebbi-ul-Akbir|Rebi-ul-Ewel|Rabih|Jumādá al-ūlá|Ǧumādā al-Awwal|Jumada al-awwal|Jumada al-ula|Jumada al-Ula|Jumada|Jumada I|Jamadi-ol-Aval|Jumada al-Oola|Jamad-el-Ewel|Jumadil Awwal|Djémazi-ul-ewel|Youmada|Youmada I|Youmada 1st|Jamadi-es-Sani|Jumādá al-ākhirah|Ǧumādā al-Āḫir|Ǧumādā aṮ-Ṯānī|Iamadi|Jumaada al-Akhir|Jumada al-Akhira|Jumādā al-āḵir|Jumada II|Rajab|Rajah|Sha&#8217;bān|Sha&#8216;ban|Sha&#8216;bān|Sha&#8216;ban|Shaaban|Chaban|Ramaḍān|Ramadan|Ramadhan|Ramazam|Shawwāl|Shawwal|Shawal|Dhū al-Qa&#8216;dah|Dhu[:punct:]l-Qi[:punct:]dah|Dhu.?l-Qa[:punct:]dah|Ḏū l-Qa[:punct:]dah|Zulqida|Zeekadeh|Zee Radah|Zee Kadah|Dhū al-Ḥijjah|Dhu al-Hijjah|Dhu[:punct:]l-Hijjah|Zulhijja|Zi El-Hidjah|Zil-Hajj', 'i')]"
                    id="add-calendar-attribute-hijri">
                    <sqf:description>
                        <sqf:title>Add @calendar="hijri"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">hijri</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'Qianlong|Qiánlóng|Gāozōng|Hónglì|Jiaqing|Rénzōng|Jiāqìng|Yóngyǎn|Daoguang|Dàoguāng|Xuānzōng|Mínníng|Xianfeng|Wénzōng|Wenzong|Yìzhǔ|Dongzhi|Mùzōng|Muzong|Zǎichún|Tongzhi|Tungchi|T&#8217;ung Chi|Guangxu|Kuanghsü|Kuang Hsü|Kuang Sü|Dézōng|Tezong|Zǎitián|Xuantong|Gongzōng|Pui', 'i')][matches(., 'moon')]"
                    id="add-chinese-era-chinese-lunar">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era chinese-lunar"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era
                        chinese-lunar</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'Qianlong|Qiánlóng|Gāozōng|Hónglì|Jiaqing|Rénzōng|Jiāqìng|Yóngyǎn|Daoguang|Dàoguāng|Xuānzōng|Mínníng|Xianfeng|Wénzōng|Wenzong|Yìzhǔ|Dongzhi|Mùzōng|Muzong|Zǎichún|Tongzhi|Tungchi|T&#8217;ung Chi|Guangxu|Kuanghsü|Kuang Hsü|Kuang Sü|Dézōng|Tezong|Zǎitián|Xuantong|Gongzōng|Pui', 'i')][not(matches(., 'moon'))]"
                    id="add-chinese-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="chinese-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">chinese-era</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'Mäskäräm|Maskaram|Ṭəqəmt|Teqemt|Ṭəqəmti|Teqemti|Ḫədar|Hedar|Taḫśaś|Tahsas|Tehsass|Yäkatit|Yakatit|Läkatit|Lakatit|Mägabit|Magabit|Miyazya|Mazia|Gənbo|Genbo|Gənbot|Genbot|Säne|Sane|Ḥamle|Hamle|Nähase|Nahase|Ṗagʷəmen|Pagwemen|Ṗagume|Pagume', 'i')]"
                    id="add-calendar-attribute-ethiopian">
                    <sqf:description>
                        <sqf:title>Add @calendar="ethopian-ge’ez"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">ethopian-ge’ez</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'farvardin|Farvardin|Farvardīn|ordibehešt|Ordibehesht|Ordībehešt|xordâd|Khordad|Khordād|tir|Tir|mordâd|Mordad|A-Mordād|šahrivar|Shahrivar|Shahrīvar|mehr|Mehr|Mehrmah|âbân|Aban|Ābān|âzar|Azar|Āzar|dey|Dey|bahman|Bahman|esfand|Esfand|Espand', 'i')]"
                    id="add-calendar-attribute-iranian-persian">
                    <sqf:description>
                        <sqf:title>Add @calendar="iranian-persian"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">iranian-persian</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'An&#8217;ei|Kōkaku|Kokaku|Tenmei|Kansei|Kyōwa|Kyowa|Bunka|Ninkō|Ninko|Bunsei|Tenpō|Tenpo|Tenhō|Tenho|Kōka|Koka|Kōmei|Komei|Kaei|Ansei|Man&#8217;en|Bunkyū|Bunkyu|Genji|Keiō|Keio|Meiji|Taishō|Taisho|Shōwa|Showa|Heisei|Akihito', 'i')]"
                    id="add-calendar-attribute-japanese-nengo">
                    <sqf:description>
                        <sqf:title>Add @calendar="japanese-nengō"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">japanese-nengō</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., 'Yi Geum|Gunjin|Songheon|Taejo|Emperor Go|Yi San|Hyeongun|Hongjae|Jeongjo|Yi Gong|Gongbo|Sunjae|Sunjo|Yi Hwan|Muneung|Wonheon| Heonjong|Yi Byeon|Doseung|Daeyongjae|Cheoljong|Yi Myeong-bok|Yi Hui|Seongrim|Juyeon|Gojong|Kojong|Emperor Tae|Gaeguk|Geonyang|Gwangmu|Kwangmu|Kwang Mu|Gwangmuje|Kwangmuje|Yi Cheok|Gundang|Jeongheon|Sunjong|Emperor Hyo|Emperor Yunghui|Yunghui|Yunghuije|Yunghŭije|Lyung Heni', 'i')]"
                    id="add-calendar-attribute-korean-era">
                    <sqf:description>
                        <sqf:title>Add @calendar="korean-era"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">korean-era</sqf:add>
                </sqf:fix>

                <sqf:fix
                    use-when=".[matches(., '((in\s+the\s+year\s+of\s+light)|(anno\s+lucis))', 'i')]"
                    id="add-calendar-attribute-masonic-anno-lucis">
                    <sqf:description>
                        <sqf:title>Add @calendar="masonic"</sqf:title>
                    </sqf:description>
                    <sqf:add node-type="attribute" target="calendar">masonic-anno-lucis</sqf:add>
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
                test="not(.[matches(., '(the\s+)?(\d{1,2})(st|d|nd|rd|th)?\s+(of\s+)?(January|February|March|April|May|June|July|August|September|October|November|December),?\s+(\d{4})|((January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{1,2})(st|d|nd|rd|th)?,?\s+(\d{4}))', 'i')])"
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

                <!-- Fix 1: month-day-year-regex-eng -->
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


                <!-- Fix 2: day-month-year-regex-eng -->

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

                <!-- Fix 3: month-day-range-year-regex-eng -->

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

                <!-- Fix 4: date-spelled-out-regex-eng -->

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
                            if (matches($year-thousands, 'two thousand')) then
                                '2'
                            else
                                if (matches($year-thousands, 'one thousand')) then
                                    '1'
                                else
                                    if (matches($year-thousands, 'seven hundred')) then
                                        'y'
                                    else
                                        ''"/>

                    <let name="year-hundreds" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="year-hundreds-digit"
                        value="
                            if (matches($year-hundreds, 'nine hundred')) then
                                '9'
                            else
                                if (matches($year-hundreds, 'eight hundred')) then
                                    '8'
                                else
                                    if (matches($year-hundreds, 'seven hundred')) then
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
                                if (matches($date-phrase, '(eighth$|eighteenth)')) then
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

                <!-- Fix 5: day-month-year-partially-spelled-out-regex-eng -->

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
                            if (matches($year-thousands, 'two thousand')) then
                                '2'
                            else
                                if (matches($year-thousands, 'one thousand')) then
                                    '1'
                                else
                                    if (matches($year-thousands, 'seven hundred')) then
                                        'y'
                                    else
                                        ''"/>

                    <let name="year-hundreds" value="$date-match-1//fn:group[attribute::nr eq '6']"/>
                    <let name="year-hundreds-digit"
                        value="
                            if (matches($year-hundreds, 'nine hundred')) then
                                '9'
                            else
                                if (matches($year-hundreds, 'eight hundred')) then
                                    '8'
                                else
                                    if (matches($year-hundreds, 'seven hundred')) then
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

                <!-- Fix 6: month-day-year-regex-fr -->

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


                <!-- Fix 7: month-day-year-regex-sp -->

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
                test=".[not(matches(., '(Aarhus|Aberdeen|Abidjan|Abo|Abu Dhabi|Abuja|Acajutla|Acapulco|Accra|Adana|Addis Ababa|Adelaide|Aden|Adrianople|Aegean Sea Islands|Agua Prieta|Aguadilla|Aguas Calientes|Aguatulco|Aintab|Aix La Chapelle|Akyab|Alamos|Albany|Albert Town|Aleppo|Alexandretta|Alexandria|Algeciras|Algiers|Algoma|Alicante|Almaty|Almeria|Almirante|Altata|Altona|Alvouro Obregon|Amapala|Amherstburg|Amiens|Amman|Amoor River|Amoy|Ampala|Amsterdam|Ancona|Andorra|Andorra la Vella|Angers|Ankara|Antananarivo|Antilla|Antioch|Antofagasta|Antung|Antwerp|Apia|Aquin|Aracaju|Archangel|Arecibo|Arendal|Arequipa|Arica|Arnprior|Aruba|Ashgabat|Asmara|Aspinwall|Assioot|Assouan|Astana|Asuncion|Athens|Athlone|Auckland|Augsburg|Aux Cayes|Aveiro|Avlona|Ayamonte|Babelsberg|Baden-Baden|Baghdad|Bahia|Bahia Blanca|Bahia de Caraqeuz|Baida|Baku|Ballina|Ballymena|Bamako|Bamberg|Bandar Seri Begawan|Banes|Bangalore|Bangkok|Bangui|Banja Luca|Banjul|Baracoa|Barcelona|Bari|Barmen|Barnsley|Barranquilla|Barrie|Basel|Basrah|Bassein|Basseterre|Bassorah|Batavian Republic|Batopilas|Batum|Bay of Islands|Bayonne|Beaumaris|Beijing|Beirut|Belem|Belfast|Belgrade|Belize City|Belleville|Bello Horizonte|Belmopan|Benghazi|Beni Saf|Benisouef|Bergen|Berlin|Bern|Biarritz|Bien Hoa|Bilboa|Birmingham|Bishkek|Bissau|Bizerta|Black River|Bloemfontein|Bluefields|Bocas del Toro|Bogota|Boguillas|Bologna|Boma|Bonacca|Bone-Bona|Bonn|Boodroom|Bordeaux|Boulogne|Bradford|Brake|Brantford|Brasilia|Bratislava|Brazoria|Brazzaville|Bremen|Bremerhaven|Breslau|Brest|Bridgetown|Brindisi|Brisbane|Bristol|Brockville|Brousa|Brunn|Brussels|Bucharest|Budapest|Buenaventura|Buenos Aires|Bujumbura|Bukavu|Burslem|Burtscheid|Busan|Cadiz|Cagliari|Caibarien|Caimanera|Cairo|Calais|Caldera|Calgary|Cali|Callao|Camaguey|Camargo|Camp David|Campbellton|Campeachy|Can Tho|Cananea|Canberra|Candia|Cannes|Canton|Cape Gracias a Dios|Cape Haitien|Cape Palmas|Cape Town|Capri|Caracas|Cardenas|Cardiff|Carini|Caripito|Carleton|Carlisle|Carlsruhe|Carrara|Carril|Cartagena|Carthagena|Carupano|Casablanca|Cassel|Castellamare|Castries|Catania|Caudry|Cayenne|Ceara|Cebu|Cephalonia Island|Cerro de Pasco|Cette|Ceuta|Champerico|Chanaral|Changchun|Changsha|Charleroi|Chatham|Chaux-de-fonds|Chefoo|Chengdu|Chennai|Cherbourg|Chiang Mai|Chiclayo|Chicoutimi|Chihuahua|Chimbote|Chinanfu|Chinkiang|Chisinau|Chittagong|Christchurch|Christiansand|Chungking|Chunking|Chuquicamata|Cienfuegos|Ciudad Bolivar|Ciudad Del Carmen|Ciudad Juarez|Ciudad Obregon|Ciudad Porfirio Diaz|Ciudad Trujillo|Civita Vecchia|Clarenceville|Clifton|Clinton|Cluj-Napoca|Coatzacoalcos|Cobh|Coblentz|Coburg|Cochabamba|Cochin|Coconada|Cognac|Collingwood|Collo|Cologne|Colombo|Colon|Colonia|Comayagua|Conakry|Concepcion|Concepcion Del Oro|Constantine|Copalquin|Copenhagen|Coquimbo|Corcubion|Cordoba|Corfu|Corinto|Cork|Corn Island|Cornwall|Cornwallis|Coro|Coronel|Corunna|Coteau|Cotonou|Courtwright|Crefeld|Cronstadt|Cruz Grande|Cumana|Curacao|Curitiba|Curityba|Cuxhaven|Daiguiri|Dairen|Dakar|Damascus|Damietta|Danang|Danzig|Dar es Salaam|Dardanelles|Dartmouth|Denia|Derby|Deseronto|Desterro|Dhahran|Dhaka|Dieppe|Dijon|Dili|Djibouti|Doha|Douala|Dover|Dresden|Duart|Dubai|Dublin|Dundee|Dunedin|Dunfermline|Dunkirk|Dunmore Town|Durango|Durban|Dushanbe|Dyreford|Düsseldorf|East London|Edinburgh|Edmonton|Eibenstock|El Jadida|Elizabethville|Elsinore|Emden|Emerson|Ensenada|Enugu|Erbil|Erfurt|Erie|Erzerum|Esbjerg|Esmeraldas|Essaouira|Essen|Eten|Fajardo|Falmouth|Farnham|Faro|Fayal|Ferrol|Fiume|Florence|Flores|Florianopolis|Flushing|Foochow|Fort Erie|Fort William and Port Authur|Fortaleza|Foynes|Frankfurt|Fredericia|Fredericton|Freetown|Frelighsburg|Frieburg|Frontera|Fukuoka|Funchal|Furth|Gaborone|Galashiels|Galliod|Gallipoli|Galt|Galveston|Galway|Gananoque|Garita Gonzales|Garrucha|Gaspe|Gdansk|Geestemunde|Gefle|Geneva|Genoa|Georgetown|Gera|Ghent|Gibara|Gibraltar|Gijon|Gioja|Girgeh|Girgenti|Glasgow|Glauchau|Gloucester|Goderich|Godthaab|Golfito|Gonaives|Gore Bay|Gothenburg|Governor’s Harbor|Graciosa|Granada|Grand Bassa|Grao|Green Turtle Cay|Greenock|Grenoble|Grenville|Guadalajara|Guadalupe Y Calvo|Guanajuato|Guangzhou|Guantanamo|Guatemala|Ciudad de Guatemala|Guatemala City|Guayama|Guayaquil|Guaymas|Guazacualco|Guben|Guelph|Guernsey|Guerrero|Haida|Haifa|Hakodate|Halifax|Halsingborg|Hamburg|Hamilton|Hammerfest|Hangchow|Hankow|Hanoi|Hanover|Harare|Harbin|Harburg|Harput|Hartlepool|Habana|Havana|Havre|Havre De Grace|Helder|Helsingborg|Helsinki|Hemmingford|Herat|Hermosillo|Hesse Cassel|Hesse Darmstadt|Hilo|Hinchenbrooke|Ho Chi Minh City|Holy See|Holyhead|Homs|Honda|Honfleur|Hong Kong|Honiara|Honolulu|Hoochelaga and Longeuil|Horgen|Horta|Huangpu|Huddersfield|Hue|Huelva|Hull|Huntington|Hyde Park|Hyderabad|Ibadan|Ichang|Ile De Re|Ilo|Innsbruck|Iquique|Iquitos|Isfahan|Iskenderun|Islamabad|Isle of Wight|Ismaila|Istanbul|Ivica|Izmir|Jacmel|Jaffa|Jaffna|Jakarta|Jalapa|Jeddah|Jeremie|Jeres de la Frontera|Jerusalem|Johannesburg|Juba|Kabul|Kaduna|Kahului|Kalamata|Kalgan|Kampala|Kanagawa|Karachi|Kathmandu|Kehl|Keneh|Kenora|Khartoum|Khorramshahr|Kidderminster|Kiev|Kigali|Kingston|Kingston upon Hull|Kingstown|Kinshasa|Kirkaldy|Kirkuk|Kisangani|Kishinev|Kiu Kiang|Kobe|Kolding|Kolkata|Kolonia|Konigsberg|Koror|Kovno|Krakow|Kuala Lumpur|Kuching|Kunming|Kuwait City|Kweilin|Kyiv|La Ceiba|La Guaira|La Oroya|La Paz|La Rochelle|La Romana|Lachine|Lacolle|Lagos|Laguna De Terminos|Lahore|Lambayeque|Langen Schwalbach|Laraiche and Asilah|Latakia|Lausanne|Lauthala|Leeds|Leghorn|Leicester|Leige|Leipzig|Leith|Leningrad|Leone|Lethbridge|Levis|Levuka|Libau|Libreville|Lille|Lilongwe|Lima|Limassol|Limerick|Limoges|Lindsay|Lisbon|Liverpool|Livingston|Ljubljana|Llanelly|Lobos|Lodz|Lome|Londenderry|London|Londonderry|Los Mochis|Luanda|Lubeck|Lucerne|Lugano|Luneburg|Lurgan|Lusaka|Luxembourg|Luxor|Lyon|Macau|Maceio|Madras|Madrid|Magallanes|Magdalen Islands|Magdalena|Magdeburg|Mahukona|Mainz|Majuro|Malabo|Malaga|Maldives|Male|Malmo|Malta|Managua|Manama|Manaos|Manaus|Manchester|Mandalay|Manila|Mannheim|Mansurah|Manta|Manzanillo|Maputo|Maracaibo|Maranhao|Marash|Markneukirchen|Marseille|Maseru|Matagalpa|Matagorda|Matamoros|Matanzas|Matthew Town|Mayaguez|Mazar-e-Sharif|Mazatlan|Mbabana|Mbabane|Medan|Medellin|Melbourne|Melekeok|Melilla|Mendoza|Mentone|Merida|Mersine|Meshed|Messina|Mexicali|México|Mexico City|Mexico, D. F.|México, D. F.|Midland|Mier|Milan|Milazzo|Milford Haven|Milk River|Minatitlan|Minich|Minsk|Miragoane|Mogadishu|Mollendo|Mombasa|Monaco|Monganui|Monrovia|Montego Bay|Monterrey|Montevideo|Montreal|Morelia|Morlaix|Moroni|Morpeth|Morrisburgh|Moscow|Mostar|Moulmein|Mukden|Mulhausen|Mumbai|Munich|Murree|Muscat|Nacaome|Nagasaki|Nagoya|Naguabo|Naha, Okinawa|Nairobi|Nancy|Nanking|Nantes|Napanee|Naples|Nassau|Natal|Neustadt|New Delhi|New York|Newcastle|Newchwang|Newport|Newry|Nha Trang|Niagara Falls|Niamey|Nice|Nicosia|Niewediep|Ningpo|Nogales|Norrkoping|North Bay|Nottingham|Nouakchott|Nuevitas|Nuevo Laredo|Nukualofa|Nuku’alofa|Nuremberg|Nuuk|N’Djamena|N’Djamena|Oaxaca|Ocean Falls|Ocos|Odense|Odessa|Old Harbor|Omoa|Omsk|Oporto|Oran|Orillia|Oruro|Osaka|Oshawa|Oslo|Otranto|Ottawa|Ouagadougou|Owen Sound|Pago Pago|Paita|Palamos|Palermo|Palikir|Palma de Mallorca|Panamá|Panama|Panama City|Pará|Paraiba|Paramaribo|Paris|Parral|Parry Sound|Paso Del Norte|Paspebiac|Patras|Pau|Paysandu|Peiping|Peking|Penang|Penedo|Perigueux|Pernambuco|Perth|Peshawar|Pesth|Peterborough|Petit Goave|Petrograd|Phnom Penh|Picton|Piedras Negras|Piraeus|Piura|Plauen|Plymouth|Podgorica|Point De Galle|Point Levi|Ponce|Ponta Delgada, Azores|Porsgrund|Port Antonio|Port Arthur|Port Elizabeth|Port Hope|Port Limon|Port Louis|Port Maria|Port Morant|Port Moresby|Port Rowan|Port Said|Port St. Mary’s|Port Stanley|Port Vila|Port au Prince|Port de Paix|Port of Marbella|Port of Spain|Port-au-Prince|Porto Alegre|Porto Novo|Portsmouth|Potosi|Potsdam|Poznan|Pozzuoli|Prague|Praha|Praia|Prescott|Pretoria|Prince Rupert|Pristina|Progreso|Puebla|Puerto Armuelles|Puerto Barrios|Puerto Bello|Puerto Cabello|Puerto Cabezas|Puerto La Cruz|Puerto Libertador|Puerto Mexico|Puerto Perez|Puerto Plata|Puerto Principe|Puerto Vallarta|Punta Arenas|Puntarenas|Pyongyang|Quebec|Quepos|Quezaltenango|Quito|Rabat|Rangoon|Ravenna|Rawalpindi|Recife|Redditch|Reggio|Regina|Reichenberg|Rennes|Reval|Reykjavik|Reynosa|Rheims|Rhenish|Ribe|Riga|Rio Bueno|Rio Grande Do Sul|Rio Hacha|Rio de Janeiro|Ritzebuttel|Riviere Du Loup|Riyadh|Rochefort|Rodi Garganico|Rome|Rosario|Roseau|Rostoff|Rotterdam|Roubaix|Rouen|Ruatan|Rustchuk|Sabanilla|Sabine|Safi|Sagua La Granda|Saigon|Saint George’s|Saint John’s|Salango|Salaverry|Salerno|Salina Cruz|Salonika|Saltillo|Salvador|Salzburg|Samana|San Andres|San Antonio|San Benito|San Cristobal|San Felin de Guxols|San Francisco|San Jose|San José|San Juan|San Juan de los Remedios|San Juan del Norte|San Juan del Sur|San Lucar de Barrameda|San Luis Potosi|San Marino|San Pedro Sula|San Pedro de Macoris|San Remo|San Salvador|San Sebastian|Sanaa|Sana’a|Sancti Spiritus|Santa Clara|Santa Cruz|Santa Cruz Point|Santa Fe|Santa Marta|Santa Rosalia|Santander|Santiago|Santiago de Los Caballeros|Santo Domingo|Santos|Sao Tome|Sapporo|Sarajevo|Sarnia|Sault Ste. Marie|Savannah La Mar|Schiedam|Sedan|Seoul|Setubal|Seville|Seychelles|Shanghai|Sheffield|Shenyang|Sherbrooke|Shimonoseki|Shiraz|Sidon|Sierra Mojada|Simoda|Simonstown|Singapore|Sivas|Skopje|Sligo|Smith’s Falls|Sofia|Sohag|Solingen|Songkhla|Sonneberg|Sorau|Sorrento|Southampton|Spezzia|St. Andero|St. Ann’s Bay|St. Catherines|St. Etienne|St. Eustatius|St. Gall|St. George|St. George’s|St. Helen’s|St. John|St. Johns|St. Leonards|St. Malo|St. Marc|St. Michael’s|St. Nazaire|St. Petersburg|St. Salvador|St. Stephen|Stanbridge|Stanleyville|Stanstead Junction|Stavanger|Stettin|Stockholm|Stoke on Trent|Strasbourg|Stratford|Stuttgart|Sudbury|Suez|Sunderland|Sundsvall|Surabaya|Sutton|Suva|Swatow|Swinemunde|Sydney|Syra|São Paulo|Tabasco|Tabriz|Tacna|Taganrog|Taipei|Taiz|Talcahuano|Tallinn|Tamatave|Tampico|Tangier|Tapachula|Taranto|Tarawa Atoll|Tarragona|Tarsus|Tashkent|Tbilisi|Tegucigalpa|Teheran|Tehran|Tehuantepect|Tel Aviv|Tela|Tereira|Tetouan|The Hague|Thessaloniki|Thimphu|Tientsin|Tiflis|Tihwa|Tijuana|Tirana|Tirane|Tlacotalpam|Tocopilla|Tokyo|Topia|Topolobampo|Toronto|Torreon|Torrevieja|Toulon|Toulouse|Tovar|Trapani|Trebizond|Trenton|Trieste|Trinidad|Tripoli|Tromso|Trondhjem|Troon|Troyes|Trujillo|Tsinan|Tsingtao|Tumbes|Tunis|Tunstall|Turin|Tutuila|Tuxpam|Udorn|Ulaanbaatar|Utilla|Vaduz|Vaiaku village|Valdivia|Valencia|Valera|Valletta|Valparaiso|Vancouver|Vardo|Vatican City|Velasco|Venice|Vera Cruz|Verona|Versailles|Verviers|Vevey|Vianna|Viborg|Vichy|Victoria|Vienna|Vientiane|Vigo|Vilnius|Vivero|Vlaardingen|Vladivostok|Volo|Warsaw|Washington|Washington, D.C.|Waterford|Waterloo|Waubaushene|Weimar|Wellington|Weymouth|Whitby|White Horse|Wiarton|Windhoek|Windsor|Wingham|Winnipeg|Winterthur|Wolverhampton|Worcester|Wuhan|Yalta|Yamoussoukro|Yangon|Yaounde|Yekaterinburg|Yenan|Yerevan|Yokkaichi|Yokohama|Yuscaran|Zacatecas|Zagreb|Zante|Zanzibar|Zaza|Zittau|Zomba|Zurich)'))]"
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
                        </dateline><lb xmlns="http://www.tei-c.org/ns/1.0"/>
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
                        <lb xmlns="http://www.tei-c.org/ns/1.0"/><dateline
                            xmlns="http://www.tei-c.org/ns/1.0" rendition="#left">
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
                        </dateline><lb xmlns="http://www.tei-c.org/ns/1.0"/>
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

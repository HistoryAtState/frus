<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:functx="http://www.functx.com">
    <title>FRUS TEI Rules</title>

    <p>FRUS TEI Rules Schematron file ($Id: frus.sch 4528 2016-02-22 21:33:23Z joewiz $)</p>

    <p>This schematron adds FRUS TEI-specific rules to the more generic tei-all.rng RelaxNG Schema
        file. FRUS TEI files that validate against *both* schema files are considered valid FRUS TEI
        files.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="ckbk" uri="http://www.oreilly.com/XSLTCookbook"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

    <!-- Define variables used by other patterns -->
    <let name="xml-ids" value="//*/@xml:id"/>
    <let name="vol-ids"
        value="
            if (doc-available('https://history.state.gov/services/volume-ids')) then
                doc('https://history.state.gov/services/volume-ids')//volume-id
            else
                doc('volume-ids-snapshot.xml')//volume-id"/>
    <let name="category-ids" value="//tei:category/@xml:id"/>
    <let name="persName-ids" value="//tei:persName/@xml:id"/>
    <let name="term-ids" value="//tei:term/@xml:id"/>
    <let name="rendition-ids" value="//tei:rendition/@xml:id"/>
    <let name="documents" value="//tei:div[@type = 'document']"/>
    <let name="vol-id" value="/tei:TEI/@xml:id"/>
    <let name="available-images"
        value="doc(concat('https://history.state.gov/services/volume-images?volume=', $vol-id))//image"/>

    <pattern id="filename-id-check">
        <rule context="/tei:TEI">
            <assert test="@xml:id">Volume's root element is missing an @xml:id; it should correspond
                to the volume ID.</assert>
        </rule>
        <rule context="/tei:TEI/@xml:id">
            <let name="basename" value="replace(base-uri(.), '^.*/(.*?)$', '$1')"/>
            <assert test="$basename = concat(., '.xml')">volume id <value-of select="."/> does not
                match filename <value-of select="$basename"/></assert>
            <assert test=". = $vol-ids">Invalid TEI/@xml:id: <value-of select="."/>. No known volume
                ID corresponds to this volume's @xml:id.</assert>
        </rule>
    </pattern>

    <pattern id="processing-instruction-check">
        <rule context="/processing-instruction()">
            <assert test="not(.)">Please remove root level processing instructions before
                delivery.</assert>
        </rule>
    </pattern>

    <pattern id="tei-header-checks">
        <title>TEI Header Checks</title>
        <rule context="tei:fileDesc">
            <assert test="count(tei:titleStmt) eq 1">fileDesc needs exactly one titleStmt</assert>
            <assert test="count(tei:publicationStmt) eq 1">fileDesc needs exactly one
                publicationStmt</assert>
            <assert test="count(tei:sourceDesc) eq 1">fileDesc needs exactly one sourceDesc</assert>
            <assert test="count(child::element()) eq 3">fileDesc can only have three child elements:
                titleStmt, publicationStmt, and sourceDesc</assert>
        </rule>
        <rule context="tei:title[parent::tei:titleStmt]">
            <assert test="./@type = ('complete', 'series', 'sub-series', 'volume-number', 'volume')"
                    >title/@type='<value-of select="@type"/>' is an invalid value. Only the
                following values are allowed: complete, series, sub-series, volume-number,
                volume</assert>
            <assert test="not(./element())">titleStmt/title cannot contain child elements, only a
                single text node</assert>
        </rule>
        <rule context="tei:titleStmt">
            <assert test="count(tei:title[@type = 'complete']) = 1">titleStmt needs exactly one
                title of @type 'complete'</assert>
            <assert test="count(tei:title[@type = 'series']) = 1">titleStmt needs exactly one title
                of @type 'series'</assert>
            <assert test="count(tei:title[@type = 'sub-series']) = 1">titleStmt needs exactly one
                title of @type 'sub-series'</assert>
            <assert test="count(tei:title[@type = 'volume-number']) = 1">titleStmt needs exactly one
                title of @type 'volume-number'</assert>
            <assert test="count(tei:title[@type = 'volume']) = 1">titleStmt needs exactly one title
                of @type 'volume'</assert>
            <assert test="count(distinct-values(tei:title/@type)) = count(tei:title)">There can only
                be one of each @type of title</assert>
        </rule>
        <rule context="tei:publicationStmt">
            <assert test="count(tei:publisher) = 1">publicationStmt needs exactly one
                publisher</assert>
            <assert test="count(tei:pubPlace) = 1">publicationStmt needs exactly one
                pubPlace</assert>
            <assert test="count(tei:date) = 1">publicationStmt needs exactly one date</assert>
            <assert test="tei:idno/@type = ('dospubno', 'frus', 'isbn-13', 'isbn-10')"
                    >idno/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: dospubno, frus, isbn-13, isbn-10</assert>
            <assert
                test="count(tei:idno[@type = 'frus']) = 1 and tei:idno[@type = 'frus'] = $vol-ids"
                >publicationStmt needs exactly one idno of type 'frus', and it must be a defined
                volume ID</assert>
        </rule>
    </pattern>

    <pattern id="list-checks">
        <title>List Checks</title>
        <rule context="tei:list">
            <assert
                test="./@type = ('participants', 'subject', 'index', 'terms', 'names', 'toc', 'references', 'from', 'to', 'simple', 'sources', 'from') or not(./@type)"
                    >list/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: participants, subject, index, terms, names, toc, references, from, to,
                simple, sources</assert>
        </rule>
        <rule context="tei:item[ancestor::tei:div/@xml:id = 'terms' and not(child::tei:list)]">
            <assert test=".//tei:term/@xml:id" sqf:fix="add-term add-xml-id">Missing term element
                with @xml:id attribute. Entries in the list of terms &amp; abbreviations must have
                an @xml:id attribute</assert>
            <let name="first-hi" value="(.//tei:hi)[1]"/>
            <let name="term"
                value="
                    if (ends-with($first-hi, ',')) then
                        replace($first-hi, ',$', '')
                    else
                        $first-hi"/>
            <let name="id" value="concat('t_', replace($term, '\W', ''), '_1')"/>
            <!-- the fix takes two passes. hopefully we'll find a way to do this in a single pass 
                 see https://www.oxygenxml.com/forum/topic14270.html. -->
            <sqf:fix id="add-term" use-when="not(.//tei:term)">
                <sqf:description>
                    <sqf:title>Add a missing term element</sqf:title>
                </sqf:description>
                <sqf:replace match="(.//tei:hi)[1]">
                    <xsl:element name="tei:hi">
                        <xsl:attribute name="rend" select="./@rend"/>
                        <xsl:element name="tei:term">
                            <xsl:value-of select="$term"/>
                        </xsl:element>
                        <xsl:text>,</xsl:text>
                    </xsl:element>
                </sqf:replace>
            </sqf:fix>
            <sqf:fix id="add-xml-id" use-when="exists(.//tei:term)">
                <sqf:description>
                    <sqf:title>Add a missing @xml:id</sqf:title>
                </sqf:description>
                <sqf:add match=".//tei:term" target="xml:id" node-type="attribute" select="$id"/>
            </sqf:fix>
            <assert test="not(tei:term/tei:hi/@rend = 'strong') and not(ends-with(tei:term, ','))"
                >Improper nesting of hi and term elements (the hi/@rend=strong tag must surround the
                term element), and/or improper placement of trailing punctuation mark (the trailing
                comma must lie outside the term element)</assert>
        </rule>
        <rule context="tei:item[parent::tei:list/@type = 'persons']">
            <assert test=".//tei:persName/@xml:id">Missing term element with @xml:id attribute.
                Entries in the list of terms &amp; abbreviations must have an @xml:id
                attribute</assert>
            <assert test="tei:persName/tei:hi/@rend = 'strong' or ends-with(tei:persName, ',')"
                >Improper nesting of hi and persName (the hi/@rend=strong tag must surround the
                persName element), and/or improper placement of trailing punctuation mark (the
                trailing comma must lie outside the persName element)</assert>
        </rule>
    </pattern>

    <pattern id="att-rend-checks">
        <title>Rend Attribute Value Checks</title>
        <rule context="tei:hi">
            <assert
                test="./@rend = ('strong', 'italic', 'smallcaps', 'roman', 'underline', 'sub', 'superscript')"
                    >hi/@rend='<value-of select="@rend"/>' is an invalid value. Only the following
                values are allowed: strong, italic, smallcaps, roman, underline, sub,
                superscript</assert>
        </rule>
        <rule context="tei:p">
            <!-- note that the 4th entry here lets quite a few known "invalid" values pass this test; we will perform this pass of checks at a later stage. TODO. -->
            <assert
                test="./@rend = ('strong', 'italic') or ./@rend = ('sectiontitleital') or ./@rend = ('center', 'right', 'flushleft') or ./@rend = ('sourceparagraphspaceafter', 'sourceparagraphfullindent', 'sourceparagraphtightspacing', 'sourceheadcenterboldbig', 'sourcearchiveboldbig') or not(./@rend)"
                    >p/@rend='<value-of select="@rend"/>' is an invalid value. Only the following
                values are allowed: strong, italic, sectiontitleital, center, right,
                flushleft</assert>
        </rule>
        <rule context="tei:del">
            <assert test="./@rend = 'strikethrough'">del/@rend='<value-of select="@rend"/>' is an
                invalid value. Only the following value is allowed: strikethrough</assert>
        </rule>
    </pattern>

    <pattern id="att-rendition-checks">
        <title>Rendition Attribute Value Checks</title>
        <rule context="@rendition">
            <assert
                test="
                    every $rendition-ref in (tokenize(., '\s+') ! substring-after(., '#'))
                        satisfies $rendition-ref = $rendition-ids"
                >The rendition ID '<value-of select="."/>' is not defined in the teiHeader's list of
                renditions: <value-of select="string-join($rendition-ids, ', ')"/></assert>
        </rule>
    </pattern>

    <pattern id="div-checks">
        <title>Div Type Attribute Value Checks</title>
        <rule context="tei:div">
            <assert
                test="./@type = ('document', 'chapter', 'subchapter', 'document-group', 'compilation', 'section', 'toc')"
                    >div/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: document, chapter, subchapter, compilation, section,
                toc</assert>
        </rule>
        <rule context="tei:div">
            <assert
                test="./@subtype = ('editorial-note', 'errata_document-numbering-error', 'historical-document', 'index')"
                    >div/@subtype='<value-of select="@subtype"/>' is an invalid value. Only the
                following values are allowed: editorial-note, errata_document-numbering-error,
                historical-document, index</assert>
        </rule>
    </pattern>

    <pattern id="div-child-checks">
        <title>Compilation/Chapter/Subchapter Div Containing Descendant Document Div Check</title>
        <rule
            context="tei:div[@type = ('compilation', 'chapter', 'subchapter')][not(@subtype = ('index', 'referral', 'editorial-note'))]">
            <assert role="warn"
                test=".//tei:div[@type = 'document'] or .//tei:div[@subtype = ('index', 'referral', 'editorial-note')]"
                >This <value-of select="@type"/> does not contain a div/@type='document'. Please
                inspect to verify encoding accuracy.</assert>
        </rule>
    </pattern>

    <pattern id="div-numbering-checks">
        <title>Document Div Numbering Checks</title>
        <rule context="tei:div[@type = 'document'][@n castable as xs:integer]">
            <assert
                test="not(./preceding::tei:div[@type = 'document']) or ./@n = (./preceding::tei:div[@n castable as xs:integer][1]/@n + 1)"
                >Document numbering mismatch. Document div/@n numbering must be
                consecutive.</assert>
        </rule>
        <rule context="tei:div[@type = 'document']">
            <assert test="not(matches(./@n, '^\[.+?\]$'))" role="warning">Document's @n is encased
                in square brackets: "[]". Only use in the rare circumstance that the volume has a
                block of unnumbered documents outside the normal stream of numbered
                documents.</assert>
            <assert test="matches(./@n, '^\[.+?\]$') or ./@n castable as xs:integer">Non-number
                component found in document number "<value-of select="@n"/>"</assert>
        </rule>
        <rule context="tei:body">
            <assert
                test="count($documents[@n castable as xs:integer]) = 0 or count($documents[@n castable as xs:integer]) = $documents[last()]/@n[. castable as xs:integer] - $documents[@n castable as xs:integer][1]/@n + 1"
                >Document numbering mismatch. The total number of documents with integer-@n values
                    (<value-of select="count($documents[@n castable as xs:integer])"/>) should equal
                the difference between the first and final documents' numbers (<value-of
                    select="$documents[@n castable as xs:integer][last()]/@n"/> - <value-of
                    select="$documents[@n castable as xs:integer][1]/@n"/> + 1 = <value-of
                    select="$documents[@n castable as xs:integer][last()]/@n[. castable as xs:integer] - $documents[@n castable as xs:integer][1]/@n + 1"
                />), or the number of documents must be 0 (indicating a volume not yet
                digitized).</assert>
        </rule>
    </pattern>

    <pattern id="frus-attachment-checks">
        <title>frus:attachment Checks</title>
        <rule context="frus:attachment">
            <assert test="not(tei:div)">A frus:attachment element must not contain a child
                tei:div</assert>
            <assert test="not(.//tei:head = '(Editorial Note|Editor’s Note)')">Treat editorial notes
                as full documents, not as attachments</assert>
            <!-- experimental frus:attachment @xml:id -->
            <!--
            <assert test="@xml:id">Missing @xml:id for frus:attachment</assert>
            <assert test="matches(@xml:id, concat('^', ./ancestor::tei:div[@xml:id][1]/@xml:id, 'at', index-of(./ancestor::tei:div[@xml:id][1]/frus:attachment, .)))">Incorrectly formed @xml:id '<value-of select="@xml:id"/>'</assert>
            -->
        </rule>
    </pattern>

    <pattern id="table-rows-cols-checks">
        <rule context="tei:table[@rows and @cols]">
            <assert test="./@rows = count(child::tei:row)">The number of rows asserted in the table
                element, <value-of select="./@rows"/>, does not equal the total number of row tags,
                    <value-of select="count(child::tei:row)"/>
            </assert>
            <!-- this test relies on the XPath 3.0 simple map operator (!) and is waiting on oXygen support. until then, the test will fail in the case of row-spanning cells. -->
            <!--<assert test="sum(./@rows * ./@cols)=count(descendant::tei:cell)">The number of cells asserted in the table element (<value-of select="./@rows"/> rows * <value-of select="./@cols"/> columns means there should be <value-of select="sum(./@rows * ./@cols)"/> cells), does not equal the total number of cells in the table, <value-of select="count(descendant::tei:cell[not(@rows)]) + descendant::tei:cell ! ./@rows"/></assert>-->
        </rule>
    </pattern>

    <pattern id="footnote-id-checks">
        <title>Footnote ID Checks</title>
        <rule context="tei:note[@xml:id and ancestor::tei:div/@type = 'document']">
            <assert test="substring-before(./@xml:id, 'fn') = ./ancestor::tei:div[1]/@xml:id"
                >Footnote ID mismatch. Document ID portion of footnote @xml:id '<value-of
                    select="./@xml:id"/>' must match its document's @xml:id '<value-of
                    select="./ancestor::tei:div[1]/@xml:id"/>'.</assert>
        </rule>
    </pattern>

    <pattern id="element-nesting-checks">
        <title>Element Nesting Checks</title>
        <rule context="tei:note[not(@rend = 'inline')]">
            <assert test="count(descendant::tei:note) = 0">A footnote cannot be nested inside
                another footnote, see note/@xml:id='<value-of select="./@xml:id"/>'.</assert>
        </rule>
        <rule context="tei:list">
            <assert test="count(./tei:p) = 0">A list element cannot contain a direct child paragraph
                element.</assert>
            <assert test="count(.//tei:table) = 0">A list element cannot contain a table
                element.</assert>
        </rule>
    </pattern>

    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule
            context="tei:ref[starts-with(@target, '#pg') and substring-after(@target, 'pg_') castable as xs:integer and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert
                test="xs:integer(substring-after(@target, '#pg_')) gt xs:integer(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))"
                >Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"
                    />–<value-of select="@target"/> (see #<value-of
                    select="./ancestor::tei:div[1]/@xml:id"/>
                <value-of
                    select="
                        if (./ancestor::tei:div[1]/@xml:id = 'index') then
                            concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',')
                        else
                            ()"
                /> and <value-of select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule
            context="tei:ref[starts-with(@target, '#pg') and not(substring-after(@target, 'pg_') castable as xs:integer) and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert
                test="xs:integer(ckbk:roman-to-number(substring-after(@target, '#pg_'))) gt xs:integer(ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_')))"
                >Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"
                    />–<value-of select="@target"/> (<value-of
                    select="ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))"
                    />–<value-of select="ckbk:roman-to-number(substring-after(@target, '#pg_'))"/>;
                see #<value-of select="./ancestor::tei:div[1]/@xml:id"/>
                <value-of
                    select="
                        if (./ancestor::tei:div[1]/@xml:id = 'index') then
                            concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',')
                        else
                            ()"
                /> and <value-of select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, 'frus')]">
            <assert
                test="
                    if (contains(@target, '#') and substring-before(@target, '#') = $vol-ids) then
                        (substring-before(@target, '#') = $vol-ids and (if (doc-available(concat('../volumes/', substring-before(@target, '#'), '.xml'))) then
                            doc(concat('../volumes/', substring-before(@target, '#'), '.xml'))//*/@xml:id = substring-after(@target, '#')
                        else
                            if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#'), '.xml'))) then
                                doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#'), '.xml'))//*/@xml:id = substring-after(@target, '#')
                            else (: allow this check to pass if you don't have our exact directory structure :)
                                true()))
                    else
                        @target = $vol-ids"
                    >ref/@target='<value-of select="@target"/>' is an invalid value. No volume's ID
                and/or target element corresponds to this ref/@target value (or, possibly, the
                volume has not yet been published).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, '#')]">
            <assert test="substring-after(@target, '#') = $xml-ids">ref/@target='<value-of
                    select="@target"/>' is an invalid value. No element's @xml:id corresponds to
                this value.</assert>
        </rule>
        <rule context="tei:ref">
            <assert
                test="starts-with(@target, '#') or starts-with(@target, 'http') or starts-with(@target, 'mailto')"
                >Invalid ref/@target='<value-of select="@target"/>'. If this is an internal
                cross-reference, it needs a "#" prefix.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, '#')]">
            <assert test="substring-after(@corresp, '#') = $persName-ids"
                    >persName/@corresp='<value-of select="@corresp"/>' is an invalid value. No
                persName has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, 'frus')]">
            <assert
                test="
                    substring-before(@corresp, '#') = $vol-ids and (if (doc-available(concat('../volumes/', substring-before(@corresp, '#'), '.xml'))) then
                        doc(concat('../volumes/', substring-before(@corresp, '#'), '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                    else
                        if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#'), '.xml'))) then
                            doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#'), '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                        else
                            false())"
                    >persName/@corresp='<value-of select="@corresp"/>' is an invalid value. No
                persName has been defined in that volume with an @xml:id corresponding to this
                value.</assert>
        </rule>
        <rule context="tei:gloss[@target]">
            <assert test="substring-after(@target, '#') = $term-ids">gloss/@target='<value-of
                    select="@target"/>' is an invalid value. No term has been defined with an
                @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:date[@ana]">
            <assert test="substring-after(@ana, '#') = $category-ids">date/@ana='<value-of
                    select="@ana"/>' is an invalid value. No category has been defined with an
                @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:date[@type]">
            <assert role="warn"
                test="tokenize(./@type) = ('content-date', 'conversation-or-meeting-date', 'creation-date', 'publication-date', 'received-date')"
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
        <rule context="@xml:id">
            <assert test="count(index-of($xml-ids, .)) eq 1">@xml:id=<value-of select="."/>. Two
                elements cannot have the same xml:id attribute.</assert>
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
            <assert role="warn" test=".//tei:date">Within historical documents, at least one
                dateline must contain a date element</assert>
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
        <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert role="warn"
                test="(@notBefore and @notAfter and @ana) or (@when and @ana) or (@from and @to and @ana)"
                >Undated documents must be tagged with @when/@ana --OR-- @from/@to/@ana --OR--
                @notBefore/@notAfter/@ana. &#10; Use @when/@ana for a single date/dateTime that can
                be inferred concretely (such as a date listed in the original document). &#10; Use
                @from/@to/@ana for a date/dateTime range that can be inferred concretely (such as a
                meeting day and time span). &#10; Use @notBefore/@notAfter/@ana for an inferred,
                fuzzy dateTime range (such as an unknown date/time between two documents or
                events).</assert>
        </rule>
        <rule
            context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)][. ne '' and not(matches(., 'undated|not\s+dated|not\s+declassified', 'i'))]">
            <assert role="warn"
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
            <assert role="warn"
                test="(@notBefore and @notAfter) or (not(@notBefore) and not(@notAfter))">Dateline
                date @notBefore must have a corresponding @notAfter.</assert>
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
            <assert role="warn" test=".//tei:dateline[not(ancestor::frus:attachment)]"
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
            context="tei:div[@subtype eq 'historical-document'][.//tei:dateline[not(ancestor::frus:attachment)]//tei:date[@from or @to or @notBefore or @notAfter or @when]]">
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

    <pattern id="ref-to-page-footnote-check">
        <title>Ref to Page Footnote Check</title>
        <rule context="tei:ref[contains(@target, '#pg_')]">
            <assert test="not(following-sibling::node()[1]/self::tei:hi = 'n')">Please italicized
                'n' inside the ref.</assert>
        </rule>
    </pattern>

    <pattern id="empty-missing-content-checks">
        <title>Empty/Missing Content Checks</title>
        <rule context="tei:p | tei:gloss | tei:persName | tei:placeName | tei:seg">
            <assert test="count(./node()) gt 0 and normalize-space(.) ne ''"><value-of
                    select="name(.)"/> elements cannot be empty.</assert>
        </rule>
        <rule context="tei:editor">
            <assert test="./parent::tei:titleStmt">An editor element is allowed only in the
                tei:titleStmt element.</assert>
            <assert role="warn" test="count(./node()) gt 0">In contemporary publications, an editor
                element should not be empty.(In the back catalogue, the editor element may be empty
                by necessity.)</assert>
            <assert test="./@role">An editor element needs a @role attribute.</assert>
            <assert test="string-length(./@role) gt 0">An editor/@role attribute cannot be
                empty.</assert>
            <assert test="@role = ('primary', 'general')">The value of editor/@role must be: primary
                or general</assert>
        </rule>
        <rule context="tei:div">
            <assert test="count(tei:head) = 1">A div must have a head child.</assert>
            <assert test="./@xml:id">A div must have an @xml:id attribute.</assert>
        </rule>
        <rule context="tei:head">
            <assert test="count(preceding-sibling::tei:head) = 0">There can only be one head
                element.</assert>
            <assert test="string-length(normalize-space(.)) gt 0">Head elements cannot be
                empty.</assert>
        </rule>
    </pattern>

    <pattern id="image-url-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic">
            <assert test="@url">Missing @url attribute</assert>
            <assert test="not(matches(@url, '\..{3,4}$'))">File extensions not allowed: <value-of
                    select="@url"/></assert>
        </rule>
    </pattern>

    <pattern id="image-s3-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic[@url][not(ancestor::tei:titlePage)]">
            <assert test="concat(@url, '.png') = $available-images">PNG version of '<value-of
                    select="@url"/>' not found on static.history.state.gov</assert>
            <assert test="concat(@url, '.tif') = $available-images">TIFF version of '<value-of
                    select="@url"/>' not found on static.history.state.gov</assert>
        </rule>
    </pattern>

    <!-- XSL Helper Functions -->

    <!-- Function to convert from Roman Numerals to Numbers. Adapted from Sal Mangano, XSLT Cookbook 2nd Ed (O'Reilly 2006), pp. 70-72 -->
    <ckbk:romans>
        <ckbk:roman value="1">i</ckbk:roman>
        <ckbk:roman value="1">I</ckbk:roman>
        <ckbk:roman value="5">v</ckbk:roman>
        <ckbk:roman value="5">V</ckbk:roman>
        <ckbk:roman value="10">x</ckbk:roman>
        <ckbk:roman value="10">X</ckbk:roman>
        <ckbk:roman value="50">l</ckbk:roman>
        <ckbk:roman value="50">L</ckbk:roman>
        <ckbk:roman value="100">c</ckbk:roman>
        <ckbk:roman value="100">C</ckbk:roman>
        <ckbk:roman value="500">d</ckbk:roman>
        <ckbk:roman value="500">D</ckbk:roman>
        <ckbk:roman value="1000">m</ckbk:roman>
        <ckbk:roman value="1000">M</ckbk:roman>
    </ckbk:romans>
    <xsl:variable name="ckbk:roman-nums" select="document('')/*/*/ckbk:roman"/>
    <xsl:function name="ckbk:roman-to-number">
        <xsl:param name="roman"/>
        <xsl:variable name="valid-roman-chars">
            <xsl:value-of select="document('')/*/ckbk:romans"/>
        </xsl:variable>
        <xsl:choose>
            <!-- returns true if there are any non-Roman characters in the string -->
            <xsl:when test="translate($roman, $valid-roman-chars, '')">NaN</xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="ckbk:roman-to-number-impl">
                    <xsl:with-param name="roman" select="$roman"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:template name="ckbk:roman-to-number-impl">
        <xsl:param name="roman"/>
        <xsl:param name="value" select="0"/>
        <xsl:variable name="len" select="string-length($roman)"/>
        <xsl:choose>
            <xsl:when test="not($len)">
                <xsl:value-of select="$value"/>
            </xsl:when>
            <xsl:when test="$len = 1">
                <xsl:value-of select="$value + $ckbk:roman-nums[. = $roman]/@value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="roman-num"
                    select="$ckbk:roman-nums[. = substring($roman, 1, 1)]"/>
                <xsl:choose>
                    <xsl:when
                        test="$roman-num/following-sibling::ckbk:roman = substring($roman, 2, 1)">
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman, 2, $len - 1)"/>
                            <xsl:with-param name="value" select="$value - $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman, 2, $len - 1)"/>
                            <xsl:with-param name="value" select="$value + $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
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

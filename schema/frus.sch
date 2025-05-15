<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook" xmlns:functx="http://www.functx.com"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>FRUS TEI Rules</title>

    <p>FRUS TEI Rules Schematron file</p>

    <p>This schematron adds FRUS TEI-specific rules to the frus.rnc RelaxNG Schema file. FRUS TEI
        files that validate against *both* schema files are considered valid FRUS TEI files.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

    <extends href="frus-id-checks.sch"/>
    <extends href="frus-signatures.sch"/>
    <extends href="frus-characters.sch"/>
    <extends href="frus-dates.sch"/>

    <!-- Define variables used by other patterns -->
    <let name="documents" value="//tei:div[@type = ('document', 'document-pending')]"/>

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
            <assert test="count(tei:notesStmt) eq 1">fileDesc needs exactly one notesStmt</assert>
            <assert test="count(tei:sourceDesc) eq 1">fileDesc needs exactly one sourceDesc</assert>
            <assert test="count(child::element()) eq 4">fileDesc can only have three child elements:
                titleStmt, publicationStmt, notesStmt, and sourceDesc</assert>
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
            <assert test="count(tei:date) = 2">publicationStmt needs exactly two dates: a volume
                publication date and volume content date</assert>
            <assert test="tei:idno/@type = ('dospubno', 'frus', 'isbn-13', 'isbn-10')"
                    >idno/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: dospubno, frus, isbn-13, isbn-10</assert>
            <assert test="count(tei:idno[@type = 'frus'])">publicationStmt needs exactly one idno of
                type 'frus'</assert>
        </rule>
    </pattern>

    <pattern id="list-checks">
        <title>List Checks</title>
        <rule context="tei:list">
            <assert
                test="./@type = ('participants', 'subject', 'index', 'terms', 'names', 'toc', 'references', 'from', 'to', 'simple', 'sources', 'from') or not(./@type)"
                    >list/@type='<value-of select="@type"/>' is an invalid value. Only the following
                values are allowed: participants, subject, index, terms, names, toc, references,
                from, to, simple, sources</assert>
        </rule>
        <rule context="tei:term[@xml:id]">
            <assert test="parent::tei:hi/@rend = 'strong'"
                >Improper nesting of hi and term (a hi/@rend=strong tag must surround the
                term element)</assert>
            <assert test="not(ends-with(., ','))">
                Improper placement of trailing punctuation mark (the
                trailing comma must lie outside the term element)
            </assert>
        </rule>
        <rule context="tei:persName[@xml:id]">
            <assert test="parent::tei:hi/@rend = 'strong'"
                >Improper nesting of hi and persName (a hi/@rend=strong tag must surround the
                persName element)</assert>
            <assert test="not(ends-with(., ','))">
                Improper placement of trailing punctuation mark (the
                trailing comma must lie outside the persName element)
            </assert>
        </rule>
    </pattern>

    <pattern id="att-rend-checks">
        <title>Rend Attribute Value Checks</title>
        <rule context="tei:hi">
            <assert
                test="@rend or @rendition"
                >hi elements require a @rend or @rendition attribute</assert>
        </rule>
    </pattern>

    <pattern id="div-xml-id-attribute-checks">
        <title>Div xml:id Attribute Value Checks</title>
        <rule context="tei:div[exists(.//tei:term/@xml:id)]">
            <assert test="@xml:id eq 'terms'">Unexpected div/@xml:id value: '<value-of
                    select="@xml:id"/>'. The xml:id for the div containing a list of terms and
                abbreviations must be "terms".</assert>
        </rule>
        <rule context="tei:div[exists(.//tei:persName/@xml:id)]">
            <assert test="@xml:id eq 'persons'">Unexpected div/@xml:id value: '<value-of
                    select="@xml:id"/>'. The xml:id for the div containing a list of persons must be
                "persons".</assert>
        </rule>
    </pattern>

    <pattern id="div-child-checks">
        <title>Compilation/Chapter/Subchapter Nesting Checks</title>
        <rule
            context="tei:div[@type = ('compilation', 'chapter', 'chapter-pending', 'subchapter')][not(@subtype = ('index', 'referral', 'editorial-note'))]">
            <assert role="warn"
                test=".//tei:div[@type = ('document', 'document-pending')] or .//tei:div[@subtype = ('index', 'referral', 'editorial-note')]"
                >This <value-of select="@type"/> does not contain a div/@type='document'. Please
                verify that the structure is correct.</assert>
        </rule>
        <rule context="tei:div[@type = ('document', 'document-pending')]">
            <assert role="warn"
                test="not(preceding-sibling::tei:div[1][@type = ('compilation', 'chapter', 'chapter-pending', 'subchapter')] or following-sibling::tei:div[1][@type = ('compilation', 'chapter', 'chapter-pending', 'subchapter')])"
                >This document is preceded or followed by a <value-of select="@type"/>. Please
                verify that the structure is correct.</assert>
        </rule>
    </pattern>

    <pattern id="div-numbering-checks">
        <title>Document Div Numbering Checks</title>
        <rule context="tei:div[@type = ('document', 'document-pending')][@n castable as xs:integer]">
            <assert
                test="not(./preceding::tei:div[@type = ('document', 'document-pending')]) or ./@n = (./preceding::tei:div[@n castable as xs:integer][1]/@n + 1)"
                >Document numbering mismatch. Document div/@n numbering must be
                consecutive.</assert>
        </rule>
        <rule context="tei:div[@type = ('document', 'document-pending')]">
            <assert role="warn" test="not(matches(./@n, '^\[.+?\]$'))">Document's @n is encased in
                square brackets: "[]". Only use in the rare circumstance that the volume has a block
                of unnumbered documents outside the normal stream of numbered documents. Please
                verify that the @n value is correct.</assert>
            <assert role="warn" test="matches(./@n, '^\[.+?\]$') or ./@n castable as xs:integer"
                >Non-number component found in document number "<value-of select="@n"/>". Please
                verify that the document number is correct.</assert>
        </rule>
        <rule context="tei:body">
            <assert
                test="count($documents[@n castable as xs:integer]) = 0 or count($documents[@n castable as xs:integer]) = $documents[@n castable as xs:integer][last()]/@n - $documents[@n castable as xs:integer][1]/@n + 1"
                >Document numbering mismatch. The total number of documents with integer-@n values
                    (<value-of select="count($documents[@n castable as xs:integer])"/>) should equal
                the difference between the first and final documents' numbers (<value-of
                    select="$documents[@n castable as xs:integer][last()]/@n"/> - <value-of
                    select="$documents[@n castable as xs:integer][1]/@n"/> + 1 = <value-of
                    select="$documents[@n castable as xs:integer][last()]/@n - $documents[@n castable as xs:integer][1]/@n + 1"
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
        </rule>
        <!--
        <rule context="frus:attachment//tei:head">
            <assert test="not((.) = '(Editorial Note|Editor’s Note)')">Treat editorial notes
                as full documents, not as attachments</assert>
            <assert test="(.) = '(Attachment|Tab A|Enclosure)'" id="head-label-a">This may
                be an incorrect document head if paired with other elements.</assert>
            <let name="immediate-following-sibling-node"
                value="following-sibling::node()[not(name() = ('opener', 'note') or normalize-space(.) eq '')][1]"/>
            <assert
                test="empty($immediate-following-sibling-node) or $immediate-following-sibling-node/self::tei:p[@rend eq 'center'][child::tei:hi[@rend eq 'strong']]"
                id="head-center-paragraph">This may be a document head, not a centered
                paragraph.</assert>
            <assert
                test=".//child::tei:note[@type eq 'source'][$immediate-following-sibling-node/self::tei:p[@rend eq 'center']]"
                id="head-two-elements">Document head content may be split over two elements.</assert>
            <assert test=".//tei:opener[following-sibling::tei:p[@rend eq 'center']]"
                id="head-opener-p">This may be a document head and should be moved above the
                opener.</assert>
            <assert test=".//tei:head[normalize-space('[A-Z\s]+')]" id="head-subject-line"
                >Subject description content, often indicated by all caps text, should not be tagged
                with a head element.</assert>
            <assert test=".//tei:note/following-sibling::tei:note" id="head-sequential-notes"
                >Sibling note elements may be parts of a document head.</assert>
            <assert test=".//tei:opener/tei:seg[@rendition eq '#center']" id="head-label-b">Segs
                with centered rendition values should be changed to inline notes with type
                source.</assert>
            <assert test=".//tei:lb" id="head-linebreak">Heads should not contain line breaks.</assert>
            </rule> -->
        <!-- experimental frus:attachment @xml:id -->
        <!--
            <assert test="@xml:id">Missing @xml:id for frus:attachment</assert>
            <assert test="matches(@xml:id, concat('^', ./ancestor::tei:div[@xml:id][1]/@xml:id, 'at', index-of(./ancestor::tei:div[@xml:id][1]/frus:attachment, .)))">Incorrectly formed @xml:id '<value-of select="@xml:id"/>'</assert>
            -->


        <!-- experimental frus:attachment @xml:id -->
        <!--
            <assert test="@xml:id">Missing @xml:id for frus:attachment</assert>
            <assert test="matches(@xml:id, concat('^', ./ancestor::tei:div[@xml:id][1]/@xml:id, 'at', index-of(./ancestor::tei:div[@xml:id][1]/frus:attachment, .)))">Incorrectly formed @xml:id '<value-of select="@xml:id"/>'</assert>
            -->


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
        <rule context="tei:note[@xml:id and ancestor::tei:div/@type = ('document', 'document-pending')]">
            <assert test="substring-before(./@xml:id, 'fn') = ./ancestor::tei:div[1]/@xml:id"
                >Footnote ID mismatch. Document ID portion of footnote @xml:id '<value-of
                    select="./@xml:id"/>' must match its document's @xml:id '<value-of
                    select="./ancestor::tei:div[1]/@xml:id"/>'.</assert>
        </rule>
    </pattern>
    
    <pattern id="footnote-numbering-checks">
        <rule role="warn" context="tei:note[@n castable as xs:integer]">
            <let name="this" value="."/>
            <let name="previous-footnote" value="(ancestor::tei:div[1]//tei:note[@n castable as xs:integer][. &lt;&lt; $this])[last()]"/>
            <assert test="empty($previous-footnote) or xs:integer(@n) eq xs:integer($previous-footnote/@n) + 1"
                >Footnote numbering mismatch. This is footnote “<value-of select="@n"/>”, but the previous foonote in the document is “<value-of select="$previous-footnote/@n"/>”.</assert>
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

    <pattern id="ref-to-page-footnote-check">
        <title>Ref to Page Footnote Check</title>
        <rule context="tei:ref[contains(@target, '#pg_')]">
            <assert test="not(following-sibling::node()[1]/self::tei:hi = 'n')">Please italicize 'n'
                inside the ref.</assert>
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
                element should not be empty. (In the back catalog, the editor element may be empty
                by necessity.) Please verify if the editor can be left out or needs to be
                supplied.</assert>
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
        <rule context="tei:lb | tei:pb">
            <assert sqf:fix="delete-child-content" test="empty(./node())"><value-of
                    select="./name()"/> elements must be empty (no child content).</assert>
            <sqf:fix id="delete-child-content">
                <sqf:description>
                    <sqf:title>Delete child content</sqf:title>
                </sqf:description>
                <sqf:delete match="./node()"/>
            </sqf:fix>
        </rule>
    </pattern>

    <pattern id="source-note-checks">
        <title>Source Note checks</title>
        <!-- limit this rule to volumes covering post-1950 or published after 1995, when source note conventions begin to conform to these rules -->
        <rule
            context="tei:div[@subtype eq 'historical-document' and not(@type eq 'document-pending')][root(.)/tei:TEI//tei:publicationStmt[tei:date[@type eq 'content-date']/@notBefore ge '1950' or tei:date[@type eq 'publication-date'] gt '1995']]">
            <let name="source-note"
                value="(tei:note[@type eq 'source' and @rend eq 'inline'], tei:head/tei:note[@type eq 'source'], tei:head/tei:note//tei:seg[@type eq 'source'])[1]"/>
            <let name="source-note-content" value="
                    (if ($source-note/tei:p) then
                        $source-note/tei:p[1]
                    else
                        $source-note)[1] => normalize-space()"/>
            <assert test="exists($source-note)">Source note is missing</assert>
            <!-- if the source note is the 1st element in the div, it's a pre-1955 document, before the "Source:" convention was present/consistent -->
            <assert test="
                    if (./element()[1] is $source-note) then
                        true()
                    else
                        (starts-with($source-note-content, 'Source:') or matches($source-note-content, '^\[Source:(.+)\]$'))"
                >Source note doesn't begin with 'Source:' or '[Source:...]': <value-of
                    select="$source-note-content"/></assert>
        </rule>
    </pattern>

    <pattern id="milestone-checks">
        <title>Milestone checks</title>
        <rule
            context="(tei:pb | tei:lb)[not(parent::tei:front | parent::tei:body | parent::tei:back)]">
            <assert
                test="count(preceding-sibling::element()) ge 1 or normalize-space(string-join(preceding-sibling::node())) ne ''"
                >A pb or lb element cannot be the first element in a parent element (except front,
                body, and back).</assert>
            <assert
                test="count(following-sibling::element()) ge 1 or normalize-space(string-join(following-sibling::node())) ne ''"
                >A pb or lb element cannot be the last element in a parent element (except front,
                body, and back).</assert>
        </rule>
    </pattern>

    <pattern id="unwanted-footnote-whitespace-checks">
        <title>Prevent unwanted footnote whitespace checks</title>
        <rule
            context="tei:note[not(@rend eq 'inline' or preceding-sibling::node()[2] instance of element(tei:note) or parent::tei:notesStmt)]">
            <let name="first-preceding-sibling-node" value="preceding-sibling::node()[1]"/>
            <assert test="
                    if ($first-preceding-sibling-node instance of text()) then
                        normalize-space($first-preceding-sibling-node) ne ''
                    else
                        true()">Whitespace is not allowed before a footnote (except
                between consecutive footnotes)</assert>
        </rule>
    </pattern>

    <pattern id="required-footnote-whitespace-checks">
        <title>Ensure required footnote whitespace checks</title>
        <rule context="tei:note">
            <assert test="not(preceding-sibling::node()[1] instance of element(tei:note))"
                >Whitespace is required between consecutive footnotes</assert>
        </rule>
    </pattern>

    <pattern id="pb-lb-whitespace-checks">
        <title>Ensure balanced whitespace around breaks</title>
        <rule context="tei:lb | tei:pb">
            <assert
                test="(matches(preceding::text()[1], '\s$') and matches(following::text()[1], '^\s')) or (matches(preceding::text()[1], '[^\s]$') and matches(following::text()[1], '^[^\s]'))"
                >A line or page break element should have whitespace both before and after, or
                neither when the break splits a word</assert>
        </rule>
    </pattern>

    <pattern id="quote-checks-block-elements">
        <title>Quote checks (on block elements only)</title>

        <!-- prevent these block elements from having inverted quote marks in their first & last characters.
             note: if we added these tests to all text nodes, we'd get lots of false positives, 
                 e.g., quotes around italicized text or terms.
             note: segs and cells sometime contain a double quote (“, ”, or "), i.e., ditto marks. 
                 FRUS has used all 3 forms in typeset editions. 
                 this check excludes such cases (though the "curly-quote-orientation-checks" above may catch some), 
                 but it flags all others. -->
        <rule
            context="tei:p | tei:head | tei:note[@rend eq 'inline'] | tei:item[not(tei:list)] | (tei:seg | tei:cell)[not(matches(., '^[“”&quot; ]+$'))]">

            <assert role="warn" test="not(matches(., '[“‘]$'))">Curly open quotation mark appears as
                final character of <value-of select="./name()"/> element. Please verify the final
                character or change it to a curly closed quotation mark.</assert>

            <assert role="warn" test="not(matches(., '^[”’][^\d]'))">Curly close quotation mark
                appears first character of this <value-of select="./name()"/> element. Please verify
                the first character or change it to an curly open quotation mark.</assert>
        </rule>
    </pattern>

    <pattern id="image-url-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic">
            <assert test="@url">Missing @url attribute</assert>
        </rule>
    </pattern>

</schema>

<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ckbk="http://www.oreilly.com/XSLTCookbook">
    <title>FRUS TEI Rules</title>
    
    <p>FRUS TEI Rules Schematron file ($Id: frus.sch 4528 2016-02-22 21:33:23Z joewiz $)</p>
    
    <p>This schematron adds FRUS TEI-specific rules to the more generic tei-all.rng RelaxNG Schema file.  FRUS TEI files that validate against *both* schema files are considered valid FRUS TEI files.</p>
    
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="ckbk" uri="http://www.oreilly.com/XSLTCookbook"/>
    
    <!-- Define variables used by other patterns -->
    <let name="xml-ids" value="//*/@xml:id"/>
    <let name="vol-ids" value="if (doc-available('https://history.state.gov/services/volume-ids')) then doc('https://history.state.gov/services/volume-ids')//volume-id else doc('volume-ids-snapshot.xml')//volume-id"/>
    <let name="persName-ids" value="//tei:persName/@xml:id"/>
    <let name="term-ids" value="//tei:term/@xml:id"/>
    <let name="documents" value="//tei:div[@type='document']"/>
    <let name="vol-id" value="/tei:TEI/@xml:id"/>
    <let name="available-images" value="doc(concat('https://history.state.gov/services/volume-images?volume=', $vol-id))//image"/>
    
    <pattern id="filename-id-check">
        <rule context="/tei:TEI">
            <assert test="@xml:id">Volume's root element is missing an @xml:id; it should correspond to the volume ID.</assert>
        </rule>
        <rule context="/tei:TEI/@xml:id">
            <let name="basename" value="replace(base-uri(.), '^.*/(.*?)$', '$1')"/>
            <assert test="$basename = concat(., '.xml')">volume id <value-of select="."/> does
                not match filename <value-of select="$basename"/></assert>
            <assert test=". = $vol-ids">Invalid TEI/@xml:id: <value-of select="."/>. No known volume ID corresponds to this volume's @xml:id.</assert>
        </rule>
    </pattern>
    
    <pattern id="tei-header-checks">
        <title>TEI Header Checks</title>
        <rule context="tei:fileDesc">
            <assert test="count(tei:titleStmt) eq 1">fileDesc needs exactly one titleStmt</assert>
            <assert test="count(tei:publicationStmt) eq 1">fileDesc needs exactly one publicationStmt</assert>
            <assert test="count(tei:sourceDesc) eq 1">fileDesc needs exactly one sourceDesc</assert>
            <assert test="count(child::element()) eq 3">fileDesc can only have three child elements: titleStmt, publicationStmt, and sourceDesc</assert>
        </rule>
        <rule context="tei:title[parent::tei:titleStmt]">
            <assert test="./@type = ('complete', 'series', 'sub-series', 'volume-number', 'volume')">title/@type='<value-of select="@type"/>' is an invalid value.  Only the following values are allowed: complete, series, sub-series, volume-number, volume</assert>
            <assert test="not(./element())">titleStmt/title cannot contain child elements, only a single text node</assert>
        </rule>
        <rule context="tei:titleStmt">
            <assert test="count(tei:title[@type='complete']) = 1">titleStmt needs exactly one title of @type 'complete'</assert>
            <assert test="count(tei:title[@type='series']) = 1">titleStmt needs exactly one title of @type 'series'</assert>
            <assert test="count(tei:title[@type='sub-series']) = 1">titleStmt needs exactly one title of @type 'sub-series'</assert>
            <assert test="count(tei:title[@type='volume-number']) = 1">titleStmt needs exactly one title of @type 'volume-number'</assert>
            <assert test="count(tei:title[@type='volume']) = 1">titleStmt needs exactly one title of @type 'volume'</assert>
            <assert test="count(distinct-values(tei:title/@type)) = count(tei:title)">There can only be one of each @type of title</assert>
        </rule>
        <rule context="tei:publicationStmt">
            <assert test="count(tei:publisher) = 1">publicationStmt needs exactly one publisher</assert>
            <assert test="count(tei:pubPlace) = 1">publicationStmt needs exactly one pubPlace</assert>
            <assert test="count(tei:date) = 1">publicationStmt needs exactly one date</assert>
            <assert test="tei:idno/@type = ('dospubno', 'frus', 'isbn-13', 'isbn-10')">idno/@type='<value-of select="@type"/>' is an invalid value.  Only the following values are allowed: dospubno, frus, isbn-13, isbn-10</assert>
            <assert test="count(tei:idno[@type='frus']) = 1 and tei:idno[@type='frus'] = $vol-ids">publicationStmt needs exactly one idno of type 'frus', and it must be a defined volume ID</assert>
        </rule>
    </pattern>
    
    <pattern id="list-checks">
        <title>List Checks</title>
        <rule context="tei:list">
            <assert test="./@type = ('participants', 'subject', 'index', 'terms', 'names', 'toc', 'references', 'to', 'simple', 'sources', 'from') or not(./@type)">list/@type='<value-of select="@type"/>' is an invalid value.  Only the following values are allowed: participants, subject, index, terms, names, toc, references, to, simple, sources</assert>
        </rule>
        <rule context="tei:item[parent::tei:list/@type = 'terms']">
            <assert test="not(tei:term/tei:hi/@rend = 'strong') and not(ends-with(tei:term, ','))">Improper nesting of hi and term elements (the hi/@rend=strong tag must surround the term element), and/or improper placement of trailing punctuation mark (the trailing comma must lie outside the term element)</assert>
        </rule>
        <rule context="tei:item[parent::tei:list/@type = 'persons']">
            <assert test="tei:persName/tei:hi/@rend = 'strong' or ends-with(tei:persName, ',')">Improper nesting of hi and persName (the hi/@rend=strong tag must surround the persName element), and/or improper placement of trailing punctuation mark (the trailing comma must lie outside the persName element)</assert>
        </rule>
    </pattern>
    
    <pattern id="att-rend-checks">
        <title>Rend Attribute Value Checks</title>
        <rule context="tei:hi">
            <assert test="./@rend = ('strong', 'italic', 'smallcaps', 'roman', 'underline', 'sub', 'superscript')">hi/@rend='<value-of select="@rend"/>' is an invalid value.  Only the following values are allowed: strong, italic, smallcaps, roman, underline, sub, superscript</assert>
        </rule>
        <rule context="tei:p">
            <!-- note that the 4th entry here lets quite a few known "invalid" values pass this test; we will perform this pass of checks at a later stage. TODO. -->
            <assert test="./@rend = ('strong', 'italic') or 
                ./@rend = ('sectiontitleital') or
                ./@rend = ('center', 'right', 'flushleft') or
                ./@rend = ('sourceparagraphspaceafter', 'sourceparagraphfullindent', 'sourceparagraphtightspacing', 'sourceheadcenterboldbig', 'sourcearchiveboldbig') or
                not(./@rend)">p/@rend='<value-of select="@rend"/>' is an invalid value.  Only the following values are allowed: strong, italic, sectiontitleital, center, right, flushleft</assert>
        </rule>
        <rule context="tei:del">
            <assert test="./@rend = 'strikethrough'">del/@rend='<value-of select="@rend"/>' is an invalid value.  Only the following value is allowed: strikethrough</assert>
        </rule>
    </pattern>
    
    <pattern id="div-checks">
        <title>Div Type Attribute Value Checks</title>
        <rule context="tei:div">
            <assert test="./@type = ('document', 'chapter', 'subchapter', 'document-group', 'compilation', 'section', 'toc')">div/@type='<value-of select="@type"/>' is an invalid value.  Only the following values are allowed: document, chapter, subchapter, compilation, section, toc</assert>
        </rule>
    </pattern>
    
    <pattern id="div-numbering-checks">
        <title>Document Div Numbering Checks</title>
        <rule context="tei:div[@type='document'][@n castable as xs:integer]">
            <assert test="not(./preceding::tei:div[@type='document']) or 
                ./@n = (./preceding::tei:div[@n castable as xs:integer][1]/@n + 1)">Document numbering mismatch.  Document div/@n numbering must be consecutive.</assert>
        </rule>
        <rule context="tei:div[@type='document']">
            <assert test="not(matches(./@n, '^\[.+?\]$'))" role="warning">Document's @n is encased in square brackets: "[]". Only use in the rare circumstance that the volume has a block of unnumbered documents outside the normal stream of numbered documents.</assert>
            <assert test="matches(./@n, '^\[.+?\]$') or ./@n castable as xs:integer">Non-number component found in document number "<value-of select="@n"/>"</assert>
        </rule>
        <rule context="tei:body">
            <assert test="count($documents[@n castable as xs:integer]) = 0 or count($documents[@n castable as xs:integer]) = $documents[last()]/@n[. castable as xs:integer] - $documents[@n castable as xs:integer][1]/@n + 1">Document numbering mismatch.  The total number of documents with integer-@n values (<value-of select="count($documents[@n castable as xs:integer])"/>) should equal the difference between the first and final documents' numbers (<value-of select="$documents[@n castable as xs:integer][last()]/@n"/> - <value-of select="$documents[@n castable as xs:integer][1]/@n"/> + 1 = <value-of select="$documents[@n castable as xs:integer][last()]/@n[. castable as xs:integer] - $documents[@n castable as xs:integer][1]/@n + 1"/>), or the number of documents must be 0 (indicating a volume not yet digitized).</assert>
        </rule>
    </pattern>
    
    <pattern id="frus-attachment-checks">
        <title>frus:attachment Checks</title>
        <rule context="frus:attachment">
            <assert test="not(tei:div)">A frus:attachment element must not contain a child tei:div</assert>
            <assert test="not(.//tei:head = 'Editorial Note')">Treat editorial notes as full documents, not as attachments</assert>
            <!-- experimental frus:attachment @xml:id -->
            <!--
            <assert test="@xml:id">Missing @xml:id for frus:attachment</assert>
            <assert test="matches(@xml:id, concat('^', ./ancestor::tei:div[@xml:id][1]/@xml:id, 'at', index-of(./ancestor::tei:div[@xml:id][1]/frus:attachment, .)))">Incorrectly formed @xml:id '<value-of select="@xml:id"/>'</assert>
            -->
        </rule>
    </pattern>
    
    <pattern id="table-rows-cols-checks">
        <rule context="tei:table[@rows and @cols]">
            <assert test="./@rows = count(child::tei:row)">The number of rows asserted in the table element, <value-of select="./@rows"/>, does not equal the total number of row tags, <value-of select="count(child::tei:row)"/> </assert>
            <!-- this test relies on the XPath 3.0 simple map operator (!) and is waiting on oXygen support. until then, the test will fail in the case of row-spanning cells. -->
            <!--<assert test="sum(./@rows * ./@cols)=count(descendant::tei:cell)">The number of cells asserted in the table element (<value-of select="./@rows"/> rows * <value-of select="./@cols"/> columns means there should be <value-of select="sum(./@rows * ./@cols)"/> cells), does not equal the total number of cells in the table, <value-of select="count(descendant::tei:cell[not(@rows)]) + descendant::tei:cell ! ./@rows"/></assert>-->
        </rule>
    </pattern>
    
    <pattern id="footnote-id-checks">
        <title>Footnote ID Checks</title>
        <rule context="tei:note[@xml:id and ancestor::tei:div/@type='document']">
            <assert test="substring-before(./@xml:id, 'fn') = ./ancestor::tei:div[1]/@xml:id">Footnote ID mismatch.  Document ID portion of footnote @xml:id '<value-of select="./@xml:id"/>' must match its document's @xml:id '<value-of select="./ancestor::tei:div[1]/@xml:id"/>'.</assert>
        </rule>
    </pattern>
    
    <pattern id="element-nesting-checks">
        <title>Element Nesting Checks</title>
        <rule context="tei:note[not(@rend='inline')]">
            <assert test="count(descendant::tei:note) = 0">A footnote cannot be nested inside another footnote, see note/@xml:id='<value-of select="./@xml:id"/>'.</assert>
        </rule>
        <rule context="tei:list">
            <assert test="count(./tei:p) = 0">A list element cannot contain a direct child paragraph element.</assert>
            <assert test="count(.//tei:table) = 0">A list element cannot contain a table element.</assert>
        </rule>
    </pattern>
    
    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule context="tei:ref[starts-with(@target, '#pg') and substring-after(@target, 'pg_') castable as xs:integer and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert test="xs:integer(substring-after(@target, '#pg_')) gt xs:integer(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))">Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"/>–<value-of select="@target"/> (see #<value-of select="./ancestor::tei:div[1]/@xml:id"/> <value-of select="if (./ancestor::tei:div[1]/@xml:id = 'index') then concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',') else ()"/> and <value-of select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, '#pg') and not(substring-after(@target, 'pg_') castable as xs:integer) and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert test="xs:integer(ckbk:roman-to-number(substring-after(@target, '#pg_'))) gt xs:integer(ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_')))">Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"/>–<value-of select="@target"/> (<value-of select="ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))"/>–<value-of select="ckbk:roman-to-number(substring-after(@target, '#pg_'))"/>; see #<value-of select="./ancestor::tei:div[1]/@xml:id"/> <value-of select="if (./ancestor::tei:div[1]/@xml:id = 'index') then concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',') else ()"/> and <value-of select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, 'frus')]">
            <assert test="
                if (contains(@target, '#') and substring-before(@target, '#') = $vol-ids) then
                    (
                    substring-before(@target, '#') = $vol-ids 
                    and 
                        (
                        if (doc-available(concat('../volumes/', substring-before(@target, '#') , '.xml'))) then
                            doc(concat('../volumes/', substring-before(@target, '#') , '.xml'))//*/@xml:id = substring-after(@target, '#')
                        else if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#') , '.xml'))) then
                            doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#') , '.xml'))//*/@xml:id = substring-after(@target, '#')
                        else 
                            false()
                        )
                    )
                else 
                    @target = $vol-ids
                ">ref/@target='<value-of select="@target"/>' is an invalid value.  No volume's ID and/or target element corresponds to this ref/@target value (or, possibly, the volume has not yet been published).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, '#')]">
            <assert test="substring-after(@target, '#') = $xml-ids">ref/@target='<value-of select="@target"/>' is an invalid value.  No element's @xml:id corresponds to this value.</assert>
        </rule>
        <rule context="tei:ref">
            <assert test="starts-with(@target, '#') or starts-with(@target, 'http') or starts-with(@target, 'mailto')">Invalid ref/@target='<value-of select="@target"/>'. If this is an internal cross-reference, it needs a "#" prefix.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, '#')]">
            <assert test="substring-after(@corresp, '#') = $persName-ids">persName/@corresp='<value-of select="@corresp"/>' is an invalid value.  No persName has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, 'frus')]">
            <assert test="
                substring-before(@corresp, '#') = $vol-ids 
                and 
                (
                    if (doc-available(concat('../volumes/', substring-before(@corresp, '#') , '.xml'))) then
                        doc(concat('../volumes/', substring-before(@corresp, '#') , '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                    else if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#') , '.xml'))) then
                        doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#') , '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                    else
                        false()
                )
                ">persName/@corresp='<value-of select="@corresp"/>' is an invalid value.  No persName has been defined in that volume with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:gloss[@target]">
            <assert test="substring-after(@target, '#') = $term-ids">gloss/@target='<value-of select="@target"/>' is an invalid value.  No term has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="@xml:id">
            <assert test="count(index-of($xml-ids, .)) eq 1">@xml:id=<value-of select="."/>. Two elements cannot have the same xml:id attribute.</assert>
        </rule>
    </pattern>
    
    <pattern id="ref-to-page-footnote-check">
        <title>Ref to Page Footnote Check</title>
        <rule context="tei:ref[contains(@target, '#pg_')]">
            <assert test="not(following-sibling::node()[1]/self::tei:hi = 'n')">Please italicized 'n' inside the ref.</assert>
        </rule>
    </pattern>
    
    <pattern id="empty-missing-content-checks">
        <title>Empty/Missing Content Checks</title>
        <rule context="tei:p | tei:gloss | tei:persName | tei:placeName">
            <assert test="count(./node()) gt 0"><value-of select="name(.)"/> elements cannot be empty.</assert>
        </rule>
        <rule context="tei:editor">
            <assert test="./parent::tei:titleStmt">An editor element is allowed only in the tei:titleStmt element.</assert>
            <assert test="count(./node()) gt 0">An editor element cannot be empty.</assert>
            <assert test="./@role">An editor element needs a @role attribute.</assert>
            <assert test="string-length(./@role) gt 0">An editor/@role attribute cannot be empty.</assert>
            <assert test="@role = ('primary', 'general')">The value of editor/@role must be: primary or general</assert>
        </rule>
        <rule context="tei:div">
            <assert test="count(tei:head) = 1">A div must have a head child.</assert>
            <assert test="./@xml:id">A div must have an @xml:id attribute.</assert>
        </rule>
        <rule context="tei:head">
            <assert test="count(preceding-sibling::tei:head) = 0">There can only be one head element.</assert>
            <assert test="string-length(normalize-space(.)) gt 0">Head elements cannot be empty.</assert>
        </rule>
    </pattern>

    <pattern id="image-url-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic">
            <assert test="@url">Missing @url attribute</assert>
            <assert test="not(matches(@url, '\..{3,4}$'))">File extensions not allowed: <value-of select="@url"/></assert>
        </rule>
    </pattern>
    
    <pattern id="image-s3-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic[@url][not(ancestor::tei:titlePage)]">
            <assert test="concat(@url, '.png') = $available-images">PNG version of '<value-of select="@url"/>' not found on static.history.state.gov</assert>
            <assert test="concat(@url, '.tif') = $available-images">TIFF version of '<value-of select="@url"/>' not found on static.history.state.gov</assert>
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
            <xsl:when test="translate($roman,$valid-roman-chars,'')">NaN</xsl:when>
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
                    <xsl:when test="$roman-num/following-sibling::ckbk:roman =
                        substring($roman, 2, 1)">
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman,2,$len - 1)"/>
                            <xsl:with-param name="value" select="$value - $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman,2,$len - 1)"/>
                            <xsl:with-param name="value" select="$value + $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</schema>
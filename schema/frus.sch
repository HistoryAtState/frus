<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>FRUS TEI Rules</title>
    
    <p>FRUS TEI Rules Schematron file ($Id: frus.sch 3188 2014-09-24 14:11:36Z joewiz $)</p>
    
    <p>This schematron adds FRUS TEI-specific rules to the more generic tei-all.rng RelaxNG Schema file.  FRUS TEI files that validate against *both* schema files are considered valid FRUS TEI files.</p>
    
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    
    <!-- Define variables used by other patterns -->
    <let name="xml-ids" value="//*/@xml:id"/>
    <let name="vol-ids" value="if (doc-available('http://history.state.gov/services/volume-ids')) then doc('http://history.state.gov/services/volume-ids')//volume-id else doc('volume-ids-snapshot.xml')//volume-id"/>
    <let name="persName-ids" value="//tei:persName/@xml:id"/>
    <let name="term-ids" value="//tei:term/@xml:id"/>
    <let name="documents" value="//tei:div[@xml:id and @type='document']"/>
    
    <pattern id="tei-header-checks">
        <title>TEI Header Checks</title>
        <rule context="tei:fileDesc">
            <assert test="count(tei:titleStmt) eq 1">fileDesc needs exactly one titleStmt</assert>
            <assert test="count(tei:publicationStmt) eq 1">fileDesc needs exactly one publicationStmt</assert>
            <assert test="count(tei:sourceDesc) eq 1">fileDesc needs exactly one sourceDesc</assert>
            <assert test="count(child::element()) eq 3">fileDesc can only have three child elements: titleStmt, publicationStmt, and sourceDesc</assert>
        </rule>
        <rule context="tei:title[parent::tei:titleStmt]">
            <assert test="./@type = ('complete', 'series', 'subseries', 'volumenumber', 'volume')">title/@type='<value-of select="@type"/>' is an invalid value.  Only the following values are allowed: complete, series, subseries, volumenumber, volume</assert>
            <assert test="not(./element())">titleStmt/title cannot contain child elements, only a single text node</assert>
        </rule>
        <rule context="tei:titleStmt">
            <assert test="count(tei:title[@type='complete']) = 1">titleStmt needs exactly one title of @type 'complete'</assert>
            <assert test="count(tei:title[@type='series']) = 1">titleStmt needs exactly one title of @type 'series'</assert>
            <assert test="count(tei:title[@type='subseries']) = 1">titleStmt needs exactly one title of @type 'subseries'</assert>
            <assert test="count(tei:title[@type='volumenumber']) = 1">titleStmt needs exactly one title of @type 'volumenumber'</assert>
            <assert test="count(tei:title[@type='volume']) = 1">titleStmt needs exactly one title of @type 'volume'</assert>
            <assert test="count(distinct-values(tei:title/@type)) = count(tei:title)">There can only be one of each @type of title</assert>
            <assert test="count(tei:editor[@role='primary']) >= 1">titleStmt needs at least one editor of @role 'primary'</assert>
            <assert test="count(tei:editor[@role='general']) >= 1">titleStmt needs at least one editor of @role 'general'</assert>
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
        <rule context="tei:div[@xml:id and @type='document']">
            <assert test="not(./preceding::tei:div[@xml:id and @type='document']) or 
                ./@n = (./preceding::tei:div[@n][1]/@n + 1)">Document numbering mismatch.  Document div/@n numbering must be consecutive.</assert>
        </rule>
        <rule context="tei:body">
            <assert test="count($documents) = 0 or count($documents) = $documents[last()]/@n - $documents[1]/@n + 1">Document numbering mismatch.  The total number of documents should equal the difference between the first and final documents' numbers, or the number of documents must be 0 (indicating a volume not yet digitized).</assert>
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
            <assert test="substring-before(./@xml:id, 'fn') = ./ancestor::tei:div[@xml:id][1]/@xml:id">Footnote ID mismatch.  Document ID portion of footnote @xml:id '<value-of select="./@xml:id"/>' must match its document's @xml:id '<value-of select="./ancestor::tei:div[@xml:id][1]/@xml:id"/>'.</assert>
        </rule>
    </pattern>
    
    <pattern id="element-nesting-checks">
        <title>Element Nesting Checks</title>
        <rule context="tei:note">
            <assert test="count(descendant::tei:note) = 0">A footnote cannot be nested inside another footnote, see note/@xml:id='<value-of select="./@xml:id"/>'.</assert>
        </rule>
        <rule context="tei:list">
            <assert test="count(./tei:p) = 0">A list element cannot contain a direct child paragraph element.</assert>
            <assert test="count(.//tei:table) = 0">A list element cannot contain a table element.</assert>
        </rule>
    </pattern>
    
    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule context="tei:ref[starts-with(@target, '#')]">
            <assert test="substring-after(@target, '#') = $xml-ids">ref/@target='<value-of select="@target"/>' is an invalid value.  No element's @xml:id corresponds to this value.</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, 'frus')]">
            <assert test="if (contains(@target, '#')) then substring-before(@target, '#') = $vol-ids else @target = $vol-ids">ref/@target='<value-of select="if (contains(@target, '#')) then substring-before(@target, '#') else @target"/>' is an invalid value.  No volume's ID corresponds to this ref/@target value.</assert>
        </rule>
        <rule context="tei:persName[@corresp]">
            <assert test="substring-after(@corresp, '#') = $persName-ids">persName/@corresp='<value-of select="@corresp"/>' is an invalid value.  No persName has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:gloss[@target]">
            <assert test="substring-after(@target, '#') = $term-ids">gloss/@target='<value-of select="@target"/>' is an invalid value.  No term has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
    </pattern>
    
    <pattern id="empty-content-checks">
        <title>Empty Content Checks</title>
        <rule context="tei:p">
            <assert test="count(./node()) gt 0">paragraphs cannot be empty.</assert>
        </rule>
        <rule context="tei:div">
            <assert test="count(tei:head) = 1">A div must have a head child.</assert>
        </rule>
        <rule context="tei:div">
            <assert test="./@xml:id">A div must have an @xml:id attribute.</assert>
        </rule>
        <rule context="tei:head">
            <assert test="count(preceding-sibling::tei:head) = 0">There can only be one head element.</assert>
        </rule>
    </pattern>
    
</schema>
<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron">
    <title>FRUS TEI Rules - Character-level checks</title>

    <p>This schematron file contains rules augmenting frus.sch that analyze characters in all text
        nodes—to flag potential punctuation problems or OCR errors.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

    <pattern id="punctuation-orientation-and-placement-checks">
        <title>Punctuation orientation &amp; placement checks</title>

        <!-- check all text nodes (except those in catDesc elements, 
            since the imported frus-dates taxonomy contains straight quotes) -->
        <rule context="text()[not(parent::tei:catDesc | parent::tei:rendition)]">

            <!-- flag unexpected space after an open quote -->
            <assert role="warn" test="not(matches(., '[“‘] '))">Curly open quotation mark appears in
                    [<value-of
                    select="string-join(analyze-string(normalize-space(.), '\S*[“‘] \S*')/fn:match, '; ')"
                />]. Please verify the quotation mark, correct it, or delete the trailing
                space.</assert>

            <!-- flag unexpected space before a close quote. exclude abbreviated numbers, e.g., ’70s -->
            <assert role="warn" test="not(matches(., ' [”’][^\d]'))">Curly close quotation mark
                appears in [<value-of
                    select="string-join(analyze-string(normalize-space(.), '\S* [”’][^\d]\S*')/fn:match, '; ')"
                />]. Please verify the quotation mark, correct it, or delete the leading
                space.</assert>

            <!-- flag mixed use of straight and curly. exclude measures of feet and inches, e.g., 6' or 5'2" -->
            <assert role="warn" test="not(matches(., '\D[''&quot;]') and matches(., '[‘’“”]'))"
                >Mixed use of straight and curly quotes. Please verify the quotes or change straight
                to curly. Straight: [<value-of
                    select="string-join(analyze-string(normalize-space(.), '\S*[''&quot;]\S*')/fn:match, '; ')"
                />] // Curly: [<value-of
                    select="string-join(analyze-string(normalize-space(.), '\S*[‘’“”]\S*')/fn:match, '; ')"
                />] </assert>

            <!-- flag all other instances of straight quotes. exclude measures of feet and inches -->
            <assert role="warn" test="not(matches(., '\D[''&quot;]') and not(matches(., '[‘’“”]')))"
                >Straight quotation marks found. Please verify the quotes or change them to curly.
                    [<value-of
                    select="string-join(analyze-string(normalize-space(.), '\S*[''&quot;]\S*')/fn:match, '; ')"
                />] </assert>

            <!-- flag mismatched orientation in pairs of quotes -->
            <assert role="warn" test="not(matches(., '[’”][‘“]|[‘“][’”]'))">Mismatched pair of
                consecutive curly quotes: [<value-of
                    select="string-join(analyze-string(., '([’”][‘“]|[‘“][’”])')/fn:match, '; ')"
                />]. Please verify the quotes or fix their open/close orientation.</assert>

            <!-- flag spaces surrounding colons and semi-colons -->
            <assert role="warn"
                test="not(matches(replace(., '(\s+\.){3,}', ''), '^\s+[\.,:;?!>)\]\}]|[a-z]\s+[\.,:;?!>)\]\}]'))"
                >Space preceding closing punctuation: [<value-of
                    select="string-join(analyze-string(replace(., '(\s+\.){3,}', ''), '^(\s+[\.,:;?!>)\]\}]+)+|\w+(\s+[\.,:;?!>)\]\}]+)+')/fn:match ! ('“' || . || '”'), ', ')"
                />]. Please verify the space or delete it.</assert>

        </rule>
    </pattern>

</schema>

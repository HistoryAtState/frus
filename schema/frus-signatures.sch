<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>FRUS TEI Rules - Signature block checks</title>

    <p>This schematron file contains Signature block-related rules augmenting frus.sch.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

    <pattern id="signed-checks">
        <title>Signature block checks</title>
        <rule context="tei:closer">
            <assert id="multiple-closers" role="warn" test="not(following-sibling::tei:closer)"
                >Multiple consecutive signature blocks should be combined into a single
                closer.</assert>
            <assert id="closer-multiple-signed" role="warn" test="count(tei:signed) eq 1">A closer
                should only have one child signed element</assert>
        </rule>
        <rule context="tei:signed">
            <assert id="signed-corresp" test="not(@corresp)">The @corresp attribute is not allowed
                on the signed element; it should be moved to the persName inside the signed
                element</assert>
            <assert role="warning" id="signed-persname" test=".//tei:persName[not(ancestor::tei:note)]">Signature
                blocks should contain a persName</assert>
            <assert id="affiliation" role="warn" test="not(.//tei:affiliation)">The affiliation
                element is not allowed.</assert>
        </rule>
        <rule context="tei:signed//tei:persName[not(ancestor::tei:note)]">
            <assert id="persnames-child-hi-rend-strong" role="warn"
                test="empty(.) or tei:hi[@rend eq 'strong'] or tei:hi[@rend eq 'italic' and contains(normalize-space(.), 'name not declassified')]"
                >People who signed must be wrapped in a hi/@rend="strong" element</assert>
            <let name="immediate-following-sibling-node"
                value="following-sibling::node()[not(name() = ('note', 'lb') or normalize-space(.) eq '')][1]"/>
            <assert id="persnames-siblings-italics"
                test="empty($immediate-following-sibling-node) or (matches(normalize-space($immediate-following-sibling-node), '^\p{P}*$') or $immediate-following-sibling-node/self::tei:hi/@rend eq 'italic')"
                >Text following a persName element must be wrapped in a hi/@rend="italic" element,
                not an affiliation element; be sure any line breaks are marked with lb
                elements</assert>
            <let name="immediate-preceding-sibling-text-node"
                value="preceding-sibling::text()[not(normalize-space(.) eq '')][1]"/>
            <assert id="first-name" role="warn"
                test="empty($immediate-preceding-sibling-text-node) or matches(normalize-space($immediate-preceding-sibling-text-node), '^\p{P}*$')"
                >There should be no untagged text nodes in signed elements before a
                persName.</assert>
            <let name="following-italicized-text"
                value="following-sibling::tei:hi[@rend eq 'italic']"/>
            <let name="following-linebreaks" value="following-sibling::tei:lb"/>
            <assert id="insert-linebreaks"
                test="($following-italicized-text and $following-linebreaks) or (empty($following-italicized-text) and empty($following-linebreaks))"
                >Any persName elements followed by italicized text should be separated by lb
                elements.</assert>
            <assert id="persname-multiple" role="warn"
                test="not(following-sibling::tei:persName) or contains-token(ancestor::tei:signed/@ana, '#signed-exception_multiple-consecutive-persnames')"
                >This may need to be adapted to a list/item structure (or given a signed-exception
                @ana value for multiple consecutive persNames)</assert>
        </rule>
    </pattern>

</schema>

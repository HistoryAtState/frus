<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <pattern id="signed-checks">
        <title>Signature block checks</title>
        <rule context="tei:closer">
            <assert test="not(following-sibling::tei:closer)" id="multiple-closers" role="warn"
                >Multiple consecutive signature blocks should be combined into a single
                closer.</assert>
            <assert test="count(tei:signed) eq 1" id="closer-multiple-signed" role="warn">A closer
                should only have one child signed element</assert>
        </rule>
        <rule context="tei:signed">
            <assert test="not(@corresp)" id="signed-corresp">The @corresp attribute is not allowed
                on the signed element; it should be moved to the persName inside the signed
                element</assert>
            <assert test=".//tei:persName[not(ancestor::tei:note)]" id="signed-persname">Signature
                blocks must contain a persName</assert>
            <assert test="not(.//tei:affiliation)" id="affiliation" role="warn">The affiliation
                element is not allowed.</assert>
        </rule>
        <rule context="tei:signed//tei:persName[not(ancestor::tei:note)]">
            <assert test="empty(.) or tei:hi[@rend eq 'strong'] or tei:hi[@rend eq 'italic' and contains(normalize-space(.), 'name not declassified')]" role="warn"
                id="persnames-child-hi-rend-strong">People who signed must be wrapped in
                a hi/@rend="strong" element</assert>
            <let name="immediate-following-sibling-node"
                value="following-sibling::node()[not(name() = ('note', 'lb') or normalize-space(.) eq '')][1]"/>
            <assert
                test="empty($immediate-following-sibling-node) or (matches(normalize-space($immediate-following-sibling-node), '^\p{P}*$') or $immediate-following-sibling-node/self::tei:hi/@rend eq 'italic')"
                id="persnames-siblings-italics">Text following a persName element must be wrapped in
                a hi/@rend="italic" element, not an affiliation element; be sure any line breaks are
                marked with lb elements</assert>
            <let name="immediate-preceding-sibling-text-node"
                value="preceding-sibling::text()[not(normalize-space(.) eq '')][1]"/>
            <assert
                test="empty($immediate-preceding-sibling-text-node) or matches(normalize-space($immediate-preceding-sibling-text-node), '^\p{P}*$')"
                id="first-name" role="warn">There should be no untagged text nodes in signed
                elements before a persName.</assert>
            <let name="following-italicized-text"
                value="following-sibling::tei:hi[@rend eq 'italic']"/>
            <let name="following-linebreaks" value="following-sibling::tei:lb"/>
            <assert
                test="($following-italicized-text and $following-linebreaks) or (empty($following-italicized-text) and empty($following-linebreaks))"
                id="insert-linebreaks">Any persName elements followed by italicized text should be
                separated by lb elements.</assert>
            <assert test="not(following-sibling::tei:persName) or contains-token(ancestor::tei:signed/@ana, '#signed-exception_multiple-consecutive-persnames')" role="warn" id="persname-multiple"
                >This may need to be adapted to a list/item structure (or given a signed-exception
                @ana value for multiple consecutive persNames)</assert>
        </rule>
    </pattern>

</schema>

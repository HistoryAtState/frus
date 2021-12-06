<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <pattern id="signed-checks">
        <title>Signature block checks</title>
        <rule context="tei:signed">
            <assert test="not(@corresp)" id="signed-corresp">The @corresp attribute is not allowed
                on the signed element; it should be moved to the persName inside the signed
                element</assert>
            <assert test=".//tei:persName[not(ancestor::tei:note)]" id="signed-persname">Signature
                blocks must contain a persName</assert>
        </rule>
        <rule context="tei:signed//tei:persName[not(ancestor::tei:note)]">
            <assert test="empty(.) or tei:hi[@rend eq 'strong']" role="warn">People who signed must
                be wrapped in a hi/@rend="strong" element</assert>
            <let name="immediate-following-sibling-node"
                value="following-sibling::node()[not(name() = ('note', 'lb') or normalize-space(.) eq '')][1]"/>
            <assert
                test="empty($immediate-following-sibling-node) or (matches(normalize-space($immediate-following-sibling-node), '^\p{P}*$') or $immediate-following-sibling-node/self::tei:hi/@rend eq 'italic')"
                >Text following a persName element must be wrapped in a hi/@rend="italic" element,
                not an affiliation element; be sure any line breaks are marked with lb
                elements</assert>
            <let name="following-nodes"
                value="following-sibling::node()[not(name(.) = ('note', 'persName', 'affiliation'))]"/>
            <assert
                test="count($following-nodes) le 1 or ($following-nodes/self::tei:hi/@rend = 'italic' and $following-nodes/self::tei:lb)"
                >Any persName elements followed by italicized text should be separated by lb
                elements.</assert>
        </rule>
        <rule context="tei:signed//tei:persName[not(ancestor::tei:note)]">
            <assert test="following-sibling::tei:persName" role="warn">This may need to be adapted
                to a list/item structure</assert>
        </rule>
    </pattern>

</schema>

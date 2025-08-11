<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron">
    <title>FRUS Bibliography Rules</title>

    <p>This schematron adds a few contextual rules RelaxNG Schema file for bibliography files.</p>

    <pattern id="filename-id-check">
        <rule context="/volume">
            <assert test="@id">Volume's root element is missing an @id; it should correspond to the
                volume ID.</assert>
        </rule>
        <rule context="/volume/@id">
            <let name="basename" value="replace(base-uri(.), '^.*/(.*?)$', '$1')"/>
            <assert test="$basename = concat(., '.xml')">volume id <value-of select="."/> does not
                match filename <value-of select="$basename"/></assert>
        </rule>
    </pattern>
    <pattern id="pre-publication-check">
        <title>Checks for volumes that have been published</title>
        <rule context="span[parent::length/parent::volume/publication-status = 'published']">
            <assert test=". ne ''">Length must be entered for published volumes</assert>
        </rule>
        <rule context="published-year[parent::volume/publication-status = 'published']">
            <assert test=". ne ''">Published year must be entered for published volumes</assert>
        </rule>
        <rule
            context="published-date[parent::volume/publication-status = 'published' and parent::volume/published-year gt '2009']">
            <assert test=". ne ''">Published date must be entered for published volumes</assert>
            <p>This constraint is only applied to volumes published since 2009, since exact dates
                weren't tracked before then.</p>
        </rule>
    </pattern>
    <pattern id="common-errors">
        <title>Checks text of bibliography entries for common errors</title>
        <rule context="title[@type = 'volume-number']">
            <assert test="matches(., '^(Volume|Part|Appendix)') or . = ''"
                >title/@type="volume-number" must start with "Volume," "Part," or "Appendix", or be
                empty</assert>
        </rule>
    </pattern>
</schema>

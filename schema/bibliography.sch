<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3">
    <title>FRUS Bibliography Rules</title>

    <p>This schematron adds a few contextual rules RelaxNG Schema file for bibliography files.</p>

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
        </rule>
    </pattern>
    <pattern id="common-errors">
        <title>Checks text of bibliography entries for common errors</title>
        <rule context="title[@type = 'volume-number']">
            <assert test="starts-with(., 'Volume') or . = ''">title/@type="volume-number" must start
                with "Volume" or be empty</assert>
        </rule>
    </pattern>
</schema>

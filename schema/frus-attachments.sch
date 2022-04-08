<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    queryBinding="xslt3">
    <title>FRUS TEI Rules - Signature block checks</title>
    
    <p>This schematron file contains Signature block-related rules augmenting frus.sch.</p>
    
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    
    <pattern id="frus-attachment-checks">
        <title>frus:attachment Checks</title>
        <rule context="frus:attachment">
            <assert test="not(tei:div)">A frus:attachment element must not contain a child
                tei:div</assert>
            <assert test="not(.//tei:note/following-sibling::tei:note[1])" id="head-sequential-notes" role="warn"
                >Direct sibling note elements may be parts of a document head.</assert>
            <assert test="not(.//tei:opener/tei:seg[@rendition eq '#center'])" id="head-label-b">Segs
                with centered rendition values should be changed to inline notes with type
                source.</assert> <!-- Works -->
            <assert test=".//tei:opener[following-sibling::tei:p[@rend eq 'center'][1]]"
                id="head-opener-p" role="warn">This may be a document head and should be moved above the
                opener.</assert> <!-- Works -->
            <let name="immediate-following-sibling-node"
                value="following-sibling::node()[not(name() = ('opener', 'note', 'head') or normalize-space(.) eq '')][1]"/>
            <assert
                test="empty($immediate-following-sibling-node) or $immediate-following-sibling-node/self::tei:p[@rend eq 'center'][child::tei:hi[@rend eq 'strong']]"
                id="head-center-paragraph" role="warn">This may be a document head, not a centered
                paragraph.</assert>
            <assert
                test=".//child::tei:note[@type eq 'source'][$immediate-following-sibling-node/self::tei:p[@rend eq 'center']]"
                id="head-two-elements" role="warn">Document head content may be split over two elements.</assert>
        </rule>
        <rule context="frus:attachment//tei:head">
            <assert test="not((.) = '(Editorial Note|Editor’s Note)')">Treat editorial notes
                as full documents, not as attachments</assert> <!-- Works -->
            <assert test="not((.) = '(Attachment|Tab A|Enclosure)')" id="head-label-a" role="warn">This may
                be an incorrect document head if paired with other elements.</assert> <!-- Works -->
            <assert test="not(.//tei:head[normalize-space('[$A-Z\s]+')])" id="head-subject-line"
                >Subject description content, often indicated by all caps text, should not be tagged
                with a head element.</assert>
            <assert test="not(.//tei:lb)" id="head-linebreak" role="warn">Heads should not contain line breaks.</assert> <!-- Works -->
            <!-- experimental frus:attachment @xml:id -->
            <assert test="@xml:id">Missing @xml:id for frus:attachment</assert>
            <assert test="matches(@xml:id, concat('^', ./ancestor::tei:div[@xml:id][1]/@xml:id, 'at', index-of(./ancestor::tei:div[@xml:id][1]/frus:attachment, .)))">Incorrectly formed @xml:id '<value-of select="@xml:id"/>'</assert>
            
        </rule>
    </pattern>
    
</schema>

        
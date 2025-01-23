<?xml version="1.0" encoding="UTF-8"?>
<schema queryBinding="xslt3" xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>FRUS TEI Rules - ID checks</title>

    <p>This schematron file contains ID-related rules augmenting frus.sch.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="ckbk" uri="http://www.oreilly.com/XSLTCookbook"/>

    <!-- Define variables used by other patterns -->
    <let name="xml-ids" value="//*/@xml:id"/>
    <let name="vol-ids" value="
            if (doc-available('https://history.state.gov/services/volume-ids')) then
                doc('https://history.state.gov/services/volume-ids')//volume-id
            else
                doc('volume-ids-snapshot.xml')//volume-id"/>
    <let name="persName-ids" value="//tei:persName/@xml:id"/>
    <let name="term-ids" value="//tei:term/@xml:id"/>
    <let name="rendition-ids" value="//tei:rendition/@xml:id"/>
    <let name="vol-id" value="/tei:TEI/@xml:id"/>
    <let name="category-ids" value="//tei:category/@xml:id"/>
    <let name="available-images"
        value="doc(concat('https://history.state.gov/services/volume-images?volume=', $vol-id))//image"/>

    <pattern id="filename-id-check">
        <rule context="/tei:TEI">
            <assert test="@xml:id">Volume's root element is missing an @xml:id; it should correspond
                to the volume ID.</assert>
        </rule>
        <rule context="/tei:TEI/@xml:id">
            <let name="basename" value="replace(base-uri(.), '^.*/(.*?)$', '$1')"/>
            <assert test="$basename = concat(., '.xml')">volume id <value-of select="."/> does not
                match filename <value-of select="$basename"/></assert>
            <assert test=". = $vol-ids">Invalid TEI/@xml:id: <value-of select="."/>. No known volume
                ID corresponds to this volume's @xml:id.</assert>
        </rule>
    </pattern>

    <pattern id="att-rendition-checks">
        <title>Rendition Attribute Value Checks</title>
        <rule context="@rendition">
            <assert test="
                    every $rendition-ref in (tokenize(., '\s+') ! substring-after(., '#'))
                        satisfies $rendition-ref = $rendition-ids">The rendition ID
                    '<value-of select="."/>' is not defined in the teiHeader's list of renditions:
                    <value-of select="string-join($rendition-ids, ', ')"/></assert>
        </rule>
    </pattern>

    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule
            context="tei:ref[starts-with(@target, '#pg') and substring-after(@target, 'pg_') castable as xs:integer and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert
                test="xs:integer(substring-after(@target, '#pg_')) gt xs:integer(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))"
                >Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"
                    />–<value-of select="@target"/> (see #<value-of
                    select="./ancestor::tei:div[1]/@xml:id"/>
                <value-of select="
                        if (./ancestor::tei:div[1]/@xml:id = 'index') then
                            concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',')
                        else
                            ()"/> and <value-of
                    select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule
            context="tei:ref[starts-with(@target, '#pg') and not(substring-after(@target, 'pg_') castable as xs:integer) and ./preceding-sibling::node()[1] = '–' and ./preceding-sibling::node()[2]/self::tei:ref]">
            <assert
                test="xs:integer(ckbk:roman-to-number(substring-after(@target, '#pg_'))) gt xs:integer(ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_')))"
                >Invalid page range: <value-of select="preceding-sibling::node()[2]/@target"
                    />–<value-of select="@target"/> (<value-of
                    select="ckbk:roman-to-number(substring-after(preceding-sibling::node()[2]/@target, '#pg_'))"
                    />–<value-of select="ckbk:roman-to-number(substring-after(@target, '#pg_'))"/>;
                see #<value-of select="./ancestor::tei:div[1]/@xml:id"/>
                <value-of select="
                        if (./ancestor::tei:div[1]/@xml:id = 'index') then
                            concat(' under ', string-join(subsequence(tokenize(./ancestor::tei:item[1], '\s+'), 1, 2), ' '), ',')
                        else
                            ()"/> and <value-of
                    select="./preceding::tei:pb[1]/@facs"/>.tif).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, 'frus')]">
            <assert test="
                    if (contains(@target, '#') and substring-before(@target, '#') = $vol-ids) then
                        (substring-before(@target, '#') = $vol-ids and (if (doc-available(concat('../volumes/', substring-before(@target, '#'), '.xml'))) then
                            doc(concat('../volumes/', substring-before(@target, '#'), '.xml'))//*/@xml:id = substring-after(@target, '#')
                        else
                            if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#'), '.xml'))) then
                                doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@target, '#'), '.xml'))//*/@xml:id = substring-after(@target, '#')
                            else (: allow this check to pass if you don't have our exact directory structure :)
                                true()))
                    else
                        @target = $vol-ids">ref/@target='<value-of select="@target"/>'
                is an invalid value. No volume's ID and/or target element corresponds to this
                ref/@target value (or, possibly, the volume has not yet been published).</assert>
        </rule>
        <rule context="tei:ref[starts-with(@target, '#')]">
            <assert test="substring-after(@target, '#') = $xml-ids">ref/@target='<value-of
                    select="@target"/>' is an invalid value. No element's @xml:id corresponds to
                this value.</assert>
        </rule>
        <rule context="tei:ref">
            <assert
                test="starts-with(@target, '#') or starts-with(@target, 'http') or starts-with(@target, 'mailto')"
                >Invalid ref/@target='<value-of select="@target"/>'. If this is an internal
                cross-reference, it needs a "#" prefix.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, '#')]">
            <assert test="substring-after(@corresp, '#') = $persName-ids"
                    >persName/@corresp='<value-of select="@corresp"/>' is an invalid value. No
                persName has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:persName[starts-with(@corresp, 'frus')]">
            <assert test="
                    substring-before(@corresp, '#') = $vol-ids and (if (doc-available(concat('../volumes/', substring-before(@corresp, '#'), '.xml'))) then
                        doc(concat('../volumes/', substring-before(@corresp, '#'), '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                    else
                        if (doc-available(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#'), '.xml'))) then
                            doc(concat('../../frus-not-yet-reviewed/volumes/', substring-before(@corresp, '#'), '.xml'))//*/@xml:id = substring-after(@corresp, '#')
                        else
                            false())">persName/@corresp='<value-of select="@corresp"/>'
                is an invalid value. No persName has been defined in that volume with an @xml:id
                corresponding to this value.</assert>
        </rule>
        <rule context="tei:gloss[@target]">
            <assert test="substring-after(@target, '#') = $term-ids">gloss/@target='<value-of
                    select="@target"/>' is an invalid value. No term has been defined with an
                @xml:id corresponding to this value.</assert>
        </rule>
        <rule context="tei:publicationStmt">
            <assert test="tei:idno[@type = 'frus'] = $vol-ids">The frus idno must be a defined
                volume ID</assert>
        </rule>
        <rule context="@xml:id">
            <assert test="
                    if (exists($xml-ids)) then
                        count(index-of($xml-ids, string(.))) eq 1
                    else
                        true()">@xml:id=<value-of select="."/>. Two elements cannot have
                the same xml:id attribute.</assert>
        </rule>
    </pattern>

    <pattern id="image-s3-checks">
        <title>Image Checks</title>
        <rule context="tei:graphic[@url][not(ancestor::tei:titlePage) and not(ancestor::tei:facsimile)]">
            <assert test="concat(@url, '.png') = $available-images">PNG version of '<value-of
                select="@url"/>' not found on static.history.state.gov</assert>
            <assert test="concat(@url, '.tif') = $available-images">TIFF version of '<value-of
                select="@url"/>' not found on static.history.state.gov</assert>
        </rule>
    </pattern>
    
    <pattern id="date-ana-checks">
        <title>Date analysis Pointer Checks</title>
        
        <rule context="tei:date[@ana]">
            <assert test="substring-after(@ana, '#') = $category-ids">date/@ana='<value-of
                    select="@ana"/>' is an invalid value. No category has been defined with an
                @xml:id corresponding to this value.</assert>
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
            <xsl:when test="translate($roman, $valid-roman-chars, '')">NaN</xsl:when>
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
                    <xsl:when
                        test="$roman-num/following-sibling::ckbk:roman = substring($roman, 2, 1)">
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman, 2, $len - 1)"/>
                            <xsl:with-param name="value" select="$value - $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="ckbk:roman-to-number-impl">
                            <xsl:with-param name="roman" select="substring($roman, 2, $len - 1)"/>
                            <xsl:with-param name="value" select="$value + $roman-num/@value"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</schema>

<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3">
    <title>FRUS TEI Rules - Date Rules for Initial Review</title>
    
    <p>This schematron file contains certain rules from dates-only.sch - the rules most relevant to a first pass through a volume for dates.</p>
    
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    
    <let name="category-ids" value="//tei:category/@xml:id"/>
    
    <pattern id="pointer-checks">
        <title>Ref and Pointer Checks</title>
        <rule context="tei:date[@ana]">
            <assert test="substring-after(@ana, '#') = $category-ids">date/@ana='<value-of select="@ana"/>' is an invalid value.  No category has been defined with an @xml:id corresponding to this value.</assert>
        </rule>
    </pattern>
    
    <pattern id="dateline-date-checks">
        <title>Dateline Date Checks</title>
        <rule context="tei:dateline[not(ancestor::frus:attachment)][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert test="exists(.//tei:date)">Please tag "undated" phrase in this document dateline with a &lt;date&gt; element.</assert>
        </rule>
        <rule context="tei:dateline[ancestor::frus:attachment][matches(., 'undated|not\s+dated|not\s+declassified', 'i')]">
            <assert role="warn" test="exists(.//tei:date)">Please tag "undated" phrase in this attachment dateline with a &lt;date&gt; element.</assert>
        </rule>
        <rule context="tei:dateline[not(ancestor::frus:attachment)]">
            <assert test=".//tei:date">Document datelines must contain a date element</assert>
        </rule>
        <rule context="tei:dateline[ancestor::frus:attachment]">
            <assert role="warn" test=".//tei:date">Attachment datelines should contain a date element if this information is present</assert>
        </rule>
        <rule context="tei:date[ancestor::tei:dateline and not(ancestor::frus:attachment)]">
            <assert role="warn" test="normalize-space(.) ne ''">Dateline date should not be empty.</assert>
            <assert test="
                (@from and @to) 
                or 
                (not(@from) and not(@to))
                ">Dateline date @from must have a corresponding @to.</assert>
            <assert test="
                (@notBefore and @notAfter) 
                or 
                (not(@notBefore) and not(@notAfter))
                ">Dateline date @notBefore must have a corresponding @notAfter.</assert>
            <assert role="warn" test="
                (@notBefore and @notAfter and @ana) 
                or 
                (not(@notBefore) and not(@notAfter))
                ">Missing @ana explaining the analysis used to determine @notBefore and @notAfter.</assert>
            <assert test="
                every $date in @when
                satisfies
                (
                    (matches($date, '^\d{4}$') and ($date || '-01-01') castable as xs:date)
                    or
                    (matches($date, '^\d{4}-\d{2}$') and ($date || '-01') castable as xs:date)
                    or
                    $date castable as xs:date
                    or
                    $date castable as xs:dateTime
                )
                ">Dateline date @when values must be YYYY, YYYY-MM, or xs:date or xs:dateTime</assert>
            <assert test="
                every $date in (@from, @to, @notBefore, @notAfter) 
                satisfies 
                (
                    $date castable as xs:date 
                    or 
                    $date castable as xs:dateTime
                )
                ">Dateline date @from/@to/@notBefore/@notAfter must be valid xs:date or xs:dateTime values.</assert>
            <assert test="
                every $attribute in @* 
                satisfies 
                    not(matches($attribute, '[A-Z]$'))
                ">Please use timezone offset instead of military time zone (e.g., replace Z with +00:00).</assert>
            <assert test="if (@from and @to) then (@from le @to) else true()">Dateline date @from must come before @to.</assert>
            <assert test="if (@notBefore and @notAfter) then (@notBefore le @notAfter) else true()">Dateline date @notBefore must come before @notAfter.</assert>
        </rule>
    </pattern>
    
</schema>
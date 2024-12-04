<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs math xd tei" version="3.0">
    
    <xsl:param name="heading" as="xs:boolean" select="true()"/>
    <xsl:param name="documentID" as="xs:string" select="/tei:TEI/@xml:id"/>
    
    <xsl:output indent="true"/>
    
    <xsl:mode on-no-match="shallow-skip" use-accumulators="#all"/>
    <xsl:mode name="html" on-no-match="text-only-copy"/>
    
    <xsl:accumulator name="document-nos" initial-value="()" as="xs:string*">
        <xsl:accumulator-rule match="tei:div[@type = ('document', 'document-pending')]" select="($value, @n)" phase="end"/>
    </xsl:accumulator>
    
    <xsl:accumulator name="document-ids" initial-value="()" as="xs:string*">
        <xsl:accumulator-rule match="tei:div" select="($value, @xml:id)" phase="end"/>
    </xsl:accumulator>
    
    <xsl:template match="tei:TEI">
        <div class="hsg-panel hsg-toc">
            <div class="hsg-panel-heading hsg-toc__header">
                <h4 class="hsg-sidebar-title">Contents</h4>
            </div>
            <nav aria-label="Side navigation">
                <ul class="hsg-toc__chapters">
                    <xsl:apply-templates select="tei:text"/>
                </ul>
            </nav>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:id][not(@type = ('document', 'document-pending'))]">
        <xsl:variable name="accDocs" as="xs:string*" select="accumulator-after('document-nos')"/>
        <xsl:variable name="prevDocs" as="xs:string*" select="accumulator-before('document-nos')"/>
        <xsl:variable name="docs" as="xs:string*" select="if (tei:div[@type = ('document', 'document-pending')]) then $accDocs[not(. = $prevDocs)] else ()"/>
        <xsl:variable name="prevDocIDs" as="xs:string*" select="accumulator-before('document-ids')"/>
        <xsl:variable name="docIDs" as="xs:string*" select="accumulator-after('document-ids')[not(. = $prevDocIDs)]"/>
        <xsl:variable name="child_list" as="element(ul)?">
            <xsl:where-populated>
                <ul class="hsg-toc__chapters__nested">
                    <xsl:apply-templates/>
                </ul>
            </xsl:where-populated>
        </xsl:variable>
        <xsl:variable name="classes" as="xs:string*" select="(                 'hsg-toc__chapters__item',                 'js-accordion'[$child_list]             )"/>
        <li class="{string-join($classes, ' ')}">
            
            <a href="/historicaldocuments/{$documentID}/{@xml:id}" data-template="toc:highlight-current">
            
                <xsl:attribute name="data-template-current-ids" select="string-join(($docIDs), ' ')"/>
                <xsl:apply-templates mode="html" select="tei:head"/>
                <xsl:where-populated>
                    <span>
                        <xsl:value-of
                            select="(' (Document' || 's'[count($docs) gt 1] || ' ' || $docs[1] || '–'[count($docs) gt 1] || $docs[last()][count($docs) gt 1] || ')')[exists($docs)]"
                        />
                    </span>
                </xsl:where-populated>
            </a>
            
            <xsl:sequence select="$child_list"/>
            
        </li>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:id eq 'toc']" priority="2"/>
    
    <xsl:template match="tei:head/tei:note" mode="html"/>
    
    <xsl:template match="tei:lb" mode="html">
        <br/>
    </xsl:template>
    <xsl:template name="main">
        <xsl:result-document
            href="{concat(substring-before(tokenize(base-uri(.), '/')[last()], '.xml'), '-toc.xml')}">
            <xsl:apply-templates />
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
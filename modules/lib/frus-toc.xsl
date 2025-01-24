<xsl:stylesheet exclude-result-prefixes="xs math xd tei" version="3.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param as="xs:boolean" name="heading" select="true()"/>
    <xsl:param as="xs:string" name="documentID" select="/tei:TEI/@xml:id"/>

    <xsl:output indent="true"/>

    <xsl:mode on-no-match="shallow-skip" use-accumulators="#all"/>
    <xsl:mode name="html" on-no-match="text-only-copy"/>

    <xsl:accumulator as="xs:string*" initial-value="()" name="document-nos">
        <xsl:accumulator-rule match="tei:div[@type = ('document', 'document-pending')]" phase="end"
            select="($value, @n)"/>
    </xsl:accumulator>

    <xsl:accumulator as="xs:string*" initial-value="()" name="document-ids">
        <xsl:accumulator-rule match="tei:div" phase="end" select="($value, @xml:id)"/>
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
        <xsl:variable as="xs:string*" name="accDocs" select="accumulator-after('document-nos')"/>
        <xsl:variable as="xs:string*" name="prevDocs" select="accumulator-before('document-nos')"/>
        <xsl:variable as="xs:string*" name="docs" select="
                if (tei:div[@type = ('document', 'document-pending')]) then
                    $accDocs[not(. = $prevDocs)]
                else
                    ()"/>
        <xsl:variable as="xs:string*" name="prevDocIDs" select="accumulator-before('document-ids')"/>
        <xsl:variable as="xs:string*" name="docIDs"
            select="accumulator-after('document-ids')[not(. = $prevDocIDs)]"/>
        <xsl:variable as="element(ul)?" name="child_list">
            <xsl:where-populated>
                <ul class="hsg-toc__chapters__nested">
                    <xsl:apply-templates/>
                </ul>
            </xsl:where-populated>
        </xsl:variable>
        <xsl:variable as="xs:string*" name="classes"
            select="('hsg-toc__chapters__item', 'js-accordion'[$child_list])"/>
        <li class="{string-join($classes, ' ')}">

            <a data-template="toc:highlight-current"
                href="/historicaldocuments/{$documentID}/{@xml:id}">

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
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>

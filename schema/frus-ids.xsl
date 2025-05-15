<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ckbk="http://www.oreilly.com/XSLTCookbook"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Supporting XSLT functions for frus-id-checks processing -->
    
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
</xsl:stylesheet>
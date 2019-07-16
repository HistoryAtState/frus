<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:functx="http://www.functx.com"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:historyatstate="https://history.state.gov/historyatstate">
    <title>FRUS TEI Rules - Date Rules</title>

    <p>This schematron file contains date-related rules from and augmenting frus.sch. This current
        version is geared towards tertiary review of legacy and contemporary volumes, in preparation
        for online publication and indexing.</p>

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="frus" uri="http://history.state.gov/frus/ns/1.0"/>
    <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
    <ns prefix="xi" uri="http://www.w3.org/2001/XInclude"/>
    <ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>
    <ns prefix="functx" uri="http://www.functx.com"/>
    <ns prefix="historyatstate" uri="https://history.state.gov/historyatstate"/>

    <extends href="dates-only-secondary-review.sch"/>

    <pattern id="div-doc-dateTime">
        <title>Div doc-dateTime Checks</title>
        <rule context="tei:div">
            <assert role="warn" test="(@frus:doc-dateTime-min and @frus:doc-dateTime-min)">To be
                ready for publishing and date indexing, all divs should have @frus:doc-dateTime-min
                and @frus:doc-dateTime-max attributes.</assert>
        </rule>
    </pattern>

</schema>

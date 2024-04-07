xquery version "3.1";

(: 

Update FRUS TEI with references to static files

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

:)

declare boundary-space preserve;

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $path external;

let $vol := doc($path)/tei:TEI
let $vol-id := $vol/@xml:id
let $fileDesc := $vol/tei:teiHeader/tei:fileDesc
let $notesStmt := $fileDesc/tei:notesStmt
let $static-files := doc("http://hsg-prod-backend1.hsg:8080/exist/apps/hsg-publish/static-files.xq?vol-id=" || $vol-id)/files/file
return
    if (exists($static-files)) then
        let $relatedItems := 
            for $file in $static-files
            let $basename := $file/basename
            let $resource := $vol/id($basename)
            where $resource instance of element(tei:TEI) or $resource instance of element(tei:div)
            return
                <relatedItem xmlns="http://www.tei-c.org/ns/1.0" corresp="#{$basename}" type="{$file/Q{}extension}">
                    <bibl>
                        <ref target="{$file/Q{}url}"/>
                        <extent>
                            <measure quantity="{$file/Q{}size}" unit="bytes"/>
                        </extent>
                        <date type="publication-date" when="{$file/Q{}last-modified}"/>
                    </bibl>
                </relatedItem>
        let $new-notesStmt :=
            <notesStmt xmlns="http://www.tei-c.org/ns/1.0">
                <note>This publication contains {count($relatedItems) } associated files. For page images, see the facsimile element.</note>
                { $relatedItems }
            </notesStmt>
        return
            if (exists($notesStmt)) then
                replace node $notesStmt with $new-notesStmt
            else
                insert node $new-notesStmt after $fileDesc/tei:publicationStmt
    else
        ()
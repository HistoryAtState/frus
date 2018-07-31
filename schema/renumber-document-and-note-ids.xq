xquery version "3.1";

(: 

Renumbers all @xml:id and @n values of document divs sequentially from 1 and updates note @xml:id values accordingly. 

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0"; 

declare variable $path external;

let $divs := doc($path)//tei:div[@type eq "document"]
for $div at $n in $divs
let $new-div-id := concat("d", $n)
return
    (
        replace value of node $div/@xml:id with $new-div-id
        ,
        replace value of node $div/@n with $n
        ,
        for $note in $div//tei:note[@xml:id and @n]
        let $new-note-id := $new-div-id || "fn" || substring-after($note/@xml:id, "fn")
        return
            replace value of node $note/@xml:id with $new-note-id
    )
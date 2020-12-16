xquery version "3.1";

(: 

Fixes common problems with pb and lb placement and whitespace. 

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Run on a volume repeatedly until no XQuery updates are reported. Perform format & indent between each run.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace frus="http://history.state.gov/frus/ns/1.0";

declare variable $path external;

let $vol := doc($path)
return
    (
        (: 1. strip whitespace preceding footnotes :)
        
        for $note in $vol//tei:note[preceding-sibling::node()[1][. instance of text() and matches(., "\s+$")]][not(@rend eq "inline")][not(preceding-sibling::node()[2] instance of element(tei:note))]
        return
            replace value of node $note/preceding-sibling::text()[1] with replace($note/preceding-sibling::text()[1], "\s+$", "")
        ,

        (: steps 2 and 3 result in a lot of whitespace changes and are lower priority than the other changes. :)

        (: 2. move leading whitespace out of spans :)
        (:
        for $elem in $vol//(tei:hi|tei:seg|tei:date|tei:persName|tei:placeName|tei:ref|tei:signed|tei:affiliation)[preceding-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "\s$")] and node()[1][. instance of text() and matches(., "^\s+")]]
        return
            replace value of node $elem/text()[1] with replace($elem/text()[1], "^\s+", "")
        ,
        for $elem in $vol//(tei:hi|tei:seg|tei:date|tei:persName|tei:placeName|tei:ref|tei:signed|tei:affiliation)[preceding-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "[^\s]$")] and node()[1][. instance of text() and matches(., "^\s+")]]
        return
            (
                insert node text { " " } before $elem,
                replace value of node $elem/text()[1] with replace($elem/text()[1], "^\s+", "")
            )
        ,
        :)


        (: 3. strip leading/trailing whitespace from elements that tend to have mixed content :)
        (:
        for $elem in $vol//(tei:item|tei:cell|tei:p|tei:quote|tei:signed|tei:head|tei:note|tei:opener|tei:hi|tei:seg|tei:date|tei:persName|tei:placeName|tei:ref|tei:signed|tei:affiliation)[node()[1][. instance of text() and normalize-space(.) eq ""]]
        return
            delete node $elem/node()[1]
        ,
        for $elem in $vol//(tei:item|tei:cell|tei:p|tei:quote|tei:signed|tei:head|tei:note|tei:opener|tei:hi|tei:seg|tei:date|tei:persName|tei:placeName|tei:ref|tei:signed|tei:affiliation)[node()[last()][. instance of text() and normalize-space(.) eq ""]]
        return
            delete node $elem/node()[last()]
        ,
        :)  
        
        (: 4. move leading/trailing pb/lb element outside of cell :)
        
        for $cell in $vol//tei:cell[node()[1][. instance of element(tei:pb) or . instance of element(tei:lb)]]
        return
            (
                insert node $cell/node()[1] before $cell/parent::tei:row,
                delete node $cell/node()[1]
            )
        ,
        for $cell in $vol//tei:cell[node()[1][. instance of text() and normalize-space(.) eq ""] and node()[2][. instance of element(tei:pb) or . instance of element(tei:lb)]]
        return
            (
                insert node $cell/node()[2] before $cell/parent::tei:row,
                delete node $cell/node()[1],
                delete node $cell/node()[2]
            )
        ,
        for $cell in $vol//tei:cell[count(node()) gt 1 and node()[last()][. instance of element(tei:pb) or . instance of element(tei:lb)]]
        return
            (
                insert node $cell/node()[last()] after $cell/parent::tei:row,
                delete node $cell/node()[last()]
            )
        ,
        for $cell in $vol//tei:cell[node()[1][. instance of text() and normalize-space(.) ne ""] and count(node()) ge 3 and node()[last()][. instance of text() and normalize-space(.) eq ""] and node()[last() - 1][. instance of element(tei:pb) or . instance of element(tei:lb)]]
        return
            (
                insert node $cell/node()[last() - 1] after $cell/parent::tei:row,
                delete node $cell/node()[last() - 1],
                delete node $cell/node()[last()]
            )
        ,
        for $cell in $vol//tei:cell[count(node()) eq 1 and normalize-space(.) eq ""]
        return
            delete node $cell/node()
        ,
        
        
        (: 5. move leading/trailing pb/lb element outside of block, text-bearing elements :)
        
        (: <p><pb/></p> -> <pb/><p/> :)
        for $elem in $vol//(tei:list|tei:item|tei:quote|tei:p|tei:table|tei:row|frus:attachment|tei:div|tei:head|tei:signed)[node()[1][. instance of element(tei:lb) or . instance of element(tei:pb)]]
        return
            (
                insert node $elem/node()[1] before $elem,
                delete node $elem/node()[1]
            )
        ,
        (: <p> <pb/></p> -> <pb/><p/> :)
        for $elem in $vol//(tei:list|tei:item|tei:quote|tei:p|tei:table|tei:row|frus:attachment|tei:div|tei:head|tei:signed)[node()[1][. instance of text() and normalize-space(.) eq ""] and node()[2][. instance of element(tei:lb) or . instance of element(tei:pb)]]
        return
            (
                insert node $elem/node()[2] before $elem,
                delete node $elem/node()[2]
            )
        ,
        (: <p>hello<pb/></p> -> <p>hello</p><pb/> :)
        for $elem in $vol//(tei:list|tei:item|tei:quote|tei:p|tei:table|tei:row|frus:attachment|tei:div|tei:head|tei:signed)[count(node()) gt 1 and node()[last()][. instance of element(tei:lb) or . instance of element(tei:pb)]]
        return
            (
                insert node $elem/node()[position() eq last()] after $elem,
                delete node $elem/node()[position() eq last()]
            )
        ,
        (: <p>hello<pb/> </p> -> <p>hello</p><pb/> :)
        for $elem in $vol//(tei:list|tei:item|tei:quote|tei:p|tei:table|tei:row|frus:attachment|tei:div|tei:head|tei:signed)[count(node()) gt 2 and node()[last()][. instance of text() and normalize-space(.) eq ""]][node()[position() eq last() - 1][. instance of element(tei:lb) or . instance of element(tei:pb)]]
        return
            (
                insert node $elem/node()[position() eq last() - 1] after $elem,
                delete node $elem/node()[position() eq last() - 1]
            )
        ,
        
        
        (: 6. if there is a space before a pb/lb in a text node, there should be no space afterward :)
        
        for $elem in $vol//(tei:pb|tei:lb)[preceding-sibling::node()[1][normalize-space(.) ne "" and matches(., "\s$")] and following-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "^\s")]]
        return
            replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
        ,
        for $elem in $vol//(tei:pb|tei:lb)[preceding-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "[^\s]$")] and following-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "^\s")]]
        return
            (
                insert node text { " " } before $elem,
                replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
            )
        ,
        for $elem in $vol//(tei:pb|tei:lb)[preceding-sibling::node()[1][. instance of element()] and following-sibling::node()[1][. instance of text() and normalize-space(.) eq "" and matches(., "^\s")]]
        return
            (
                insert node text { " " } before $elem,
                replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
            )

    )
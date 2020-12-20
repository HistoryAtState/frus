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
declare variable $vol := doc($path);

declare variable $notes := $vol//tei:note;
declare variable $cells := $vol//tei:cell;
declare variable $block-elements := 
    $vol//(
        tei:div|tei:head|frus:attachment
        |tei:list|tei:item
        |tei:p|tei:note|tei:quote|tei:hi|tei:seg
        |tei:table|tei:row
        |tei:opener|tei:closer|tei:postscript|tei:signed|tei:affiliation
        |tei:dateline|tei:persName|tei:placeName|tei:date|tei:label|tei:gloss
        (: |tei:titlePage|tei:docImprint|tei:publisher :)
    );
declare variable $pb-lbs := $vol//(tei:pb|tei:lb);

(: 1. strip whitespace preceding footnotes and at start of footnote :)

    (: 1a. <p>hello <note/>.</p> -> <p>hello<note/>.</p>:)
    
        for $note in $notes
            [
                preceding-sibling::node()[1][. instance of text() and matches(., "\s$")]
        
                (: allow whitespace before inline footnotes :)
                and
                not(@rend eq "inline")
                
                (: allow whitespace between consecutive notes :)
                and
                not(
                    preceding-sibling::node()[1][. instance of text() and normalize-space(.) eq ""] 
                    and 
                    preceding-sibling::node()[2] instance of element(tei:note)
                )
                
                (: avoid update conflict with step 6 updates below; allow step 6 to complete first :)
                and
                not(
                    preceding-sibling::node()[1][. instance of text() and matches(., "^\s")] 
                    and 
                    preceding-sibling::node()[2][. instance of element(tei:lb) or . instance of element(tei:pb)] 
                    and 
                    preceding-sibling::node()[3][. instance of text() and matches(., "\s$")]
                )
            ]
        return
            replace value of node $note/preceding-sibling::text()[1] with replace($note/preceding-sibling::text()[1], "\s+$", "")
        ,
    
    (: 1b. <note> hello</note> -> <note>hello</note> :)
    
        for $note in $notes
            [
                node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "^\s")]
            ]
        return
            replace value of node $note/text()[1] with replace($note/text()[1], "^\s+", "")
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

    (: 4a. <row><cell><lb/></cell></row> -> <lb/><row><cell/></row> :)
    
        for $cell in $cells
            [
                node()[1][. instance of element(tei:pb) or . instance of element(tei:lb)]
            ]
        return
            (
                insert node $cell/node()[1] before $cell/parent::tei:row,
                delete node $cell/node()[1]
            )
        ,
    
    (: 4b. <row><cell> <lb/></cell></row> -> <lb/><row><cell/></row> :)
    
        for $cell in $cells
            [
                node()[1][. instance of text() and normalize-space(.) eq ""] 
                and 
                node()[2][. instance of element(tei:pb) or . instance of element(tei:lb)]
            ]
        return
            (
                insert node $cell/node()[2] before $cell/parent::tei:row,
                delete node $cell/node()[1],
                delete node $cell/node()[2]
            )
        ,
    
    (: 4c. <row><cell>hello<lb/></cell></row> -> <row><cell>hello</cell></row><lb/> :)
    
        for $cell in $cells
            [
                count(node()) gt 1 
                and 
                node()[last()][. instance of element(tei:pb) or . instance of element(tei:lb)]
            ]
        return
            (
                insert node $cell/node()[last()] after $cell/parent::tei:row,
                delete node $cell/node()[last()]
            )
        ,
    
    (: 4d. <row><cell>hello<lb/> </cell></row> -> <row><cell>hello</cell></row><lb/> :)
    
        for $cell in $cells
            [
                count(node()) ge 3 
                and 
                node()[1][. instance of text() and normalize-space(.) ne ""] 
                and 
                node()[last()][. instance of text() and normalize-space(.) eq ""]
                and 
                node()[last() - 1][. instance of element(tei:pb) or . instance of element(tei:lb)]
            ]
        return
            (
                insert node $cell/node()[last() - 1] after $cell/parent::tei:row,
                delete node $cell/node()[last() - 1],
                delete node $cell/node()[last()]
            )
        ,
    
    (: 4e. <cell> </cell> -> <cell/> :)
    
        for $cell in $cells
            [
                count(node()) eq 1 
                and 
                normalize-space(.) eq ""
            ]
        return
            delete node $cell/node()
    ,


(: 5. move leading/trailing pb/lb element outside of block, text-bearing elements :)

    (: 5a. <p><pb/>hello</p> -> <pb/><p>hello</p> :)
    
        for $elem in $block-elements
            [
                node()[1][. instance of element(tei:lb) or . instance of element(tei:pb)]
            ]
        return
            (
                insert node $elem/node()[1] before $elem,
                delete node $elem/node()[1]
            )
        ,
    
    (: 5b. <p> <pb/>hello</p> -> <pb/><p> hello</p> :)
    
        for $elem in $block-elements
            [
                node()[1][. instance of text() and normalize-space(.) eq ""] 
                and 
                node()[2][. instance of element(tei:lb) or . instance of element(tei:pb)]
            ]
        return
            (
                insert node $elem/node()[2] before $elem,
                delete node $elem/node()[2]
            )
        ,
    
    (: 5c. <p>hello<pb/></p> -> <p>hello</p><pb/> :)
    
        for $elem in $block-elements
            [
                count(node()) gt 1 
                and 
                node()[last()][. instance of element(tei:lb) or . instance of element(tei:pb)]
            ]
        return
            (
                insert node $elem/node()[last()] after $elem,
                delete node $elem/node()[last()]
            )
        ,
    
    (: 5d. <p>hello<pb/> </p> -> <p>hello</p><pb/> :)
    
        for $elem in $block-elements
            [
                count(node()) gt 2 
                and 
                node()[last() - 1][. instance of element(tei:lb) or . instance of element(tei:pb)]
                and
                node()[last()][. instance of text() and normalize-space(.) eq ""]
            ]
        return
            (
                insert node $elem/node()[last() - 1] after $elem,
                delete node $elem/node()[last() - 1]
            )
        ,


(: 6. spaces can appear before pb/lb, but not after it :)

    (: 6a. <p>hello <pb/> there</p> -> <p>hello <pb/>there</p> :)
    
        for $elem in $pb-lbs
            [
                preceding-sibling::node()[1][normalize-space(.) ne "" and matches(., "\s$")] 
                and 
                following-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "^\s")]
            ]
        return
            replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
        ,
    
    (: 6b. <p>hello<pb/> there</p> -> <p>hello <pb/>there</p> :)
    
        for $elem in $pb-lbs
            [
                preceding-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "[^\s]$")] 
                and 
                following-sibling::node()[1][. instance of text() and normalize-space(.) ne "" and matches(., "^\s")]
            ]
        return
            (
                insert node text { " " } before $elem,
                replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
            )
        ,
    
    (: 6c. <p><hi>hello</hi><pb/> there</p> -> <p><hi>hello</hi> <pb/>there</p> :)
    
        for $elem in $pb-lbs
            [
                preceding-sibling::node()[1][. instance of element()] 
                and 
                following-sibling::node()[1][. instance of text() 
                and 
                normalize-space(.) ne "" and matches(., "^\s")]
            ]
        return
            (
                insert node text { " " } before $elem,
                replace value of node $elem/following-sibling::text()[1] with replace($elem/following-sibling::text()[1], "^\s+", "")
            )
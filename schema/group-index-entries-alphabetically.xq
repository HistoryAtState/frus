xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare copy-namespaces no-preserve, inherit;

declare variable $path external;
declare variable $vol := doc($path);

let $index := $vol/id("index")[count(tei:list) eq 1]/tei:list[@type eq "index"][not(tei:item[1]/node()[normalize-space(.) ne ""][1] instance of element(tei:list))]
where exists($index)
let $new-index := 
    element { node-name($index) } {
        $index/@*,
        text { " " },
        for tumbling window $item in $index/tei:*
        start $s when true()
        end next $n when $n instance of element(tei:item) and not(starts-with(replace(normalize-space($n), "^\W+", ""), substring(replace(normalize-space($s), "^\W+", ""), 1, 1), "http://www.w3.org/2013/collation/UCA?strength=primary"))
        return
            element Q{http://www.tei-c.org/ns/1.0}item {
                attribute n { lower-case(substring(replace(normalize-space($s), "^\W+", ""), 1, 1)) },
                text { " " },
                element Q{http://www.tei-c.org/ns/1.0}list {
                    attribute xml:id { "index-" || lower-case(substring(replace(normalize-space($s), "^\W+", ""), 1, 1)) },
                    text { " " },
                    $item,
                    text { " " }
                },
                text { " " }
            }
    }
return
    replace node $index with $new-index
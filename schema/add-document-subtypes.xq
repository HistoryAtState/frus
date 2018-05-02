xquery version "3.1";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

(: see Walmsley 2nd ed., "Controlling the Copying of Namespace Declarations" p. 174 :)
declare copy-namespaces preserve, inherit;

declare function local:transform($nodes) {
    for $node in $nodes
    return
        typeswitch ($node)
            case element(tei:div)
                return
                    if ($node/@type = 'document' and not($node/@subtype)) then
                        element {$node/node-name()}
                        {
                            $node/@*,
                            attribute subtype {
                                if (matches($node/tei:head, 'Editorial\s+Note|Editor[''’]s\s+Note', 'i')) then
                                    "editorial-note"
                                else
                                    "historical-document"
                            },
                            local:transform($node/node())
                        }
                    else
                        element {$node/node-name()} {$node/@*, local:transform($node/node())}
            case element()
                return
                    element {$node/node-name()} {$node/@*, local:transform($node/node())}
                    (: some contortions to preserve namespaces on the root node; otherwise they're sprinkled throughout :)
            case document-node()
                return
                    let $root := $node/element()
                    return
                        element {node-name($root)}
                        {
                            $root/@*,
                            (: adapted from https://stackoverflow.com/questions/9945706/copying-namespaces-in-xquery :)
                            for $ns-prefix in in-scope-prefixes($root)
                            let $ns-uri := namespace-uri-for-prefix($ns-prefix, $root)
                                where $ns-prefix ne '' and $ns-uri ne ''
                            return
                                namespace {$ns-prefix} {$ns-uri},
                            local:transform($root/node())
                        }
            default
                return
                    $node
};

(: this query expects a "doc-path" parameter from oXygen :)
declare variable $doc-path as xs:string external;

let $doc := doc($doc-path)
return
    local:transform($doc)
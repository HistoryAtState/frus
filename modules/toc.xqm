xquery version "3.0";

(:~
 : Template functions to render table of contents.
 :)
module namespace toc="http://history.state.gov/ns/site/frus/toc";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare function toc:generate-frus-tocs() {
    for $volume in collection('/db/apps/frus/volumes')
        let $href := document-uri($volume)
        return toc:generate-frus-toc($href)
};

declare function toc:generate-frus-toc($href as xs:string) {
    let $xsl-url := doc('/db/apps/frus/modules/lib/frus-toc.xsl')
    let $volume := doc($href)
    let $toc-name := $volume/tei:TEI/@xml:id || '-toc.xml'
    let $toc := transform:transform(
        $volume,
        $xsl-url,
        ()
    )
    return xmldb:store('/db/apps/frus/frus-toc', $toc-name, $toc, 'application/xml')
    
};

declare function toc:prepare-collection() {
    if (xmldb:collection-available('/db/apps/frus/frus-toc')) 
    then ()
    else (xmldb:create-collection('/db/apps/frus', 'frus-toc'))    
};

declare function toc:regenerate() {
    toc:prepare-collection(),
    toc:generate-frus-tocs()
}; 
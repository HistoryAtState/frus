xquery version "3.1";

(: 

Fixes common problems with signatures in FRUS. 

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Run on a volume. Perform format & indent between each run.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace frus = "http://history.state.gov/frus/ns/1.0";

declare variable $path external;
declare variable $vol := doc($path);


(: reconstruct a node with computed element constructor to avoid saxon inserting unwanted namespace declarations :)
declare function local:reconstruct-node($nodes as node()*) {
    for $node in $nodes
    return
        typeswitch ($node) 
            case element() return element { node-name($node) } { $node/@*, local:reconstruct-node($node/node()) }
            default return $node
};

(: 1. Insert signed elements in closers where none exist.

before:
    
    <closer>
        <persName>
            <hi rend="smallcaps">Inman, Akers and Inman</hi>
        </persName>
    </closer>

after:

    <closer>
        <signed>
            <persName>
                <hi rend="smallcaps">Inman, Akers and Inman</hi>
            </persName>
        </signed>
    </closer>

:)

for $closer in $vol//tei:closer[.//tei:persName and not(child::tei:signed)]
return
    replace node $closer with
        element
            { QName("http://www.tei-c.org/ns/1.0", "closer") }
            {
                element
                    { QName("http://www.tei-c.org/ns/1.0", "signed") }
                    {
                        $closer/@*,
                        local:reconstruct-node($closer/node())
                    }
            }
,


(: 2. empty persName elements in signed elements where none exist

before:

    <signed rend="left">
        <hi rend="strong">Adam M. Howard, Ph.D.</hi>
        <lb/>
        <hi rend="italic">General Editor</hi>
    </signed>
    
after:

    <signed rend="left">
        <persName><hi rend="strong">Adam M. Howard, Ph.D.</hi></persName>
        <lb/>
        <hi rend="italic">General Editor</hi>
    </signed>

:)

for $signed in $vol//tei:closer//tei:signed[not(descendant::tei:persName)]
    
return
    replace node $signed
        with
        element
        {QName("http://www.tei-c.org/ns/1.0", "signed")}
        {
            element
            { QName("http://www.tei-c.org/ns/1.0", "persName") }
            {
                $signed/@*,
                local:reconstruct-node($signed/node())
            }
        }

,(: 2. empty persName elements in signed elements where none exist

before:

    <signed rend="left">
        <hi rend="strong">Adam M. Howard, Ph.D.</hi>
        <lb/>
        <hi rend="italic">General Editor</hi>
    </signed>
    
after:

    <signed rend="left">
        <persName><hi rend="strong">Adam M. Howard, Ph.D.</hi></persName>
        <lb/>
        <hi rend="italic">General Editor</hi>
    </signed>

:)

for $hi in $vol//tei:signed//tei:hi[@rend="strong"][not(parent::tei:persName)]
return
    replace node $hi with
        element
            { QName("http://www.tei-c.org/ns/1.0", "persName") }
            {
                local:reconstruct-node($hi)
            }

,

(: 3. Fix missing hi/@rend="strong" on signatures :)

(: 

find signatures with persNames lacking hi:

    <signed>
        <persName corresp="#p_HAA_1">Hartman</persName>
    </signed>

and insert hi into the persName, making this into:

    <signed>
        <persName corresp="#p_HAA_1">
            <hi rend="strong">Hartman</hi>
        </persName>
    </signed>

:)
for $persName in $vol//tei:signed/tei:persName[not(tei:hi)]
return
    replace node $persName with
        element
            { QName("http://www.tei-c.org/ns/1.0", "persName") }
            {
                $persName/@*,
                element
                    { QName("http://www.tei-c.org/ns/1.0", "hi") }
                    {
                        attribute rend {"strong"},
                        local:reconstruct-node($persName/node())
                    }
            }

,

(: 4. Delete @corresp from signed elements 

before:

<closer>
    <signed corresp="#p_RRW_1">
        <persName corresp="#p_RRW_1">
            <hi rend="strong">Ronald Reagan</hi>
        </persName>
    </signed>
</closer>

after:

<closer>
    <signed>
        <persName corresp="#p_RRW_1">
            <hi rend="strong">Ronald Reagan</hi>
        </persName>
    </signed>
</closer>

:)

for $signed in $vol//tei:signed[@corresp][tei:persName/@corresp]
return
    delete node $signed/@corresp

,


(: 5. Delete affiliation from closers and keep italicized content

before:

    <signed rend="left">
        <persName><hi rend="strong">Adam M. Howard, Ph.D.</hi></persName>
        <lb/>
        <affiliation>
            <hi rend="italic">General Editor</hi>
        </affiliation>
    </signed>

after:

    <signed rend="left">
        <persName><hi rend="strong">Adam M. Howard, Ph.D.</hi></persName>
        <lb/>
        <hi rend="italic">General Editor</hi>
    </signed>

:)

for $affiliation in $vol//tei:signed/tei:affiliation
return
    replace node $affiliation with
        local:reconstruct-node($affiliation/node())
        

(: 6. Insert <lb/> and hi rend="italic" for post-persName content  :)

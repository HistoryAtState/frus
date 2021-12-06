xquery version "3.1";

(: 

Fixes common problems with signatures in FRUS. 

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Run on a volume. Perform format & indent between each run.

Do not commit the automatically generated .bak file to git.

:)

declare copy-namespaces no-preserve, inherit;

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace frus = "http://history.state.gov/frus/ns/1.0";

declare variable $path external;
declare variable $vol := doc($path);
declare variable $debug := false();


(: 1. Fix closer lacking child signed

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

for $closer in $vol//tei:closer[not(tei:signed) and .//tei:persName[not(ancestor::tei:note)]]
return
    replace node $closer with
        element
            { QName("http://www.tei-c.org/ns/1.0", "closer") }
            {
                if ($debug) then attribute ana { "rule-1" } else (),
                $closer/@*,
                element
                    { QName("http://www.tei-c.org/ns/1.0", "signed") }
                    { 
                        $closer/node() 
                    }
            }
,

(: 1b. Fix signed lacking child persName

before:
    
    <closer>
        <signed>Steve<note n="4" xml:id="d123fn4">
            <persName corresp="#p_OSA_1">Oxman</persName> signed his initials
            over his typed signature.</note>
        </signed>
    </closer>

after:

    <closer>
        <signed>
            <persName>Steve</persName><note n="4" xml:id="d123fn4">
                <persName corresp="#p_OSA_1">Oxman</persName> signed his initials
                over his typed signature.</note>
        </signed>
    </closer>

:)

for $text in $vol//tei:signed[not(tei:persName)]/node()[normalize-space(.) ne ""][1][. instance of text()]
return
    replace node $text with
        element
            { QName("http://www.tei-c.org/ns/1.0", "persName") }
            {
                if ($debug) then attribute ana { "rule-1b" } else (),
                $text
            }

,

(: 2. Fix hi/@rend="strong" lacking outer persName

before:

    <signed rend="left">
        <hi rend="strong">Adam M. Howard, Ph.D.</hi>
    </signed>
    
after:

    <signed rend="left">
        <persName>
            <hi rend="strong">Adam M. Howard, Ph.D.</hi>
        </persName>
    </signed>

:)

for $hi in $vol//tei:signed//tei:hi[@rend="strong"][not(parent::tei:persName)]
return
    replace node $hi with
        (
            element
                { QName("http://www.tei-c.org/ns/1.0", "persName") }
                { 
                    if ($debug) then attribute ana { "rule-2" } else (),
                    text { " " },
                    $hi,
                    text { " " }
                }
        )

,

(: 3. Fix persName lacking inner hi/@rend="strong"

before:

    <signed>
        <persName corresp="#p_HAA_1">Hartman</persName>
    </signed>

after:

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
                if ($debug) then attribute ana { "rule-3" } else (),
                $persName/@*,
                text { " " },
                element
                    { QName("http://www.tei-c.org/ns/1.0", "hi") }
                    {
                        attribute rend {"strong"},
                        $persName/node()
                    },
                text { " " }
            }

,

(: 4. Delete @corresp from signed if child persName has the same @corresp

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

for $signed in $vol//tei:signed[@corresp = tei:persName/@corresp]
return
    delete node $signed/@corresp

,


(: 5. Delete affiliation from signed, keeping the child nodes

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
        if ($debug) then 
            element 
                { QName("http://www.tei-c.org/ns/1.0", "seg") }
                { 
                    attribute ana { "rule-5" },
                    $affiliation/node()
                }
        else 
            $affiliation/node()

(: 6. Insert <lb/> and hi rend="italic" for post-persName content 

TODO

:)

xquery version "3.1";

(: 

Fixes common problems with signatures in FRUS. 

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Run on a volume. Perform format & indent between each run.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace frus="http://history.state.gov/frus/ns/1.0";

declare variable $path external;
declare variable $vol := doc($path);

(: 1. Fix missing hi/@rend="strong" on signatures :)

(: 

find signatures with persNames lacking hi:

    <signed>
        <persName corresp="#p_HAA_1">Hartman</persName>
    </signed>

and insert hi into the persName, making this into:

    <signed>
        <persName corresp="#p_HAA_1"><hi rend="strong">Hartman</hi></persName>
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
                        attribute rend { "strong" },
                        $persName/string()
                    }
            }

,

(: 2. Delete @corresp from signed elements :)

for $signed in $vol//tei:signed[@corresp][tei:persName/@corresp]
return
    delete node $signed/@corresp
    
 
(: 3. Insert signed elements in closers where none exist. empty persName elements in signed elements where none exist

//tei:signed[tei:persName] 

:)

(: 4. Delete affiliation from signed elements  :)

(: 5. Insert <lb/>  :)

(: 6. Insert hi rend="italic" for affiliation type content  :)

(: 7. empty persName elements in signed elements where none exist :)

 

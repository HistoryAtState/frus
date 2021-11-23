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



(: 1. Insert signed elements in closers where none exist.

<closer>
    <persName>
        <hi rend="smallcaps">Inman, Akers and Inman</hi>
    </persName>
</closer>

:)



(: for $closer in $vol//tei:closer//tei:persName[not(ancestor::tei:signed)]
let $signed := $signed

return
    insert node $signed as first into $closer :)



for $closer in $vol//tei:closer[.//tei:persName and not(child::tei:signed)]


return
    replace node $closer
        with
        element
        {QName("http://www.tei-c.org/ns/1.0", "closer")}
        {
            $closer/
            element
            {QName("http://www.tei-c.org/ns/1.0", "signed")}
            {
                
                $closer/node()
            }
        }



,


(: 2. empty persName elements in signed elements where none exist


<closer>
  <signed>Cutler</signed>
</closer>
                        
:)

for $signed in $vol//tei:closer//tei:signed[not(descendant::tei:persName)]

return
    replace node $signed
        with
        element
        {QName("http://www.tei-c.org/ns/1.0", "signed")}
        {
            $signed/
            element
            {QName("http://www.tei-c.org/ns/1.0", "persName")}
            {
                
                $signed/node()
            }
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
        <persName corresp="#p_HAA_1"><hi rend="strong">Hartman</hi></persName>
    </signed>

:)
for $persName in $vol//tei:signed/tei:persName[not(tei:hi)]
return
    replace node $persName
        with
        element
        {QName("http://www.tei-c.org/ns/1.0", "persName")}
        {
            $persName/@*,
            element
            {QName("http://www.tei-c.org/ns/1.0", "hi")}
            {
                attribute rend {"strong"},
                $persName/node()
            }
        }

,

(: 4. Delete @corresp from signed elements :)

for $signed in $vol//tei:signed[@corresp][tei:persName/@corresp]
return
    delete node $signed/@corresp

,
(: 5. Delete affiliation from closers and keep italicized content :)

for $affiliation in $vol//tei:closer//tei:signed//tei:affiliation[not(child::tei:hi)]


return
    replace node $affiliation
        with
        element
        {QName("http://www.tei-c.org/ns/1.0", "hi")}
        {
            
            attribute rend {"italic"}
        
        }
        
        
        
        
        (: 6. Insert <lb/> and hi rend="italic" for post-persName content  :)

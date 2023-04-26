xquery version "3.1";

(: 

Create a new facsimile element or update an existing one

This is designed to be run from an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace frus="http://history.state.gov/frus/ns/1.0";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace IFD0="http://ns.exiftool.org/EXIF/IFD0/1.0/";
declare namespace PNG="http://ns.exiftool.org/PNG/PNG/1.0/";

declare variable $path external;
declare variable $vol := doc($path)/tei:TEI;
declare variable $vol-id := $vol/@xml:id;

let $path-to-exifs := "https://static.history.state.gov/frus/" || $vol-id || "/exif.xml"
return
    if (doc-available($path-to-exifs)) then
        let $exifs := doc($path-to-exifs)//rdf:Description
        let $pbs := $vol//tei:pb 
        let $surfaces := 
            for $pb in $pbs
            let $facs := $pb/@facs
            let $tiff := $exifs[@rdf:about eq "tiff/" || $facs || ".tif"]
            let $tiff-width := $tiff/IFD0:ImageWidth
            let $tiff-height := $tiff/IFD0:ImageHeight
            let $png := $exifs[@rdf:about eq "medium/" || $facs || ".png"]
            let $png-width := $png/PNG:ImageWidth
            let $png-height := $png/PNG:ImageHeight
            return
                <surface xmlns="http://www.tei-c.org/ns/1.0" start="#{$pb/@xml:id}">
                    {
                        if (exists($tiff)) then
                            <graphic url="{ ``[https://static.history.state.gov/frus/`{ $vol-id }`/tiff/`{ $facs }`.tif]`` }" mimeType="image/tiff" width="{ $tiff-width }px" height="{ $tiff-height }px"/>
                        else
                            (),
                        if (exists($png)) then
                            <graphic url="{ ``[https://static.history.state.gov/frus/`{ $vol-id }`/medium/`{ $facs }`.png]`` }" mimeType="image/png" width="{ $png-width }px" height="{ $png-height }px"/>
                        else
                            ()
                    }
                </surface>
        let $facsimile :=
            <facsimile xmlns="http://www.tei-c.org/ns/1.0">
                { $surfaces }
            </facsimile>
        return
            if ($vol/tei:facsimile) then
                replace node $vol/tei:facsimile with $facsimile
            else
                insert node $facsimile after $vol/tei:teiHeader
    else
        ()
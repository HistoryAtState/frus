xquery version "3.1";

(: 

Trims extra linebreaks from XML files. 

This is designed to be run as an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

Before running this transformation, perform format & indent and save the file first.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace frus="http://history.state.gov/frus/ns/1.0";

declare variable $path external;

let $vol := doc($path)
return
    (
        (: 1. delete extra whitespace :)
        
        for $text in $vol//text()[matches(., "\n{2,}")]
        return
            replace value of node $text with string-join(
                for $seg in analyze-string($text, "\n{2,}")/*
                return
                    if ($seg instance of element(fn:match)) then
                        "&#10;"
                    else
                        $seg
            )
    )
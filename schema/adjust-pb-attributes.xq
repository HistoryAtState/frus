xquery version "3.1";

(: 

Adjust page attributes - numbering, image basenames, etc.

This is designed *to be customized* and run as an oXygen Transformation Scenario, with saxon-configuration.xml enabled.

After running this transformation, perform format & indent and save the file.

Do not commit the automatically generated .bak file to git.

:)

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace frus="http://history.state.gov/frus/ns/1.0";

declare variable $path external;

declare function local:adjust-facs($current-value as xs:integer, $amount as xs:integer) {
    let $new-value := $current-value + $amount
    return
        $new-value => format-integer("0000")
};

let $vol := doc($path)

(: customize the selection criteria :)
for $pb at $incr in $vol//tei:pb[@facs le "0025"]

(: supply the value you want to increase or decrease the selected attributes by :)
let $amount-to-adjust := -1

let $new-value := local:adjust-facs($pb/@facs cast as xs:integer, $amount-to-adjust)
return
    replace value of node $pb/@facs with $new-value

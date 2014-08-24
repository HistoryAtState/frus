Foreign Relations of the United States
======================================

The *Foreign Relations of the United States* (FRUS) series presents the official documentary historical 
record of major U.S. foreign policy decisions and significant diplomatic activity.  The series is published
in print and online editions at the U.S. Department of State [Office of the Historian](http://history.state.gov/) 
website.  

In keeping with the spirit of the
[Digital Government Strategy's goals](http://www.whitehouse.gov/sites/default/files/omb/egov/digital-government/digital-government.html)
to provide the public with access to high-quality digital government information and services 
and help unlock the power of government data to spur innovation, the Office of the Historian 
is releasing the digital master source files for [the online edition of the *Foreign Relations* series](http://history.state.gov/historicaldocuments).  

Organization and Format
-----------------------
The digital master source files for the *Foreign Relations* series have been prepared according to the 
[Text Encoding Initiative](http://www.tei-c.org/) (TEI) P5 Guidelines.  Our project-specific encoding guidelines and
conformance requirements can be found in the `schema` directory, where we have supplied a 
TEI [ODD](http://www.tei-c.org/Guidelines/Customization/odds.xml) file, as well as schematron file used for additional conformance checks.  The volumes are stored in the `volumes` directory, one file per volume.

Locating the Source for a URL from history.state.gov
----------------------------------------------------
URLs for FRUS on history.state.gov all follow this pattern:

  `http://history.state.gov/historicaldocuments/{VOLUME_ID}/{ELEMENT_ID}`

* where `{VOLUME_ID}` is the volume identifier and corresponds to the base name of the files in the `volumes` directory. 
* and `{ELEMENT_ID}` is the identifier for an element within the volume's XML file and corresponds to the value of an `@xml:id` attribute on a TEI element, e.g., `<div xml:id="ch1" type="chapter">`.  

Volume identifiers generally follow this convention:

* `frus`
* + `{SUBSERIES}`
* + `{VOLUME_NUMBER}`
* + `{PART_NUMBER}`

For example, `frus1969-76v19p1` is Volume XIX, Part 1 of the Nixon-Ford subseries (1969–76). 

Element identifiers generally fall into one of these types:

* `ch{NUMBER}` or `comp{NUMBER}`: a chapter or compilation number
* `d{NUMBER}`: a document number
* `d{NUMBER}fn{NUMBER}`: a footnote within a document
* `{NAME}`: a section title, e.g., Preface

For example, if you want to locate the source for `http://history.state.gov/historicaldocuments/frus1969-76v24/d176`, you should locate `frus1969-76v24.xml` in the `volumes` directory and search for a TEI element whose `@xml:id` attribute value is `d176`.  You can safely assume that `d176` is the `<div>` for Document 176 of this volume.

Not all information found at a given URL from history.state.gov necessarily comes from the element identifier in the URL. For example, in this [Document 176](http://history.state.gov/historicaldocuments/frus1969-76v24/d176), the left sidebar contains a table of contents for the entire volume (derived from the compilationa and chapter `<div>` elements), and the right sidebar contains a listing of the people and terms & abbreviations used in the document (derived from the `persons` and `terms` glossaries in the front matter).

Release Schedule
----------------
We plan to release updates to this repository on a quarterly basis. Releases will include fixes to already published volumes, new publications, and digitized legacy volumes.  

Feedback
--------
We welcome your feedback about this repository and how we can improve it.  Please submit an issue or email us
at history@state.gov.

License
-------
The files in this repository are in the public domain and may be copied and distributed without permission. For 
more information, see http://www.state.gov/misc/87529.htm#copyright.

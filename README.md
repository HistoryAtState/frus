# Foreign Relations of the United States

[![exist-db CI](https://github.com/HistoryAtState/frus/actions/workflows/build.yml/badge.svg)](https://github.com/HistoryAtState/frus/actions/workflows/build.yml)

The *Foreign Relations of the United States* (FRUS) series presents the official documentary historical
record of major U.S. foreign policy decisions and significant diplomatic activity.  The series is published
in print and online editions at the U.S. Department of State [Office of the Historian](https://history.state.gov/)
website.  

In keeping with the spirit of the
[Digital Government Strategy's goals](https://www.cio.gov/fed-it-topics/modernization/digital-strategy/)
to provide the public with access to high-quality digital government information and services
and help unlock the power of government data to spur innovation, the Office of the Historian
is releasing the digital master source files for [the online edition of the *Foreign Relations* series](https://history.state.gov/historicaldocuments).  

## Organization and Format

The digital master source files for the *Foreign Relations* series have been prepared according to the
[Text Encoding Initiative](http://www.tei-c.org/) (TEI) P5 Guidelines.  Our project-specific encoding guidelines and
conformance requirements can be found in the `schema` directory, where we have supplied a
TEI [ODD](http://www.tei-c.org/Guidelines/Customization/odds.xml) file, `frus.odd`, as well as Schematron
and RelaxNG files used for additional conformance checks (see especially `frus.sch`, as `frus.rng` is generated from
`frus.odd`).  The volumes are stored in the `volumes` directory, one file per volume.

## Locating the Source for a URL from history.state.gov

URLs for FRUS on history.state.gov all follow this pattern:

  `https://history.state.gov/historicaldocuments/{VOLUME_ID}/{ELEMENT_ID}`

* where `{VOLUME_ID}` is the volume identifier and corresponds to the base name of the files in the `volumes` directory.
* and `{ELEMENT_ID}` is the identifier for an element within the volume's XML file and corresponds to the value of an `@xml:id` attribute on a TEI element, e.g., `<div xml:id="ch1" type="chapter">`.  

Volume identifiers generally follow this hierarchical convention:

* `frus`
* + `{SUBSERIES}`
* + `{VOLUME_NUMBER}`
* + `{PART_NUMBER}`

For example, `frus1969-76v19p1` is Volume XIX, Part 1 of the Nixon-Ford subseries (1969–76), within the *Foreign Relations* series.

Element identifiers generally fall into one of these types:

* `ch{NUMBER}` or `comp{NUMBER}`: a chapter or compilation number
* `d{NUMBER}`: a document number
* `d{NUMBER}fn{NUMBER}`: a footnote within a document
* `p_{PERSON_ID}` or `t_{TERM_ID}`: an entry for a person or term in the List of Persons or List of Terms & Abbreviations
* `{SECTION_ID}`: a section title, e.g., `preface` corresponds to the Preface

For example, to locate the source data for `https://history.state.gov/historicaldocuments/frus1969-76v24/d176`, you should locate `frus1969-76v24.xml` in the `volumes` directory and search for a TEI element whose `@xml:id` attribute value is `d176`.  You can safely assume that `d176` is the `<div>` for Document 176 of this volume.

Not all information found at a given URL from history.state.gov necessarily comes from the element identifier in the URL. For example, in this [Document 176](https://history.state.gov/historicaldocuments/frus1969-76v24/d176), the left sidebar contains a table of contents for the entire volume (derived from the compilation and chapter `<div>` elements), and the right sidebar contains a listing of the people and terms & abbreviations used in the document (derived from the `persons` and `terms` glossaries in the front matter).

## Canonical Identifiers

Once a volume has been released on history.state.gov and the HistoryAtState GitHub repository, the
following identifiers are considered canonical and will not be altered:

* Volume identifiers found in volume filenames and in the `@xml:id` attribute of each volume's root `<TEI>` element
* Document identifiers found in the `@xml:id` attribute of each FRUS document's TEI `<div>` element

Very rarely, after we have digitized and released a volume in which documents were originally
printed without document numbers, we may discover a problem in the way a document's boundary was encoded.
To correct the boundary while respecting this policy, our practice is as follows:

* Case 1: Document "d1" is discovered to contain 2 documents. Solution: The 2nd document is assigned a
document identifier "d1a". No other documents' identifiers are altered.
* Case 2: Document "d2" is discovered to belong to document "d1". Solution: The "d2" content is moved
to "d1", but the "d2" div is not deleted; instead, placeholder text is supplied explaining what happened.
An errata statement is appended to the volume too.

If any changes to document identifiers are made in the future, it will be to enhance their global uniqueness, e.g., to prepend the volume identifier to the document identifier, `frus1969-76v18_d1`. Any such changes will be announced via GitHub issue.

Other identifiers, such as person, and term identifiers (on `<persName>`, and `<term>` elements), are not yet
considered canonical and are subject to alteration. At present, these identifiers are useful only for
single-volume reference purposes. The Office plans to consolidate these per-volume identifiers into
series-wide resources to aid in research and analysis.

Similarly, page break identifiers (on `<pb>` elements) are not considered canonical and will be corrected
if errors are found.

## Release Schedule

Updates to this repository are posted as soon as they are posted to history.state.gov. Releases will
include fixes to already published volumes, new publications, and digitized legacy volumes.

### Versioning and Testing

Releases for this data package are automated. Any commit to the `master` branch will trigger the release automation. For this automation to work, all commit message must conform to [Conventional Commit Messages](https://www.conventionalcommits.org/en/v1.0.0/) to determine semantic versioning of releases, please adhere to these conventions, like so:

| Commit message  | Release type |
|-----------------|--------------|
| `fix(pencil): stop graphite breaking when too much pressure applied` | Patch Release |
| `feat(pencil): add 'graphiteWidth' option` | ~~Minor~~ Feature Release |
| `perf(pencil): remove graphiteWidth option`<br/><br/>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br/>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release |

When opening PRs commit messages are checked using commitlint.

Tables of Contents inside `frus-toc` and helper files for caching inside `.last-modified` are automatically generated on CI during pull requests only. Should there be a need, the effective commands can be found in the workflow files. 

Pull requests from external forks must enable the `allow edits by maintainers` flag when opening pull request. The presence of the flag is checked in `pr-dispatch.yml` . 

## Feedback

We welcome your feedback about this repository and how we can improve it.  Please submit an issue or email us
at <history@state.gov>.

## License

The files in this repository are in the public domain and may be copied and distributed without permission. For
more information, see <https://www.state.gov/copyright-information/#copyright>.

## Build

1. Table of contents are generated on CI automatically and committed to this repo, to create them locally run:

    ```shell
    saxon -s:volumes/ -xsl:modules/lib/frus-toc.xsl -o:frus-toc/ -it:main
    ```

2. Single `xar` file: The `collection.xconf` will only contain the index, not any triggers!

    ```shell
    ant -Dapp.version=0.0.0-SNAPSHOT
    ```

    During a release the property `-Drelease=true` must be set for proper processing of template files.

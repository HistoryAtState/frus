<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:frus="http://history.state.gov/frus/ns/1.0"
    xmlns:functx="http://www.functx.com" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="3.0">

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Add secretarial tenure `keywords[attribute::scheme eq 'https://history.state.gov/tags/secretaries-of-state']` -->
    <xsl:template
        match="tei:textClass[not(tei:keywords[attribute::scheme eq 'https://history.state.gov/tags/secretaries-of-state'])]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>


            <xsl:element name="keywords" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="scheme"
                    >https://history.state.gov/tags/secretaries-of-state</xsl:attribute>

                <!-- 24 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'seward-william-henry')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-024</xsl:attribute>United States.
                        Department of State. Secretary (1861-1869 : Seward, William
                        Henry)</xsl:element>
                </xsl:if>

                <!-- 25 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'washburne-elihu-benjamin')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-025</xsl:attribute>United States.
                        Department of State. Secretary (1869-1869 : Washburne, Elihu
                        Benjamin)</xsl:element>
                </xsl:if>

                <!-- 26 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'fish-hamilton')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-026</xsl:attribute>United States.
                        Department of State. Secretary (1869-1877 : Fish, Hamilton)</xsl:element>
                </xsl:if>

                <!-- 27 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'evarts-william-maxwell')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-027</xsl:attribute>United States.
                        Department of State. Secretary (1877-1881 : Evarts, William
                        Maxwell)</xsl:element>
                </xsl:if>

                <!-- 28 -->
                <xsl:if
                    test=".//tei:term[matches(attribute::xml:id, 'blaine-james-gillespie-1881')]">

                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-028</xsl:attribute>United States.
                        Department of State. Secretary (1881 : Blaine, James
                        Gillespie)</xsl:element>
                </xsl:if>

                <!-- 29 -->
                <xsl:if
                    test=".//tei:term[matches(attribute::xml:id, 'frelinghuysen-frederick-theodore')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-029</xsl:attribute>United States.
                        Department of State. Secretary (1881-1885 : Frelinghuysen, Frederick
                        Theodore)</xsl:element>
                </xsl:if>

                <!-- 30 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'bayard-thomas-francis')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-030</xsl:attribute>United States.
                        Department of State. Secretary (1885-1889 : Bayard, Thomas
                        Francis)</xsl:element>
                </xsl:if>

                <!-- 31 -->
                <xsl:if
                    test=".//tei:term[matches(attribute::xml:id, 'blaine-james-gillespie-1889-1892')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-031</xsl:attribute>United States.
                        Department of State. Secretary (1889-1892 : Blaine, James
                        Gillespie)</xsl:element>
                </xsl:if>

                <!-- 32 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'foster-john-watson')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-032</xsl:attribute>United States.
                        Department of State. Secretary (1892-1893 : Foster, John
                        Watson)</xsl:element>
                </xsl:if>

                <!-- 33 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'gresham-walter-quintin')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-033</xsl:attribute>United States.
                        Department of State. Secretary (1893-1895 : Gresham, Walter
                        Quintin)</xsl:element>
                </xsl:if>

                <!-- 34 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'olney-richard')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-034</xsl:attribute>United States.
                        Department of State. Secretary (1895-1897 : Olney, Richard)</xsl:element>
                </xsl:if>

                <!-- 35 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'sherman-john')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-035</xsl:attribute>United States.
                        Department of State. Secretary (1897-1898 : Sherman, John)</xsl:element>
                </xsl:if>

                <!-- 36 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'day-william-rufus')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-036</xsl:attribute>United States.
                        Department of State. Secretary (1898-1898 : Day, William
                        Rufus)</xsl:element>
                </xsl:if>

                <!-- 37 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'hay-john-milton')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-037</xsl:attribute>United States.
                        Department of State. Secretary (1898-1905 : Hay, John Milton)</xsl:element>
                </xsl:if>

                <!-- 38 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'root-elihu')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-038</xsl:attribute>United States.
                        Department of State. Secretary (1905-1909 : Elihu, Robert)</xsl:element>
                </xsl:if>

                <!-- 39 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'bacon-robert')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-039</xsl:attribute>United States.
                        Department of State. Secretary (1909-1909 : Bacon, Robert)</xsl:element>
                </xsl:if>

                <!-- 40 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'knox-philander-chase')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-040</xsl:attribute>United States.
                        Department of State. Secretary (1909-1913 : Knox, Philander
                        Chase)</xsl:element>
                </xsl:if>

                <!-- 41 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'bryan-william-jennings')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-041</xsl:attribute>United States.
                        Department of State. Secretary (1913-1915 : Bryan, William
                        Jennings)</xsl:element>
                </xsl:if>

                <!-- 42 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'lansing-robert')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-042</xsl:attribute>United States.
                        Department of State. Secretary (1915-1920 : Lansing, Robert)</xsl:element>
                </xsl:if>

                <!-- 43 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'colby-bainbridge')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-043</xsl:attribute>United States.
                        Department of State. Secretary (1920-1921 : Colby, Bainbridge)</xsl:element>
                </xsl:if>

                <!-- 44 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'hughes-charles-evans')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-044</xsl:attribute>United States.
                        Department of State. Secretary (1921-1925 : Hughes, Charles
                        Evans)</xsl:element>
                </xsl:if>

                <!-- 45 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'kellogg-frank-billings')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-045</xsl:attribute>United States.
                        Department of State. Secretary (1925-1929 : Kellogg, Frank
                        Billings)</xsl:element>
                </xsl:if>

                <!-- 46 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'stimson-henry-lewis')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-046</xsl:attribute>United States.
                        Department of State. Secretary (1929-1933 : Stimson, Henry
                        Lewis)</xsl:element>
                </xsl:if>

                <!-- 47 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'hull-cordell')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-047</xsl:attribute>United States.
                        Department of State. Secretary (1933-1944 : Hull, Cordell)</xsl:element>
                </xsl:if>

                <!-- 48 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'stettinius-edward-reilly')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-048</xsl:attribute>United States.
                        Department of State. Secretary (1944-1945 : Stettinius, Edward Reilly,
                        Jr.)</xsl:element>
                </xsl:if>

                <!-- 49 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'byrnes-james-francis')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-049</xsl:attribute>United States.
                        Department of State. Secretary (1945-1947 : Byrnes, James
                        Francis)</xsl:element>
                </xsl:if>

                <!-- 50 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'marshall-george-catlett')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-050</xsl:attribute>United States.
                        Department of State. Secretary (1947-1949 : Marshall, George
                        Cartlett)</xsl:element>
                </xsl:if>

                <!-- 51 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'acheson-dean-gooderham')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-051</xsl:attribute>United States.
                        Department of State. Secretary (1949-1953 : Acheson, Dean
                        Gooderham)</xsl:element>
                </xsl:if>

                <!-- 52 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'dulles-john-foster')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-052</xsl:attribute>United States.
                        Department of State. Secretary (1953-1959 : Dulles, John
                        Foster)</xsl:element>
                </xsl:if>

                <!-- 53 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'herter-christian-archibald')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-053</xsl:attribute>United States.
                        Department of State. Secretary (1959-1961 : Herter, Christian
                        Archibald)</xsl:element>
                </xsl:if>

                <!-- 54 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'rusk-david-dean')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-054</xsl:attribute>United States.
                        Department of State. Secretary (1961-1968 : Rusk, David Dean)</xsl:element>
                </xsl:if>

                <!-- 55 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'rogers-william-pierce')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-055</xsl:attribute>United States.
                        Department of State. Secretary (1969-1973 : Rogers, William
                        Pierce)</xsl:element>
                </xsl:if>

                <!-- 56 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'kissinger-henry-a')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-056</xsl:attribute>United States.
                        Department of State. Secretary (1973-1977 : Kissinger, Henry
                        A.)</xsl:element>
                </xsl:if>

                <!-- 57 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'vance-cyrus-roberts')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-057</xsl:attribute>United States.
                        Department of State. Secretary (1977-1980 : Vance, Cyrus
                        Roberts)</xsl:element>
                </xsl:if>

                <!-- 58 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'muskie-edmund-sixtus')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-058</xsl:attribute>United States.
                        Department of State. Secretary (1980-1981 : Muskie, Edmund
                        Sixtus)</xsl:element>
                </xsl:if>

                <!-- 59 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'haig-alexander-meigs')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-059</xsl:attribute>United States.
                        Department of State. Secretary (1981-1982 : Haig, Alexander Meigs,
                        Jr.)</xsl:element>
                </xsl:if>

                <!-- 60 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'shultz-george-pratt')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-060</xsl:attribute>United States.
                        Department of State. Secretary (1982-1989 : Shultz, George
                        Pratt)</xsl:element>
                </xsl:if>


                <!-- 61 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'baker-james-addison')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-061</xsl:attribute>United States.
                        Department of State. Secretary (1989-1992 : Baker, James Addison,
                        III)</xsl:element>
                </xsl:if>

                <!-- 62 -->
                <xsl:if
                    test=".//tei:term[matches(attribute::xml:id, 'eagleburger-lawrence-sidney')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-062</xsl:attribute>United States.
                        Department of State. Secretary (1992-1993 : Eagleburger, Lawrence
                        Sidney)</xsl:element>
                </xsl:if>

                <!-- 63 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'christopher-warren-minor')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-063</xsl:attribute>United States.
                        Department of State. Secretary (1993-1997 : Christopher, Warren
                        Minor)</xsl:element>
                </xsl:if>

                <!-- 64 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'albright-madeleine-korbel')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-064</xsl:attribute>United States.
                        Department of State. Secretary (1997-2001 : Albright, Madeleine
                        Korbel)</xsl:element>
                </xsl:if>

                <!-- 65 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'powell-colin-luther')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-065</xsl:attribute>United States.
                        Department of State. Secretary (2001-2005 : Powell, Colin
                        Luther)</xsl:element>
                </xsl:if>

                <!-- 66 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'rice-condoleezza')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-066</xsl:attribute>United States.
                        Department of State. Secretary (2005-2009 : Rice, Condoleezza)</xsl:element>
                </xsl:if>

                <!-- 67 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'clinton-hillary-rodham')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-067</xsl:attribute>United States.
                        Department of State. Secretary (2009-2013 : Clinton, Hillary
                        Rodham)</xsl:element>
                </xsl:if>

                <!-- 68 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'kerry-john-forbes')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-068</xsl:attribute>United States.
                        Department of State. Secretary (2013-2017 : Kerry, John
                        Forbes)</xsl:element>
                </xsl:if>

                <!-- 69 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'tillerson-rex-wayne')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-069</xsl:attribute>United States.
                        Department of State. Secretary (2017-2018 : Tillerson, Rex
                        Wayne)</xsl:element>
                </xsl:if>

                <!-- 70 -->
                <xsl:if test=".//tei:term[matches(attribute::xml:id, 'pompeo-mike')]">
                    <xsl:element name="term" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute
                            name="xml:id">us-secretary-of-state-070</xsl:attribute>United States.
                        Department of State. Secretary (2018- : Pompeo, Mike)</xsl:element>
                </xsl:if>

            </xsl:element>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

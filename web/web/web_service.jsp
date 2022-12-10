<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/ajax.js"></script>
    <script type="text/javascript" src="neuropeptide/js/bRoundCurve.js"></script>
    <script type="text/javascript" src="neuropeptide/js/service.js"></script>
    <style type="text/css">
        a {
            text-decoration: none;
            color: #06F;
        }

        a:hover {
            text-decoration: none;
            color: #F60;
        }

        ul {
            padding-left: 15px;
            line-height: 25px;
        }

        #xmlText {
            width: 950px;
        }
    </style>
</head>

<body id="Search">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

    <div id="pagetitle" style="clear:both; font-size:18px; color:#F60;">
        Web Service
        <!--
        <div id="navSearch" class="navSearch" style="margin-right:10px;">
            <div>
                <a href="search.jsp" class="adv_search"><span>Advanced
                        Search</span> </a>
            </div>
            <div>
                <a href="blast.jsp" class="blast_search"><span>Blast
                        Search</span> </a>
            </div>
            <div>
                <a href="web_service.jsp" class="web_service"><span>Web
                        Service</span> </a>
            </div>
        </div>
         -->
        <hr class="nav_hr"/>
    </div>

    <div id="content"
         style="line-height:35px; margin:15px 10px 15px 10px;">

        <h1>The Neuropeptide Database RESTful Web Service interface</h1>
        The Neuropeptide Database supports RESTful (REpresentational State
        Transfer) Web Services to make accessing data easier. Please use
        these services instead of screen-scraping.

        <p>Generally we are trying to implement two types of services for
            our RESTful interface:</p>
        <ul>
            <li><b>Search services</b>: to return a list of IDs (e.g., PDB
                IDs, chain IDs, ligand IDs)
            </li>
            <li><b>Fetch services</b>: to return data given a ID (e.g.
                reports, descriptions, data items)
            </li>
        </ul>
        <hr/>

        The services below are currently provided; please <a
            href="/pdb/home/contactUs.do">let us know</a> if you have additional
        suggestions.

        <h3>SEARCH services</h3>
        <ul>
            <li>A generic <a href="#search">SEARCH service</a> allowing to
                POST advanced queries
            </li>
            <li>Search for ligands and PDB IDs based on a <a href="#smiles">SMILES
                query</a></li>
        </ul>

        <h3>FETCH services</h3>

        <h4>Descriptions</h4>
        <ul>
            <li>Get <a href="#descPDB">descriptions for the whole
                neuropeptide</a></li>
            <li>Get <a href="#descEntity">description for a
                neuropeptide entity</a></li>
        </ul>

        <hr style="margin-bottom: 15px;"/>

        <div class="right1">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;Description
                of a Neuropeptide entry</p>
            <div class="hasH" style="padding: 10px;">
                <p>Access the descriptions about a neuropeptide entry.</p>
                <ul>
                    <li>Example: Access the information for one neuropeptide by
                        ID: <a href="/CXFService/infos/id/1"
                               target="_blank">/CXFService/infos/id/1</a></li>
                    <li>Example: Access the information for one neuropeptide by
                        accessNum: <a
                                href="/CXFService/infos/accessNum/NP00001"
                                target="_blank">/CXFService/infos/accessNum/NP00001</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="right2" style="margin-top: 10px;">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;Description
                of all Neuropeptide entries</p>
            <div class="hasH" style="padding: 10px;">
                <p>Access the descriptions about neuropeptide entries.</p>
                <ul>
                    <li>Example: Access the information for neuropeptides by
                        name: <a
                                href="/CXFService/infos/name/C-terminal peptide (By similarity)"
                                target="_blank">/CXFService/infos/name/C-terminal
                            peptide (By similarity)</a></li>
                    <li>Example: Access the information for neuropeptides by
                        sequence: <a
                                href="/CXFService/infos/sequence/SVPHFSDEDKDPE"
                                target="_blank">/CXFService/infos/sequence/SVPHFSDEDKDPE</a>
                    </li>
                    <li>Example: Access the information for neuropeptides by
                        organism: <a href="/CXFService/infos/organism/Homo sapiens"
                                     target="_blank">/CXFService/infos/organism/Homo sapiens</a></li>
                    <li>Example: Access the information for all neuropeptides by
                        family: <a href="/CXFService/infos/family/Human"
                                   target="_blank">/CXFService/infos/family/Human</a></li>
                    <li>Example: Access the information for all neuropeptides: <a
                            href="/CXFService/infos" target="_blank">/CXFService/infos</a>
                    </li>
                </ul>

            </div>
        </div>

        <div class="right3" style="margin-top: 10px;">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;SEARCH
                service</p>
            <div class="hasH" style="padding: 10px;">
                <p>
                    This interface exposes the advanced search interface as an XML Web
                    Service.To use this service, POST a XML representation of an
                    advanced search to <a href="web_service.jsp">web_service</a>.
                </p>
                <h4>XML representation of advanced search</h4>

                <p>
                    advanced search can be represented by XML. To view an example
                    representation, simply execute an advanced search query and then
                    click on the Result tab. One of the links on the top of the page
                    is <b>Query Details</b>. Clicking on this link will provide the
                    XML representation of the query.
                </p>

                <p>Every query is described by two data items:</p>
                <ul>
                    <li><b>queryType:</b> the name of the class that is
                        implementing the query
                    </li>
                    <li><b>arguments:</b> depending on the type of query that is
                        being executed one or more differently named arguments need to be
                        provided.
                    </li>
                </ul>
            </div>
        </div>

        <h4>Sample XML Queries:</h4>
        <select name="advSearch" onchange="changeXML(this.options[this.selectedIndex].value);">
            <option value="id">IdQuery</option>
            <option value="accessionNum">AccessionNumQuery</option>
            <option value="name">NameQuery</option>
            <option value="sequence">SequenceQuery</option>
            <option value="organism">OrganismQuery</option>
            <option value="family">FamilyQuery</option>
        </select>

        <p>The Query is displayed in the Textbox below</p>

        <div class="right4" style="margin-top: 10px;">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;Example:</p>
            <div class="hasH" style="padding: 10px;">
					<pre>
&lt;NeuropeptideQuery&gt;
    &lt;queryType&gt;org.neuropeptide.query.simple.IdQuery&lt;/queryType&gt;
    &lt;description&gt;Simple query for a list of id Number: 225&lt;/description&gt;
    &lt;id&gt;225&lt;/id&gt;
&lt;/NeuropeptideQuery&gt;
</pre>
            </div>
        </div>

        <p>
            Now let's <b>POST</b> this query against the Web Service:
        </p>
        <textarea id="xmlText" rows="10" class="perc100">
<?xml version="1.0" encoding="UTF-8"?>

            <NeuropeptideQuery>

    <queryType>org.pdb.neuropeptide.simple.IdQuery</queryType>

    <description>Simple query for id Number: 225</description>

    <id>225</id>

</NeuropeptideQuery>

</textarea>
        <div style="margin-top: 5px;">
            <input type="submit" value="POST XML" onclick="submitForm();"
                   title="The results  will appear in the box below." class="tooltip"/>
        </div>

        <div class="right5" style="margin-top: 10px;">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;Results
                will go here:</p>
            <div class="hasH" id="xmlResult" style="padding: 10px;">&nbsp;</div>
        </div>

        <div style="margin-top: 5px;">
            <input type="button" value="CLEAR RESULTS"
                   onclick="document.getElementById('xmlResult').innerHTML='';window.location.reload();"
                   title="Clear the results above." class="tooltip"/>
        </div>

        <div class="right6" style="margin-top: 10px;">
            <p style="font-size: 16px; font-weight:bold; color: #FFF; ">&nbsp;&nbsp;Examples:</p>
            <div class="hasH" style="padding: 10px;">
                <ul>
                    <li>View a Perl example that submits a simple search for
                        sequence: <a href="interface_pl.jsp"
                                     target="_blank">search_organism.pl</a>
                    </li>
                    <li>View a Java example that submits a simple search for
                        sequence:<a
                                href="interface_java.jsp"
                                target="_blank">PostXMLQuery.java</a>
                    </li>
                    <li>View a Python example that submits a simple search for
                        sequence:<a
                                href="interface_py.jsp"
                                target="_blank">search_nmr.py</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>

<script type="text/jscript">
	b_RoundCurve("right1","#6493C2","#FFF",3,"p","#6493C2");//标题只用纯色背景
	b_RoundCurve("right2","#6493C2","#FFF",3,"p","#6493C2");//标题只用纯色背景
	b_RoundCurve("right3","#6493C2","#FFF",3,"p","#6493C2");//标题只用纯色背景
	b_RoundCurve("right4","#6493C2","#6493C2",3,"p","#6493C2");//标题只用纯色背景
	b_RoundCurve("right5","#6493C2","#FFF",3,"p","#6493C2");//标题只用纯色背景
	b_RoundCurve("right6","#6493C2","#6493C2",3,"p","#6493C2");//标题只用纯色背景

</script>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
        content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict" />
    <meta name="description" content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database" />
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/smoothness/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="favicon.ico" type="mage/x-icon" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-ui-1.10.4.js"></script>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#content").tabs();
        });
    </script>
    <style type="text/css">
        .ui-helper-reset {
            font-size: 80%;
        }

        pre {
            /*background-color: #efefef;*/
            font-size: 80%;
            /*border: 1px solid #06F;*/
            /*padding: 1em; */
            /*margin: 1em 0; */
        }

        a {
            text-decoration: none;
            color: #06F;
        }

        a:hover {
            text-decoration: none;
            color: #F60;
        }
    </style>
</head>

<body id="Search">
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" >

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search" />

        <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--ClustalW Result--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Tools</li>
            <li>ClustalW</li>
            <li>ClustalW Result</li>
        </ol>


        <div id="content" style="font-size:1.1em">
            <ul>
                <li><a href="#fragment-1">Alignments</a></li>
                <li><a href="#fragment-2">Guide Tree</a></li>
            </ul>
            <div id="fragment-1">${outfile}</div>
            <div id="fragment-2">${tree}</div>
        </div>
        <!-- close div#content -->

    </div>
    <!-- close div#container -->
    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>

</html>
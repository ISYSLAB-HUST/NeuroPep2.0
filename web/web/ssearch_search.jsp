<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <style type="text/css">
        label {
            display: block;
            margin-top: 10px;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="Search">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container" >

<%--<%@ include file="/neuropeptide/nav/header.jsp" %>--%>
<input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">
    Smith-Waterman Search
    <!--
    <div id="navSearch" class="navSearch" style="margin-right:10px;">
        <div><a href="search" class="adv_search"><span>Advanced Search</span></a></div>
        <div><a href="web_service.jsp" class="web_service"><span>Web Service</span></a></div>
    </div>
     -->
    <hr class="nav_hr"/>
</div>


<div id="content"
     style="line-height: 35px; margin: 15px 10px 15px 10px;">

    <span>(Search for similar sequences)</span>
    <form action="blast" method="post">
        <div
                style="background-color: #9f9; border: 1px solid #aaa; padding: 10px; width: 600px;">
            <!-- <div style="float:right;">
                <a href="#">Help</a>
            </div> -->
            <label for="blast_sequence">Enter sequence below in FASTA
                format ('&gt;' is mandatory)</label>
            <div>
                <textarea cols="60" id="blast_sequence" name="blast_sequence" rows="6"></textarea>
            </div>
            <div class="example">
                Example: <br/>&gt;my_sequence_name_A Some optional description
                of A<br/>GETRAPL<br/> &gt;my_sequence_name_B Some optional
                description of B<br/>SVSVGMKPSPRP<br/> Note: Number of
                sequences is limited to 100
            </div>

            <div>
                <label for="evalue">Evalue</label>
                <select name="evalue">
                    <option value="0.0001">0.0001</option>
                    <option value="0.001">0.001</option>
                    <option value="0.01">0.01</option>
                    <option value="0.1">0.1</option>
                    <option value="1.0">1.0</option>
                    <option value="10.0">10.0</option>
                    <option value="100.0" selected="selected">100.0</option>
                    <option value="1000.0">1000.0</option>
                    <option value="10000.0">10000.0</option>
                </select>

                <label for="matrix">Matrix</label>
                <select id="matrix" name="matrix">
                    <option value="BLOSUM45">BLOSUM45</option>
                    <option value="BLOSUM62" selected="selected">BLOSUM62</option>
                    <option value="BLOSUM80">BLOSUM80</option>
                    <option value="PAM30">PAM30</option>
                    <option value="PAM70">PAM70</option>
                </select>
            </div>

            <div style="margin-top: 10px;">
                <input type="submit" class="button" value="Search"/>
            </div>
        </div>
    </form>

</div>
<!-- close div#content -->

<%-- <%@ include file="/neuropeptide/nav/footer.jsp"%> --%>

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
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

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        label {
            display: block;
            margin-top: 10px;
        }

        .indent {
            padding-left: 20px;
        }

        .question {
            position: relative;
            top: 3px;
            background: url("neuropeptide/img/question.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
            display: inline-block;
            height: 15px;
            margin-left: 4px;
            width: 15px;
        }
    </style>

</head>

<body id="Search">
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" >

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

        <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--Blast--%>
        <%--<!----%>
        <%--<div id="navSearch" class="navSearch" style="margin-right:10px;">--%>
        <%--<div><a href="search" class="adv_search"><span>Advanced Search</span></a></div>--%>
        <%--<div><a href="web_service.jsp" class="web_service"><span>Web Service</span></a></div>--%>
        <%--</div>--%>
        <%---->--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Tools</li>
            <li>Blast</li>
        </ol>

        <div id="content"
             style="line-height: 35px; margin-left: 5%;margin-bottom:5%;margin-right: 2%">
                    <span>Blast is used to search for similar sequences against the neuropeptide database.
                     <a title="help of the blast tool" href="help.jsp#blast" target="_blank" class="question"></a>
                    </span>
            <form action="blast" method="post">
                <div>
                    <label for="blast_sequence" style="font-size: 18px;font-family: inherit">Enter sequence below in FASTA
                        format ('&gt;' is mandatory, <a style="color: #06F;" onclick="setExampleSeq()">click for an example</a>)
                    </label>
                    <div>
                        <textarea class="form-control" rows="8" id="blast_sequence" name="blast_sequence"></textarea>
                    </div>

                    <div>
                        <hr/>
                        <label for="evalue" style="font-size: 18px;font-family: inherit">Evalue</label>
                        <div>
                            <select name="evalue">
                                <option value="0.0001">0.0001</option>
                                <option value="0.001">0.001</option>
                                <option value="0.01">0.01</option>
                                <option value="0.1">0.1</option>
                                <option value="1.0">1.0</option>
                                <option value="10.0" selected="selected">10.0</option>
                                <option value="100.0">100.0</option>
                                <option value="1000.0">1000.0</option>
                                <option value="10000.0">10000.0</option>
                            </select>
                        </div>
                        <hr/>
                        <label for="matrix" style="font-size: 18px;font-family: inherit">Matrix</label>
                        <div>
                            <select id="matrix" name="matrix">
                                <option value="BLOSUM45">BLOSUM45</option>
                                <option value="BLOSUM62" selected="selected">BLOSUM62</option>
                                <option value="BLOSUM80">BLOSUM80</option>
                                <option value="PAM30">PAM30</option>
                                <option value="PAM70">PAM70</option>
                            </select>
                        </div>
                        <hr/>
                    </div>

                    <div style="margin-top: 10px;">
                        <input type="submit" class="btn btn-default btn-primary" value="Search"/>
                    </div>
                </div>
            </form>

        </div>
        <!-- close div#content -->
    </div>
    <!-- close div#container -->

    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
<script>
    function setExampleSeq(){
        document.getElementById('blast_sequence').value = ">Name\nAAAGDNFMRF"
    }
</script>
</body>
</html>
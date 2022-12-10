<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        }

        #upfile {

            border: none;
            margin: 5px 0;

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
<%--ClustalW--%>
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
    <li>ClustalW</li>
</ol>

<div id="content"
     style="line-height: 35px; margin: 15px 10px 15px 10px;">

    <span>ClustalW, one of the most commonly used tools for multiple sequence alignment, <br/>can be used here to find the conserved motif of a group of neuropeptides.</span>
    <a title="help of the clustalw tool" href="help.jsp#clustalw" target="_blank" class="question"></a>
    <form action="tools_clustalw" method="post" enctype="multipart/form-data">
        <div style="border: 1px solid #aaa; padding: 10px; width: 600px;">
            <c:if test="${error != null}">
                <div class="error"><span style="color:red"><c:out value="${error}"></c:out></span></div>
            </c:if>
            <label for="blast_sequence">Enter sequence below in FASTA
                format ('&gt;' is mandatory)
            </label>
            <div class="indent">
						<textarea cols="90" id="muti_sequence" name="muti_sequence"
                                  rows="10"></textarea>
            </div>
            Or, upload a file: <input id="upfile" name="upfile" type="file">
            <div style="margin-top: 10px;">
                <input type="submit" class="button" value="RUN"/>
            </div>
        </div>
    </form>

</div>
<!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
<script type="text/javascript">
    function check() {

    }
</script>

</body>
</html>
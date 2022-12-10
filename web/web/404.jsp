<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Home</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <style type="text/css">
        #introduction li {
            padding: 0 0 26px 0px;
            list-style: none;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="Home">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container" >


<%--<%@ include file="/neuropeptide/nav/header.jsp" %>--%>
<input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

<div id="pagetitle"
     style="clear: both; font-size: 18px; color: #F60;">
    Home
    <hr class="nav_hr"/>
</div>

<div id="content" align="center" style="font-size: 16px; line-height: 30px; margin: 35px 10px 15px 10px;">
    <div style="width: 50%" align="left">
        <h4>Error:404!</h2>
            <h2>Sorry!</h4>
        <h4>The page you were looking for could not be found</h2>
    </div>
</div>
<!-- close div#content -->

<!-- 	<div id="footer" style="clear: both;">Last update: <span id="update_time"></span></div> -->

</div>
<!-- close div#container -->
<!-- <script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type='text/javascript' src='dwr/interface/NeuropeptideDWR.js'></script>
<script type="text/javascript">
window.onload = function() {footer(); };
function footer() {
var mycall = function callBack(data){
        document.getElementById("update_time").innerHTML = "&nbsp;&nbsp;" + data;
    };
NeuropeptideDWR.get_updateTime(mycall);
}
</script> -->
<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Submission</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/test.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="neuropeptide/js/ajax.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.4.4.js"></script>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
    </style>

</head>

<body id="Submission">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <%--<%@ include file="/neuropeptide/nav/header.jsp" %>--%>
    <input type="hidden" name="nav_cap" id="nav_cap" value="Submission"/>

    <div id="pagetitle"
         style="clear:both; font-size:18px; color:#F60; margin:50px auto auto 10px;">
        Submission
        <hr class="nav_hr"/>
    </div>


    <div id="content"
         style="line-height:35px; margin:35px 10px 15px 10px;">

        <form method="post" id="signin" action="login">
            <fieldset id="signin_menu">
                <div id="login">
                    <div id="topnav" class="topnav">
                        Submission or Admin Approval Entrance:
                    </div>
                    <p>
                        <label for="username">Username:</label> <input id="username"
                                                                       name="username" value="" title="username"
                                                                       tabindex="4"
                                                                       type="text"/>
                    </p>
                    <p>
                        <label for="password">Password:</label> <input id="password"
                                                                       name="password" value="" title="password"
                                                                       tabindex="5"
                                                                       type="password"/>
                    </p>
                    <p class="remember">
                        <input id="signin_submit" value="Login" tabindex="6" type="submit"/>
                        <input id="register" value="register" tabindex="7" type="button"/>
                    </p>
                </div>
            </fieldset>
        </form>

    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
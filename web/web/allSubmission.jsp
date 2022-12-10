<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" type="image/ico"
          href="http://www.datatables.net/favicon.ico"/>

    <title>Neuropeptide Database - Submission</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet"
          type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        #allSubmission td {
            padding-left: 10px;
            color: #666;
            border: 1px solid #ccc
            line-height: 30px;
            word-wrap: break-word;
            word-break: break-all;
        }

        #allSubmission th {
            padding-left: 10px;
            font-weight: normal;
            text-align: left;
            border: 1px solid #ccc
            line-height: 30px;
        }

        #allSubmission a {
            text-decoration: none;
            color: #06F;
        }

        #allSubmission a:hover {
            text-decoration: none;
            color: #F60;
        }

        #navLogout {
            padding: 0px 0px 10px;
            font-size: 15px;
            line-height: 23px;
            text-align: right;
        }

        #navLogout a.signout {
            background: #88bbd4;
            padding: 4px 12px 6px;
            text-decoration: none;
            font-weight: bold;
            color: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            *background: transparent url("../img/login/signin-nav-bg-ie.png") no-repeat 0 0px;
            *padding: 4px 12px 6px;
        }

        #navLogout a.signout:hover {
            background: #59B;
            *background: transparent url("../img/login/signin-nav-bg-hover-ie.png") no-repeat 0 0;
            *padding: 4px 12px 6px;
        }

        #navLogout a.signout, #topnav a.signout:hover {
            *background-position: 0 3px !important;
        }

        a.signout {
            position: relative;
            margin-left: 3px;
        }

        a.signin span {
            padding: 4px 16px 6px 0;
        }
    </style>

</head>

<body id="Submission">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">
    <input type="hidden" name="nav_cap" id="nav_cap" value="Submission"/>

    <div id="pagetitle"
         style="clear:both; font-size:18px; color:#F60;">
        Submission
        <div id="navLogout" class="navLogout" style="margin-right:10px;">
            <a href="logout" class="signout"><span>logout</span>
            </a>
        </div>
        <hr class="nav_hr"/>
    </div>


    <div id="content"
         style="line-height:35px; margin:35px 10px 15px 10px;">

        <table width="960" align="center" cellpadding="0" cellspacing="3"
               border="0" class="display" id="allSubmission"
               style="vertical-align:middle;">

            <tr>
                <th width="85">Number</th>
                <th width="230">Name</th>
                <th width="315">Sequence</th>
                <th width="330">Description</th>
            </tr>

            <s:iterator value="#request.aaData" id='sub' status='st'>
                <s:if test="#sub.isactive == 1">
                    <tr>
                        <td><a href='search_subDetail?subID=${sub.id}'>NO.<s:property
                                value="#st.count"/>
                        </a>
                        </td>
                        <td>${sub.name}</td>
                        <td>${sub.sequence}</td>
                        <td>${sub.description}</td>
                    </tr>
                </s:if>
            </s:iterator>

        </table>

    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->
<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
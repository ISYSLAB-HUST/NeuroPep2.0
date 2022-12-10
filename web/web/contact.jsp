<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Help</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .help_nav {
            font-size: 18px;
            color: #06F;
        }

        .search_nav {
            font-size: 16px;
            color: #06F;
        }

        .no_style {
            list-style: none;
            padding-left: 15px;
        }

        .no_style li a {
            font-weight: lighter;
            color: #000;
            text-decoration: none;
        }

        .no_style li a:hover {
            font-weight: normal;
            color: #06F;
            text-decoration: none;
        }

        .sub1 {
            list-style: square;
            padding-left: 35px;
        }

        .sub1 li a {
            font-weight: lighter;
            color: #000;
            text-decoration: none;
        }

        .sub1 li a:hover {
            font-weight: normal;
            color: #06F;
            text-decoration: none;
        }
    </style>
    <style type="text/css">
        p {
            padding: 10px 10px;
        }
    </style>
</head>

<body id="Help">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container"

    <input type="hidden" name="nav_cap" id="nav_cap" value="Help"/>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Contact</li>
    </ol>

    <div id="content" style="font-size:16px; line-height:30px; margin:25px 10px 15px 10px;">
        <p>
            <font color="red">Dr. Yan Wang</font><br/>
            College of Life Science and Technology<br/>
            Huazhong University of Science and Technology<br/>
            Wuhan 430074, China.<br/>
            <%--National Laboratory of Biomacromolecules<br/>--%>
            <%--Institute of Biophysics <br/>--%>
            <%--Chinese Academy of Sciences<br/>--%>
            <%--Beijing 100101, China.<br/>--%>
            Email: yanw@mail.hust.edu.cn<br/>
        </p>
        <p>
            <font color="red">Dr. Zhidong Xue</font><br/>
            School of Software Engineering <br/>
            Huazhong University of Science and Technology<br/>
            Wuhan 430074, China.<br/>
            Email: zdxue@mail.hust.edu.cn
        </p>
        <!--
        <p>
        <font color="red">Dr. Yan Wang</font><br/>
        College of Life Science and Technology<br/>
        Huazhong University of Science and Technology<br/>
        Wuhan 430074, China.<br/>
        Email: yanw@mail.hust.edu.cn
        </p>
         -->
        <!-- <div id="catalog" style="clear: both;">
        <h5>CONTENTS</h5>
        <ul>
            <li class="top_catalog"><a href="#Browse">Browse</a></li>
            <li class="top_catalog"><a href="#Search">Search</a>
                <ul>
                <li class="second_catalog"><a href="#quick_search">Quick Search</a></li>
                <li class="second_catalog"><a href="#advanced_search">Advanced Search</a></li>
                </ul>
            </li>
            <li class="top_catalog"><a href="#Tools">Tools</a>
                <ul>
                    <li class="second_catalog"><a href="#blast">Blast</a></li>
                    <li class="second_catalog"><a href="#map">Map</a></li>
                    <li class="second_catalog"><a href="#clustalw">ClustalW</a></li>
                </ul>
            </li>
            <li class="top_catalog"><a href="#Submission">Submission</a></li>
        </ul>
        </div>

        <div id="help">

            <span class="help_nav"><a name="Browse">Browse</a> </span>
            <hr style="border-style:dashed; width:960px; color:#06F" />
            <p>The browsing facility allows a user to explore the data for neuropeptides by major fields including (i) family of neuropeptides; (ii) organisms of neuropeptides; (iii) post-translational modifications.</p>
            <p class="img">
            <img src="neuropeptide/img/help/1.png"></img>
            <img src="neuropeptide/img/help/2.png"></img>
            <img src="neuropeptide/img/help/3.png"></img>
            </p>
            <span class="help_nav"><a name="Search">Search</a>
            </span>
            <hr style="border-style:dashed; width:960px; color:#06F" />
            <span class="search_nav"><a name="quick_search">Quick Search</a> </span>
            <p>A quick search feature allows users to search the database with keywords such as sequence, name, and NPID, etc.</p>
            <p class="img">
            <img src="neuropeptide/img/help/4.png"></img>
            <img src="neuropeptide/img/help/5.png"></img>
            <img src="neuropeptide/img/help/6.png"></img>
            </p>
            <span class="search_nav"><a name="advanced_search">Advanced Search</a> </span>
            <p>An advanced search page helps users to combine search with logical operators like AND/OR.</p>
            <p class="img">
            <img src="neuropeptide/img/help/7.png"></img>
            <img src="neuropeptide/img/help/8.png"></img>
            </p>
            <span class="help_nav"><a name="Tools">Tools</a> </span>
            <hr style="border-style:dashed; width:960px; color:#06F" />
            <span class="search_nav"><a name="blast">Blast</a> </span>
            <p>Blast can help users to find similar sequences against their input sequences.</p>
            <p class="img">
            <img src="neuropeptide/img/help/9.png"></img>
            </p>
            <span class="search_nav"><a name="map">Map</a> </span>
            <p  class="img">
            <img src="neuropeptide/img/help/10.png"></img>
            <img src="neuropeptide/img/help/11.png"></img>
            </p>
            <span class="search_nav"><a name="clustalw">ClustalW</a> </span>
            <p  class="img">
            <img src="neuropeptide/img/help/12.png"></img>
            <img src="neuropeptide/img/help/13.png"></img>
            </p>
            <span class="help_nav"><a name="Submission">Submission</a> </span>
            <hr style="border-style:dashed; width:960px; color:#06F" />
            <p>The submission page provides a window where users can submit their peptide data to this database.</p>
            <p class="img">
            <img src="neuropeptide/img/help/14.png"></img>
            </p>
        </div> -->

    </div>
    <!-- close div#content -->
</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

</body>
</html>

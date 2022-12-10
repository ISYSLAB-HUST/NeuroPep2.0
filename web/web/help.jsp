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

    <link rel="stylesheet" href="neuropeptide/css/up_btn.css" />
    <script src="neuropeptide/js/up_btn.js"></script>

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

        #catalog {
            padding-bottom: 20px;
        }

        #catalog li {
            list-style: none;
            line-height: 20px;
        }

        #catalog li a, a:hover {
            background: none repeat scroll 0 0 transparent;
            color: #cc6633;
            outline: medium none;
        }

        .top_catalog {
            font-size: 18px;
            line-height: 25px !important;
        }

        .second_catalog {
            font-size: 16px;
            padding-left: 10px;
            line-height: 25px !important;
        }

        .img {
            text-align: center;
        }

        #help img {
            width: 800px;
            padding: 10px 0px;
        }
    </style>
</head>

<body id="Help">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Help"/>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Help</li>
    </ol>

    <div id="content" style="font-size:16px; line-height:30px; margin:25px 10px 15px 10px;">
        <div id="catalog" style="clear: both;">
            <h5 style="font-size: 16px">CONTENTS</h5>
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
                        <li class="second_catalog"><a href="#deepNeuropePred">DeepNeuropePred</a></li>
                        <li class="second_catalog"><a href="#neuroPredESM">NeuroPred-PLM</a></li>
                    </ul>
                </li>
                <li class="top_catalog"><a href="#Submission">Submission</a></li>
            </ul>
        </div>

        <div id="help" style="text-align: justify">

            <div style="margin-bottom: 0px;height: 50px;line-height: normal; width: 1198px; margin-left: -10px; font-size: 18px" class="alert alert-info" role="alert">
                <a name="Browse">Browse</a>
            </div>

            <hr style="border-style:dashed; width:960px; color:#06F"/>
            <p>The browsing facility allows a user to explore the data for neuropeptides by major fields including (i) families of neuropeptides; (ii) organisms of neuropeptides; (iii) post-translational modifications, and  allows a user to explore the data for neuropeptide receptors by fields including (i) organisms of neuropeptide receptors; (ii) post-translational modifications.</p>
            <p class="img">
                <img src="neuropeptide/img/help/1.png"></img>
                <img src="neuropeptide/img/help/2.png"></img>
                <img src="neuropeptide/img/help/3.png"></img>
            </p>
            <div style="margin-bottom: 0px;height: 50px;line-height: normal; width: 1198px; margin-left: -10px;font-size: 18px" class="alert alert-info" role="alert">
                <a name="Search">Search</a>
            </div>

            <hr style="border-style:dashed; width:960px; color:#06F"/>
            <span class="search_nav"><a name="quick_search">Quick Search</a> </span>

            <p>A quick search feature allows users to search the database for neuropeptides or neuropeptide receptor with keywords such as sequence, name, organism, and NPID, etc. The information of neuropeptide or receptor  matching the query keywords are retrieved from the database and shown in a table format. User can download the table or the sequence in fasta format. User can also click on the ID URL link of neuropeptide or receptor which be interested in, the annotations about the neuropeptides or receptors will be showed.</p>
            <p class="img">
                <img src="neuropeptide/img/help/4.png"></img>
                <img src="neuropeptide/img/help/5.png"></img>
            </p>
            <p>This page allow users to access the detailed information on a single neuropeptide entry. The information in this page is divided into various sections.</p>
            <p>Basic Information shows the basic information for a neuropeptide , which was extracted from different sources. Cross links were extracted from UniProt, PubMed, Taxonomy, STRING and AmiGO.</p>
            <p class="img">
                <img src="neuropeptide/img/help/6.png"/>
                <img src="neuropeptide/img/help/7.png"/>
            </p>
            <p>Click "Physicochemical Properties" to view the physicochemical properties of neuropeptide.</p>
            <p class="img">
                <img src="neuropeptide/img/help/8.png"/>
            </p>
            <p>Physicochemical Properties show the physico-chemical properties, hydropathy and amino acids composition.</p>
            <p class="img">
                <img src="neuropeptide/img/help/9.png"/>
                <img src="neuropeptide/img/help/10.png"/>
            </p>
            <p>Click "Receptors" to view the receptor of neuropeptide.</p>
            <p class="img">
                <img src="neuropeptide/img/help/11.png"/>
            </p>
            <p>Receptors show brief information of receptor if available. Receptors interacting with neuropeptide were extracted from UniProt, STRING, Guide to PHARMACOLOGY and GPCRdb.
            </p>
            <p class="img">
                <img src="neuropeptide/img/help/12.png"/>
            </p>
            <p>The user can access the detailed information of receptor by click the NPRID.</p>
            <p class="img">
                <img src="neuropeptide/img/help/13.png"/>
            </p>
            <p>Click "Structure" to view the structure of neuropeptide.</p>
            <p class="img">
                <img src="neuropeptide/img/help/14.png"/>
            </p>
            <p>Structure shows the experiment structure or the predict the 3D structure of neuropeptide. Alphafold2 and APPTEST were used to predict the 3D structure of neuropeptide and neuropeptide receptor without experiment structure. The user can download the  experiment structure or the predict the 3D structure by the download link.</p>
            <p class="img">
                <img src="neuropeptide/img/help/15.png"/>
            </p>
            <p>Click "Complex structure " to view the complex structure of neuropeptide and receptor.</p>
            <p class="img">
                <img src="neuropeptide/img/help/16.png"/>
            </p>
            <p>Complex structure shows the 3D structure of the complex of neuropeptide and receptor if available. The neuropeptide structure is shown as stick. The neuropeptide receptor structure is show as cartoon. The user can also download the complex structure by the download link.</p>
            <p class="img">
                <img src="neuropeptide/img/help/17.png"/>
            </p>
            <span class="search_nav"><a name="advanced_search">Advanced Search</a> </span>
            <p>An advanced search page helps users to combine search with logical operators like AND/OR to search the database. In addition, advanced search allows users to specify a search range. The information of neuropeptide or receptor matching the query keywords are retrieved from our database and shown in a table format. The following example shows extracting neuropeptides name of substance p with the length range of 10 to 50.</p>
            <p class="img">
                <img src="neuropeptide/img/help/18.png"/>
                <img src="neuropeptide/img/help/19.png"/>
            </p>
            <div style="margin-bottom: 0px;height: 50px;line-height: normal; width: 1198px; margin-left: -10px; font-size: 18px" class="alert alert-info" role="alert">
                <a name="Tools">Tools</a>
            </div>
            <hr style="border-style:dashed; width:960px; color:#06F"/>

            <span class="search_nav">
                <a name="blast">Blast</a>
            </span>
            <p>Blast is used to search for similar sequences against the neuropeptide database.</p>
            <p class="img">
                <img src="neuropeptide/img/help/20.png"></img>
            </p>

            <span class="search_nav">
                <a name="map">Map</a>
            </span>
            <p>MAP is used to retrieve NeuroPep 2.0 database peptides against the query sequence.</p>
            <p class="img">
                <img src="neuropeptide/img/help/21.png"></img>
                <img src="neuropeptide/img/help/22.png"></img>
            </p>

            <span class="search_nav">
                <a name="deepNeuropePred">DeepNeuroPred</a>
            </span>
            <p>DeepNeuropePred employs a combination of pre-trained language model and Convolutional Neural Networks for feature extraction, thereby predicting the neuropeptide cleavage sites from precursors.</p>
            <p class="img">
                <img src="neuropeptide/img/help/23.png"></img>
                <img src="neuropeptide/img/help/24.png"></img>
            </p>

            <span class="search_nav">
                <a name="neuroPredESM">NeuroPred-PLM</a>
            </span>
            <p>NeuroPred-PLM employs a combination of pre-trained language model and attention mechanism to predict neuropeptides.</p>
            <p class="img">
                <img src="neuropeptide/img/help/25.png"></img>
                <img src="neuropeptide/img/help/26.png"></img>
            </p>
            <div style="margin-bottom: 0px;height: 50px;line-height: normal; width: 1198px; margin-left: -10px; font-size: 18px" class="alert alert-info" role="alert">
                <a name="Submission">Submission</a>
            </div>
            <hr style="border-style:dashed; width:960px; color:#06F"/>
            <p>The submission page provides a window where users can submit their peptide or receptor data to this database.</p>
            <p class="img">
                <img src="neuropeptide/img/help/27.png"></img>
            </p>
        </div>

    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->
<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script type="text/javascript">

  $(document).ready(function () {
    up({
      // bottom position
      bottom: '20px',
      // right position
      right: '12vw',
      // width
      width: '60px',
      // height
      height: '60px',
      // background color
      // bg: 'green',
      // custom icon
      // src: ' neuropeptide/img/R-C.png',
      // distance from the top to show the back to top button
      whenShow: 400,
      // circular button?
      // circle: true

    });
  })
</script>
</body>
</html>

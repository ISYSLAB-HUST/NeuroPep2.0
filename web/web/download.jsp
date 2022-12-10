<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Download</title>
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
    <link href="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.css" rel="stylesheet"/>
    <script src="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.js"></script>

    <link rel="stylesheet" href="neuropeptide/css/up_btn.css"/>
    <script src="neuropeptide/js/up_btn.js"></script>

    <style type="text/css">
      .neuropeptide td {
        padding-left: 10px;
        color: #666;
        border: 1px solid #ccc;
        line-height: 30px;
        word-wrap: break-word;
        word-break: break-all;
      }

      .neuropeptide a {
        text-decoration: none;
        color: #06F;
      }

      .neuropeptide a:hover {
        text-decoration: none;
        color: #F60;
      }

      .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
        border: 1px solid #ddd !important;
      }

      .downloadTd {
        text-align: center;
      }
      .downloadTd img {
        width: 20px;
      }
    </style>
</head>

<body id="Help">
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container">

        <input type="hidden" name="nav_cap" id="nav_cap" value="Help"/>

        <ol class="breadcrumb"
            style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Download</li>
        </ol>

        <div id="content" style="font-size:16px; line-height:30px; margin:25px 10px 15px 10px;">
            <span style="font-size: 14px; line-height: 35px">Please click on the following links to download all neuropeptides or receptors data.
            </span>
            <table class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"
                   cellpadding="0" cellspacing="0" style="vertical-align: middle;text-align: center;    margin-top: 8px;">
                <tr style="color: #31708f;background-color: #d9edf7; border-color: #bce8f1;font-weight: bolder">
                    <td width="20%" class="title">Name</td>
                    <td width="40%">Download All</td>
                    <td width="40%">Download Fasta</td>
                </tr>
                <tr>
                    <td width="20%" class="title">Neuropeptide</td>
                    <td width="40%" class="downloadTd"><a href="neuropeptide/excel/NeuroPepV2_neuropeptide_all.txt" download="neuropeptide/excel/NeuroPepV2_neuropeptide_all.txt"><img  src="neuropeptide/img/download.png"/></a></td>
                    <td width="40%" class="downloadTd"><a href="neuropeptide/excel/NeuroPepV2_neuropeptide.fasta" download="neuropeptide/excel/NeuroPepV2_neuropeptide.fasta"><img src="neuropeptide/img/download.png"/></a></td>
                </tr>
                <tr>
                    <td width="20%" class="title">Neuropeptide receptor</td>
                    <td width="40%" class="downloadTd"><a href="neuropeptide/excel/NeuroPepV2_receptor_all.txt" download="neuropeptide/excel/NeuroPepV2_receptor_all.txt"><img src="neuropeptide/img/download.png"/></a></td>
                    <td width="40%" class="downloadTd"><a href="neuropeptide/excel/NeuroPepV2_receptor.fasta" download="neuropeptide/excel/NeuroPepV2_receptor.fasta"><img src="neuropeptide/img/download.png"/></a></td>
                </tr>
            </table>
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

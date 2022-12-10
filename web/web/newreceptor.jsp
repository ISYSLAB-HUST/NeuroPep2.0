<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Recepttor</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <script type="text/javascript" src="jmol/Jmol.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script src="https://cdn.bootcss.com/echarts/3.7.2/echarts.min.js"></script>
    <script type="text/javascript" src="neuropeptide/js/3Dmol-min.js"></script>


    <style type="text/css">
      .neuropeptide td {
        padding-left: 10px;
        color: #666;
        border: 1px solid #ccc;
        line-height: 30px;
        word-wrap: break-word;
        word-break: break-all;
      }

      #Goinfo td {
        border: 0;
      }


      #Goinfo .style1 {
        color: #663333;
      }

      #ModificationInfo td {
        border: 0;
      }

      #ModificationInfo .style1 {
        color: #663333;
      }


      #pdb td {
        border: 0;
      }

      #pdb .style1 {
        color: #663333;
      }

      .title-box {
        font-weight: bold;
      }

      .title {
        font-weight: bold;
        width: 150px;
        /* background-color: rgb(185, 214, 230); */
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

      [v-cloak] {
        display: none;
      }

      .mol-container {
        width: 60%;
        height: 400px;
        position: relative;
      }

      /*boostraptable */
      .fixed-table-header {
        border-right: solid 1px #ddd;
        border-top: solid 1px #ddd;
      }

      .fixed-table-header table {
        border-top: solid 0px #ddd !important;
        margin-top: -1px;
      }
    </style>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <%--    <script src="https://cdn.jsdelivr.net/npm/vue"></script>--%>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>
    <link href="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.css" rel="stylesheet"/>
    <script src="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.js"></script>

</head>

<body id="Search">

<div id="wrapper">

    <%@ include file="/neuropeptide/nav/newheader.jsp" %>


    <div id="container">

        <ol class="breadcrumb"
            style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Receptor</li>
            <%--            <li class="active">by <c:out value="${protype}"></c:out></li>--%>
        </ol>

        <div id="app" align="center" style="line-height: 35px; margin: 35px 10px 15px 10px;">

            <!-- receptor model start -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width: 1200px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Receptor Infomation</h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default" v-for="(item,index) in list">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion"
                                               :href="'#'+item.entryName">
                                                {{item.entryName}}
                                            </a>
                                        </h4>
                                    </div>
                                    <div :id="item.entryName" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <table class="table" width="1200px"
                                                   style="word-break:break-all; word-wrap:break-all;">
                                                <tr>
                                                    <td width="20%" class="title-box">Entry name</td>
                                                    <td width="80%">{{item.entryName}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Protein names</td>
                                                    <td width="80%">{{item.proteinName}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Gene names</td>
                                                    <td width="80%">{{item.geneName}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Organism</td>
                                                    <td width="80%">{{item.organism}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Length</td>
                                                    <td width="80%">{{item.length}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Function [CC]</td>
                                                    <td width="80%">{{item.function}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Protein families</td>
                                                    <td width="80%">{{item.proteinFamily}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Taxonomic lineage (ALL)</td>
                                                    <td width="80%">{{item.taxonomicLinege}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">PubMed ID</td>
                                                    <td width="80%">{{item.pubMedId}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Gene ontology IDs</td>
                                                    <td width="80%">{{item.geneOnthologyIds}}</td>
                                                </tr>
                                                <tr>
                                                    <td width="20%" class="title-box">Tissue specificity</td>
                                                    <td width="80%"
                                                        style="overflow-wrap: break-word; word-break: normal; text-align: justify">
                                                        {{item.tissueSpecificity}}
                                                    </td>
                                                </tr>
                                                <tr v-if="this.Modification!==''">
                                                    <td width="255" class="title">Modification</td>
                                                    <td width="715">
                                                        <table class="neuropeptide table table-striped" align="center"
                                                               border="border: 1px solid #666"
                                                               cellpadding="0" cellspacing="0"
                                                               style="vertical-align: middle;">
                                                            <tr>
                                                                <th width="230" style="text-align:center;">Location</th>
                                                                <th width="230" style="text-align:center;">Residue</th>
                                                                <th width="230" style="text-align:center;">
                                                                    Modification
                                                                </th>
                                                            </tr>
                                                            <tr v-for="(item,index) in Modification">
                                                                <td width="230" align="center">{{item.first}}</td>
                                                                <td width="230" align="center">{{item.second}}</td>
                                                                <td width="230" align="center">{{item.thrid}}</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="middle" width="20%" class="title-box">Sequence</td>
                                                    <td width="80%">{{item.sequence}}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table" width="900px" style="word-break:break-all; word-wrap:break-all;">
                                <%--<tr>--%>
                                <%--<th width="100">Entry name</th>--%>
                                <%--<th width="110">Protein names</th>--%>
                                <%--<th width="110">Gene names</th>--%>
                                <%--<th width="90">Organism</th>--%>
                                <%--<th width="70">Length</th>--%>
                                <%--<th width="100">Function</th>--%>
                                <%--<th width="100">Protein families</th>--%>
                                <%--<th width="200">Taxonomic lineage (ALL)</th>--%>
                                <%--<th width="100">PubMed ID</th>--%>
                                <%--<th width="100">Gene ontology IDs</th>--%>
                                <%--<th width="100">Tissue specificity</th>--%>
                                <%--<th>Sequence</th>--%>
                                <%--</tr>--%>
                                <%--<tr v-for="(item,index) in list">--%>
                                <%--<td>{{item.entryName}}</td>--%>
                                <%--<td>{{item.proteinName}}</td>--%>
                                <%--<td>{{item.geneName}}</td>--%>
                                <%--<td>{{item.organism}}</td>--%>
                                <%--<td>{{item.length}}</td>--%>
                                <%--<td>{{item.function}}</td>--%>
                                <%--<td>{{item.proteinFamily}}</td>--%>
                                <%--<td>{{item.taxonomicLinege}}</td>--%>
                                <%--<td>{{item.pubMedId}}</td>--%>
                                <%--<td>{{item.geneOnthologyIds}}</td>--%>
                                <%--<td>{{item.tissueSpecificity}}</td>--%>
                                <%--<td>{{item.sequence}}</td>--%>
                                <%--</tr>--%>


                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- receptor model end -->

            <div>
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Basic" data-toggle="tab">
                        Basic Information</a></li>
                    <%--                    <li><a href="#Physicochemical" data-toggle="tab">Physicochemical Properties</a></li>--%>
                    <li><a href="#Receptors" data-toggle="tab">Ligands</a></li>
                    <li><a href="#Structure" data-toggle="tab">Structure</a></li>
                    <li><a href="#Complex" data-toggle="tab" v-if="complexPdb!='NA'">Complex structure</a></li>
                    <li><a href="#Drug" data-toggle="tab"
                           v-if="drugBank.length !=0 || chEMBL.length!=0 || drugCentral.length!=0">Drug Information</a>
                    </li>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Basic">
                        <div style="margin-bottom: 0px;height: 50px;line-height: normal" class="alert alert-info"
                             role="alert">Basic Information
                        </div>
                        <table class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"
                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                            <tr>
                                <td width="20%" class="title">NPRID</td>
                                <td width="80%">{{NPID}}
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Name</td>
                                <td width="715">{{Name}}</td>
                            </tr>
                            <%--                            <tr>--%>
                            <%--                                <td width="255" class="title">Family</td>--%>
                            <%--                                <td width="715">{{family}}</td>--%>
                            <%--                            </tr>--%>
                            <tr>
                                <td width="255" class="title">Organism</td>
                                <td width="715">{{Organism}}
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">NCBI Taxa ID</td>
                                <td width="715">
                                    <a href='http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?lvl=0&id=<s:property value="#request.info.Taxa_ID" />'
                                       target="_blank"><s:property value="#request.info.Taxa_ID"/>
                                    </a>
                                </td>

                            </tr>
                            <tr v-if="Lineage[0]!='NA'">
                                <td width="255" class="title">Lineage</td>
                                <td width="715">
                                    <div style="display: inline-block;word-wrap:break-word; word-break:normal;">
                                        <span style="color: black" v-for="(item,index) in Lineage"
                                              style="padding-left: 20px">
                                            <span v-if="index != Lineage.length-1">{{item}},</span>
                                            <span v-else>{{item}}.</span>
                                        </span>
                                    </div>
                                    <%--                                    <div style="display: inline-block" v-else>--%>
                                    <%--                                        <span>NA</span>--%>
                                    <%--                                    </div>--%>
                                </td>
                            </tr>
                            <tr v-if="this.UniprotID!=='NA'">
                                <td width="255" class="title">UniProt ID</td>
                                <td width="715"><a :href="'http://www.uniprot.org/entry/'+UniprotID" target="_blank">{{UniprotID}}</a>
                                </td>
                            </tr>
                            <tr v-if="this.gene!=='NA'">
                                <td width="255" class="title">Gene</td>
                                <td width="715">{{gene}}</td>
                            </tr>
                            <tr v-if="this.TissueSpecificity!=='NA'">
                                <td width="255" class="title">Tissue Specificity</td>
                                <td width="715"
                                    style="overflow-wrap: break-word; word-break: normal; text-align: justify"
                                >{{this.TissueSpecificity}}
                                </td>
                            </tr>
                            <tr v-if="this.Function!=='NA'">
                                <td width="255" class="title">Function</td>
                                <td width="715">
                                    <%--                            <p v-for="(item,index) in Function">{{index+1}}.{{item}}</p>--%>
                                    <p style="overflow-wrap: break-word; word-break: normal; text-align: justify">
                                        {{Function}}</p>
                                </td>
                            </tr>
                            <tr v-if="goinfoArray.length!=0">
                                <td width="255" class="title">Gene Ontology</td>
                                <td width="715">
                                    <%--                                    <table  class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"--%>
                                    <%--                                            cellpadding="0" cellspacing="0" style="vertical-align: middle;">--%>
                                    <%--                                        <tr>--%>
                                    <%--                                            <th width="230"  style="text-align:center;">GO ID</th>--%>
                                    <%--                                            <th width="230"  style="text-align:center;">GO Term</th>--%>
                                    <%--                                            <th width="230"  style="text-align:center;">Definition</th>--%>
                                    <%--                                            <th width="230"  style="text-align:center;">Evidence</th>--%>
                                    <%--                                        </tr>--%>
                                    <%--                                        <tr v-for="(item,index) in goinfoArray">--%>
                                    <%--                                            <td width="200" align="center">--%>
                                    <%--                                                <a :href="'http://amigo.geneontology.org/amigo/term/'+item.first" target="_blank"> {{item.first}}</a>--%>
                                    <%--                                            </td>--%>
                                    <%--                                            <td width="200" align="center">{{item.second}}</td>--%>
                                    <%--                                            <td width="470" align="center">{{item.third}}</td>--%>
                                    <%--                                            <td width="50" align="center">{{item.forth}}</td>--%>
                                    <%--                                        </tr>--%>
                                    <%--                                    </table>--%>
                                    <table id="table"
                                    ></table>
                                </td>
                            </tr>
                            <tr v-if="this.STRID!=='NA'">
                                <td width="255" class="title">STRING ID</td>
                                <td width="715"><a :href="'https://string-db.org/network/'+STRID">{{STRID}}</a></td>
                            </tr>
                            <tr v-if="Reactome!= 'NA'">
                                <td width="255" class="title">Reactome ID</td>
                                <td width="715">
                                    <div style="display: inline-block">
                                        <span style="color: black" v-for="(item,index) in Reactome"
                                              style="padding-left: 20px">
                                            <span v-if="index != Reactome.length-1">
                                                <a :href="'https://reactome.org/content/detail/'+item" target="_blank">{{item}},</a>
                                            </span>
                                            <span v-else><a :href="'https://reactome.org/content/detail/'+item"
                                                            target="_blank">{{item}}.</a>
                                                </span>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr v-if="GuidetoPHARMACOLOGY!='NA'">
                                <td width="255" class="title">IUPHAR ID</td>
                                <td width="715">
                                    <a :href="'https://www.guidetopharmacology.org/GRAC/ObjectDisplayForward?objectId='+GuidetoPHARMACOLOGY"
                                       target="_blank">{{GuidetoPHARMACOLOGY}}</a>
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Length</td>
                                <td width="715">{{Length}}</td>
                            </tr>
                            <tr v-if="this.Modification!==''">
                                <td width="255" class="title">Modification</td>
                                <td width="715">
                                    <table class="neuropeptide table table-striped" align="center"
                                           border="border: 1px solid #666"
                                           cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                        <tr>
                                            <th width="230" style="text-align:center;">Location</th>
                                            <th width="230" style="text-align:center;">Residue</th>
                                            <th width="230" style="text-align:center;">Modification</th>
                                        </tr>
                                        <tr v-for="(item,index) in Modification">
                                            <td width="230" align="center">{{item.first}}</td>
                                            <td width="230" align="center">{{item.second}}</td>
                                            <td width="230" align="center">{{item.thrid}}</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Sequence</td>
                                <td width="715">
                                    <div id="sequence"></div>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">
                                References
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                <tr v-if="this.Reference!=='NA'">
                                    <%--                                    <td width="255" class="title">Reference</td>--%>
                                    <td width="715" id="ref">
                                        <div v-for="(value,index) in Reference"><p>{{index+1}}.{{value}}</p></div>
                                        <div><a target="_blank" :href="'https://pubmed.ncbi.nlm.nih.gov/'+pmid"><span
                                                style="color: red">PMID:</span>{{pmid}}</a></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%--                        <div >--%>
                        <%--                            <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">--%>
                        <%--                                Overview of Protein Modification Sites with Functional and Accessible Surface Area--%>
                        <%--                            </div>--%>
                        <%--                            <div style="width: 900px;height: 400px;margin-top: 20px" id="asa-graph">test</div>--%>


                        <%--                        </div>--%>
                    </div>
                    <%--                    <div class="tab-pane fade" id="Physicochemical">--%>
                    <%--                        <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">Physico-chemical Properties</div>--%>
                    <%--                        <div style="padding-left:40px;text-align: left">--%>
                    <%--                            <div style="padding-bottom: 15px;">--%>
                    <%--                                <b style="font-weight: bold;">Molecular weight:</b> {{pi}}--%>
                    <%--                                <br/>--%>
                    <%--                                <b style="font-weight: bold;">Theoretical pI:</b> {{mw}}--%>
                    <%--                            </div>--%>
                    <%--                            <div style="padding:15px 0px;">--%>
                    <%--                                <div id="charged"></div>--%>
                    <%--                                <span style="font-size: 14px; padding-left: 10px;">Red: negatively charged; Blue: positively charged</span><br/>--%>
                    <%--                                Total number of negatively charged residues (Asp + Glu): <font id="nve_count"></font><br/>--%>
                    <%--                                Total number of positively charged residues (Arg + Lys): <font id="pve_count"></font><br/>--%>

                    <%--                            </div>--%>
                    <%--                            <div style="padding:15px 0px;">--%>
                    <%--                                <div id="hydrop"></div>--%>
                    <%--                                <span style="font-size: 14px; padding-left: 10px;">Green: hydrophilic; Black: hydrophobic</span><br/>--%>
                    <%--                                Total number of hydrophobic residues: <font id="hydrophobic_count"> </font><br/>--%>
                    <%--                                Total number of hydrophilic residues: <font id="hydrophilic_count1"> </font><br/>--%>
                    <%--                            </div>--%>
                    <%--                            <div id="analyze_text" style="display: none;">--%>
                    <%--                                <table cellpadding="0" cellspacing="0" border="1" bordercolor=red style="margin:10px 0px;">--%>
                    <%--                                    <tr>--%>
                    <%--                                        <td rowspan=2>Amino Acid Polarity</td>--%>
                    <%--                                        <td>Hydrophobic</td>--%>
                    <%--                                        <td colspan=2>Hydrophilic</td>--%>
                    <%--                                    </tr>--%>
                    <%--                                    <tr>--%>
                    <%--                                        <td><span id="hydrophobic_count2"></span></td>--%>
                    <%--                                        <td colspan=2><span id="hydrophilic_count"></span></td>--%>
                    <%--                                    </tr>--%>
                    <%--                                </table>--%>
                    <%--                                <table cellpadding="0" cellspacing="0" border="1" bordercolor=red>--%>
                    <%--                                    <tr>--%>
                    <%--                                        <td rowspan=2>Amino Acid Charge</td>--%>
                    <%--                                        <td>+vely charged</td>--%>
                    <%--                                        <td>-vely charged</td>--%>
                    <%--                                        <td>Neutral Amino acid</td>--%>
                    <%--                                    </tr>--%>
                    <%--                                    <tr>--%>
                    <%--                                        <td><span id="pve"></span></td>--%>
                    <%--                                        <td><span id="nve"></span></td>--%>
                    <%--                                        <td><span id="nac"></span></td>--%>
                    <%--                                    </tr>--%>
                    <%--                                </table>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">Histograms of physico-chemical properties</div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu1"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu2"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu3"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu4"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu5"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu6"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu7"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu8"></div>--%>
                    <%--                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu9"></div>--%>
                    <%--                        <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">hydropathy plots</div>--%>
                    <%--                        <div style="width: 900px;height: 400px;margin-top: 20px" id="qinshuixing"></div>--%>
                    <%--                        <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">Amino Acids Composition</div>--%>
                    <%--                        <div id="aacomposition" style="width: 900px;height: 400px;" class="highchart"></div>--%>
                    <%--                    </div>--%>
                    <div class="tab-pane fade" id="Structure">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px;line-height: normal" class="alert alert-info"
                                 role="alert">Structure
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                <%--                                <tr>--%>
                                <%--                                    <td width="255" class="title">Length</td>--%>
                                <%--                                    <td width="715">{{Length}}</td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr v-if="this.Modification!==''">--%>
                                <%--                                    <td width="255" class="title">Modification</td>--%>
                                <%--                                    <td width="715">--%>
                                <%--                                        <table class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"--%>
                                <%--                                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">--%>
                                <%--                                            <tr>--%>
                                <%--                                                <th width="230"  style="text-align:center;">Location</th>--%>
                                <%--                                                <th width="230"  style="text-align:center;">Residue</th>--%>
                                <%--                                                <th width="230"  style="text-align:center;">Modification</th>--%>
                                <%--                                            </tr>--%>
                                <%--                                            <tr v-for="(item,index) in Modification">--%>
                                <%--                                                <td width="230" align="center">{{item.first}}</td>--%>
                                <%--                                                <td width="230" align="center">{{item.second}}</td>--%>
                                <%--                                                <td width="230" align="center">{{item.thrid}}</td>--%>
                                <%--                                            </tr>--%>
                                <%--                                        </table>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr>--%>
                                <%--                                    <td width="255" class="title">Sequence</td>--%>
                                <%--                                    <td  width="715">--%>
                                <%--                                        <div  id="sequence"></div>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <tr v-if="pdb=='NA'||pdb==''" id="predictStru">
                                    <td width="255" class="title">Predicted Structure</td>
                                    <td width="715">

                                        <div id="pdb3">

                                        </div>
                                        <div id="pdbbox3">
                                            <div id="container-03" class="mol-container" style="float: left"></div>
                                            <div style="float: left;margin-top: 50px;margin-left: 40px">

                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios3" id="optionsRadios31"
                                                               value="option1" checked
                                                               onclick="changeStyle3('cartoon')">
                                                        cartoon
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios3" id="optionsRadios32"
                                                               value="option2" onclick="changeStyle3('stick')">
                                                        stick
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios3" id="optionsRadios33"
                                                               value="option3" onclick="changeStyle3('Sphere')">
                                                        Sphere
                                                    </label>
                                                    <div style="margin-top:15px;color: #3d6db6;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">
                                                        The 3D Structure of {{ NPID}}
                                                        <span style="margin-left: 8px">
                                                        <a id="dowloadpdb3"
                                                           :href="'./jmol/pdb/receptor_structure/'+NPID+'.pdb'"
                                                           style="margin-left: 2px;margin-top: 2px">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-download"
                                                             viewBox="0 0 16 16">
                                                            <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                            <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                                        </svg>
                                                    </a>
                                                    </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="pdb!='NA'&&pdb!=''">
                                    <td width="255" class="title">Structure</td>
                                    <td width="715">

                                        <div style="max-height: 350px;overflow: auto" id="pdb">

                                        </div>
                                        <div id="pdbbox">
                                            <div id="container-01" class="mol-container" style="float: left"></div>
                                            <div style="float: left;margin-top: 50px;margin-left: 40px">

                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios1" id="optionsRadios1"
                                                               value="option1" checked onclick="changeStyle('cartoon')">
                                                        cartoon
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios1" id="optionsRadios2"
                                                               value="option2" onclick="changeStyle('stick')">
                                                        stick
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios1" id="optionsRadios3"
                                                               value="option3" onclick="changeStyle('Sphere')">
                                                        Sphere
                                                    </label>
                                                </div>
                                                <div style="margin-top:15px;color: #3d6db6;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">
                                                        <span id="pdbtext">

                                                        </span>
                                                    <span style="margin-left: 8px">
                                                        <a id="dowloadpdb" style="margin-left: 2px;margin-top: 2px">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-download"
                                                             viewBox="0 0 16 16">
                                                            <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                            <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                                        </svg>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="Complex">
                        <div v-if="complexPdb!='NA'">
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">Complex Structure
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">

                                <tr>
                                    <td width="255" class="title">Complex Structure</td>
                                    <td width="715" style="text-align: center">

                                        <div style="max-height: 350px;overflow: auto">
                                            <table width="100%" cellspacing="0" cellpadding="3"
                                                   class="table table-striped" border="0">

                                                <tbody>

                                                <tr>
                                                    <td style="text-align: center">NPID</td>
                                                    <td style="text-align: center">NPRID</td>
                                                    <td style="text-align: center">PDB</td>
                                                    <td style="text-align: center">Method</td>
                                                    <td style="text-align: center">Resolution</td>
                                                    <td style="text-align: center">NP Chain</td>
                                                    <td style="text-align: center">NPR Chain</td>
                                                    <td style="text-align: center">Download PDB</td>
                                                </tr>

                                                <tr v-for="(item,index) in complexPdbList">
                                                    <td style="text-align: center" v-if="index==0"
                                                        :rowspan="complexPdbList.length">{{NPID}}
                                                    </td>
                                                    <td style="text-align: center">{{item[0]}}</td>
                                                    <td style="text-align: center"><a
                                                            @click="molChange2(item[1],item[4],item[5])">{{item[1]}}</a>
                                                    </td>
                                                    <td style="text-align: center">{{item[2]}}</td>
                                                    <td style="text-align: center">{{item[3]}}</td>
                                                    <td style="text-align: center">{{item[4]}}</td>
                                                    <td style="text-align: center">{{item[5]}}</td>
                                                    <td style="text-align: center">
                                                        <a :href="'./jmol/pdb/'+item[1]+'_'+item[4].trim()+'_'+item[5].replace(',','_').trim()+'.pdb'"
                                                           style="margin-left: 2px;margin-top: 2px">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                 height="16" fill="currentColor" class="bi bi-download"
                                                                 viewBox="0 0 16 16">
                                                                <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                                <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                                            </svg>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div id="pdbbox1">
                                            <div id="container-02" class="mol-container" style="float: left"></div>
                                            <div style="float: left;margin-top: 50px;margin-left: 29px;text-align: left">


                                                <div id="pdbtext2" style="margin-top:50px; width: 353px">
                                                    <div style="display: inline-block">The neuropeptide structure is
                                                        shown as stick.
                                                    </div>
                                                    <div style="display: inline-block">The neuropeptide receptor
                                                        structure is show as cartoon.
                                                    </div>
                                                    <span style="color: #3d6db6;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">
                                                            The 3D structure of {{pdbtext2}}
                                                    </span>
                                                    <span style="margin-left: 8px">
                                                        <a id="downloadpdb2" style="margin-left: 2px;margin-top: 2px">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-download"
                                                             viewBox="0 0 16 16">
                                                            <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                            <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                                        </svg>
                                                    </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="Receptors">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">Ligands
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                <tr v-if="this.Neuropeptide!==''">
                                    <td width="255" class="title">Ligand</td>
                                    <td id="neu" width="715">
                                        <table class="neuropeptide table table-striped" align="center"
                                               border="border: 1px solid #666"
                                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                            <tr>
                                                <th width="184" style="text-align:center;">NPID</th>
                                                <th width="184" style="text-align:center;">Uniport_ID</th>
                                                <th width="184" style="text-align:center;">STRING_ID</th>
                                                <%--                                <th width="184"  style="text-align:center;">Reactome link--%>
                                                <%--                                </th>--%>
                                                <%--                                <th width="184"  style="text-align:center;">IUPHAR_link--%>
                                                <%--                                </th>--%>
                                            </tr>
                                            <tr v-for="(item,index) in NeuropeptideArray">
                                                <td width="184" align="center">
                                                    <a :href="'search_info?pepNum='+item[0]"
                                                       target="_blank">{{item[0]}}</a>
                                                </td>
                                                <td width="184" align="center">
                                                    <span v-if="item[1]!='NA'"><a
                                                            :href="'http://www.uniprot.org/entry/'+item[1]"
                                                            target="_blank">{{item[1]}}</a></span>
                                                    <span v-else>NA</span>
                                                </td>
                                                <td width="184" align="center">
                                                    <a v-if="item[2] != 'NA'"
                                                       :href="'https://string-db.org/network/'+item[2]" target="_blank">{{item[2]}}</a>
                                                    <span v-else>NA</span>
                                                </td>
                                                <%--                                <td width="184" align="center">--%>
                                                <%--                                    <div v-for="aitem in item[3]">--%>
                                                <%--                                        <a  :href="'https://reactome.org/content/detail/'+aitem" target="_blank">{{aitem}}</a>--%>

                                                <%--                                    </div>--%>
                                                <%--                                </td>--%>
                                                <%--                                <td width="184" align="center">--%>
                                                <%--                                    <a :href="'https://www.guidetopharmacology.org/GRAC/ObjectDisplayForward?objectId='+item[4]" target="_blank">{{item[4]}}</a>--%>
                                                <%--                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="Drug">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">Drug Information
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                <tr>
                                    <td>DrugDB</td>
                                    <td>DrugDB_ID</td>
                                </tr>
                                <tr>
                                    <td>DrugBank</td>
                                    <td v-if="drugBank!=''"><span v-for="(value,index) in drugBankList">
                                            <a target="_blank" :href="'https://www.drugbank.ca/drugs/'+value"
                                               v-if="index != drugBankList.length-1">{{value}},</a>
                                            <a target="_blank" :href="'https://www.drugbank.ca/drugs/'+value" v-else>{{value}}</a>
                                    </span>
                                    </td>
                                    <td v-else>NA</td>
                                </tr>
                                <tr>
                                    <td>ChEMBL</td>
                                    <td v-if="chEMBL!=''">
                                        <span v-for="(value,index) in chEMBLList">
                                            <a target="_blank"
                                               :href="'https://www.ebi.ac.uk/chembl/target_report_card/'+value"
                                               v-if="index != chEMBLList.length-1"><span style="color: red"></span>{{value}},</a>
                                            <a target="_blank"
                                               :href="'https://www.ebi.ac.uk/chembl/target_report_card/'+value" v-else>{{value}}</a>
                                        </span>
                                    </td>
                                    <td v-else>NA</td>
                                </tr>
                                <tr>
                                    <td>DrugCentral</td>
                                    <td v-if="drugCentral!=''"><a target="_blank"
                                                                  :href="'https://drugcentral.org/target/'+drugCentral + '/view?q=' + drugCentral"><span
                                            style="color: red"></span>{{drugCentral}}</a>
                                    </td>
                                    <td v-else>NA</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">sorry...</h4>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        This structure is still missing.</p>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                </div>

            </div>


        </div>
    </div>


    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script type="text/javascript">

  //定义全局的viewer对象
  let viewer;
  let molType = "cartoon";
  let viewer1;
  let viewer3;
  let molType3 = "cartoon";


  $(document).ready(function () {

    console.log("here");
    //var res = "${request}";
    var pdb = String("${request.info.pdb}");
    var sequence = String("${request.info.sequence}");
    var goinfo = String("${request.info.goinfo}");
    var modification = String("${request.info.modification}");
    console.log("res")
    console.log(pdb)
    console.log(sequence)
    console.log(goinfo)
    //console.log(modification)

    console.log("--------engow-------------")

    var nodes =
    ${request.info.nodesStr}
    var lines = ${request.info.linesStr}
        console.log(nodes)
    console.log(lines)


    let PredictASA = String("${request.info.predictASA}");
    PredictASA = PredictASA.split("#")
    let RealASA = String("${request.info.realASA}");
    console.log("--!!!!!!!!!!-------" + PredictASA + "---------")
    console.log("-----------" + RealASA + "----------")
    // let asaMax = 1,asaMin=0;
    // for(let i=0;i < PredictASA.length;i++){
    //     asaMax = Math.max(asaMax,PredictASA[i]);
    //     asaMin = Math.max(asaMin,PredictASA[i]);
    // }
    // let  asaX = [];
    // for(let i =0;i<PredictASA.length;i++){
    //     asaX.push(i+1)
    // }
    // let asaGraphDom = document.getElementById('asa-graph');
    // let asaChart = echarts.init(asaGraphDom);
    // var optionAsa;
    // optionAsa = {
    //
    //     title: {
    //         text: 'Accessibility surface area(ASA)',
    //         left: 'center',
    //         textStyle: {//主标题的属性
    //             color: 'rgba(0,0,0,0.98)',//颜色
    //             fontSize: 16,//大小
    //             fontWeight:400,//
    //         }
    //     },
    //     tooltip: {
    //         trigger: 'axis'
    //     },
    //     legend: {
    //         x:'center',
    //         y:'bottom',
    //         data: ['Predicted ASA']
    //     },
    //
    //     xAxis: {
    //         type: 'category',
    //         boundaryGap: false,
    //         splitLine: { show: true } ,
    //         data: asaX
    //     },
    //     yAxis: {
    //         type: 'value',
    //         axisLine: { onZero: false },
    //         splitLine: { show: false } ,
    //     },
    //     // dataZoom: [
    //     //
    //     //     {
    //     //         show: true,
    //     //         type: 'inside',
    //     //         filterMode: 'none',
    //     //         yAxisIndex: [0],
    //     //         startValue: 0,
    //     //         endValue: 1
    //     //     }
    //     // ],
    //     series: [
    //         {
    //             data: PredictASA,
    //             type: 'line',
    //             name:['Predicted ASA'],
    //             itemStyle : {
    //                 normal : {
    //                     color:'#559fe7',
    //                     lineStyle: {
    //                         width: 3,
    //                         shadowColor: 'rgba(0,0,0,0.3)',
    //                         shadowBlur: 10,
    //                         shadowOffsetY: 8
    //                     },
    //                 }
    //             },
    //
    //         },
    //
    //     ]
    // };
    // // let RealASAPos = ''
    // // if(RealASAPos.length != 0){
    // //     let  asaposX = [];
    // //     for(let i =RealASAPos[0];i <= RealASAPos[1];i++){
    // //         asaposX.push(i)
    // //     }
    // //     optionAsa.xAxis.data = asaposX;
    // // }
    // if(RealASA.length != 0 && RealASA[0] != 'NA'){
    //     let realasaobj = {
    //         data: RealASA,
    //         type: 'line',
    //         name:['Real ASA'],
    //         itemStyle : {
    //             normal : {
    //                 color:'#da8a59',
    //                 lineStyle: {
    //                     width: 3,
    //                     shadowColor: 'rgba(0,0,0,0.3)',
    //                     shadowBlur: 10,
    //                     shadowOffsetY: 8
    //                 },
    //             }
    //         }
    //     }
    //     optionAsa.legend.data.push('Real ASA')
    //     optionAsa.series.push(realasaobj);
    // }
    // optionAsa && asaChart.setOption(optionAsa);

    //var modification=""
    if (modification != null && modification != "" && modification != "NA") {
      var modification_html = '<table width="100%" cellspacing="0" cellpadding="3" border="0">' +
          '<tr><td width="50%" class="style1">Modification</td>' +
          '<td width="20%" class="style1">Residue</td>' +
          '<td width="15%" class="style1">Start</td>' +
          '<td width="15%" class="style1"><div class="style1">End</div></td></tr>';
      modification = modification.split("$");
      for (var i in modification) {
        modification_html += "<tr>";
        var item = modification[i].split("#");
        modification_html += '<td>' + item[2] + '</td>';
        modification_html += '<td>' + item[1] + '</td>';
        modification_html += '<td>' + item[0] + '</td>';
        modification_html += '<td>' + item[0] + '</td>';
        modification_html += "</tr>";
      }
      modification_html += "</table>";
      $("#ModificationInfo").html(modification_html);
    } else {
      $("#ModificationInfo").html("NA");
    }

    //处理pdb
    if (pdb != null && pdb != "NA" && pdb != "") {
      var pdb_html = '<table width="100%" cellspacing="0" cellpadding="3" class="table table-striped" border="0">' +
          '<tr>' +
          '<td style="text-align: center" width="15%" class="style1">PDB</td>' +
          '<td style="text-align: center" width="15%" class="style1">Method</td>' +
          '<td style="text-align: center" width="15%" class="style1">Resolution</td>' +
          '<td style="text-align: center" width="10%" class="style1">Chain</td>' +
          '<td style="text-align: center"width="15%" class="style1">Position</td>' +
          '<td style="text-align: center" width="15%" class="style1">Download PDB</td>' +
          '<td style="text-align: center" width="15%" class="style1">RCSB-PDB</td></tr>';
      pdb = pdb.split("$");
      //用来存储第一次展示的PDB
      var firstPdb = "";

      var firstItem = pdb[0].split(";");
      var firstItemTmp = []
      if (firstItem[3]) {
        firstItemTmp = firstItem[3].split("=");
      }
      firstPdb = firstItem[0].trim() + '_' + firstItemTmp[0].split('/')[0].trim();
      $("#pdbtext").html("The 3D structure of " + firstPdb)

      $(function () {
        let element = $('#container-01');
        let config = {backgroundColor: 'white'};
        viewer = $3Dmol.createViewer(element, config);
        let pdbUri = './jmol/pdb/' + firstPdb + '.pdb';
        jQuery.ajax(pdbUri, {
          success: function (data) {
            let v = viewer;
            v.addModel(data, "pdb");                       /* load data */
            v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            v.zoomTo();                                      /* set camera */
            v.render();                                      /* render scene */
            v.zoom(1.2, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {

            console.error("Failed to load PDB " + pdbUri + ": " + err);
            // $("#pdbbox").html("")
            $("#message").modal()

          },
        });
        //viewer.addModel("3\n\nC 0 0 0\nO 1.16 0 0\nO -1.16 0 0", "xyz");
        viewer.addUnitCell();
        //viewer.setStyle({}, {sphere : {}});
        //viewer.zoomTo();
        //viewer.render();
      });


      for (var i in pdb) {
        pdb_html += "<tr>";
        var item = pdb[i].split(";");
        if (item.length != 4) continue;
        var tmp = item[3].split("=");
        // pdb_html += '<td><a href="pdb.jsp?pdbName=' + item[0].trim() + tmp[0].split('/')[0].trim() + '" target="_blank">' + item[0] + '</a></td>';
        //pdb_html += '<td><a onclick="molChange(' +"'"+ item[0].trim() + tmp[0].split('/')[0].trim() +"'"+ ')">' + item[0] + '</a></td>';
        pdb_html += '<td style="text-align: center"><a style="cursor:pointer;" onclick="molChange(' + "'" + item[0].trim() + "'" + ',' + "'" + tmp[0] + "'" + ')">' + item[0] + '</a></td>';

        pdb_html += '<td style="text-align: center">' + item[1] + '</td>';
        pdb_html += '<td style="text-align: center">' + item[2] + '</td>';
        pdb_html += '<td style="text-align: center">' + tmp[0] + '</td>';
        pdb_html += '<td style="text-align: center">' + tmp[1] + '</td>';
        pdb_html += `<td style="text-align: center"><a href="./jmol/pdb/` + item[0].trim() + '_' + tmp[0].split('/')[0].trim() + `.pdb" style="margin-left: 2px;margin-top: 2px">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
                                                <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                            </svg>
                                        </a></td>`;
        pdb_html += `<td style="text-align: center"><a target="_blank" href="https://www.rcsb.org/structure/` + item[0].trim() + `">
                                           View
                                        </a></td></tr>`;
      }
      pdb_html += "</table>";
      $("#pdb").html(pdb_html);


    }
    let NPRID = String("${request.info.accessNum}")

    if (pdb == null || pdb == "NA") {
      $(function () {
        let element3 = $('#container-03');
        let config3 = {backgroundColor: 'white'};
        viewer3 = $3Dmol.createViewer(element3, config3);
        let pdbUri3 = './jmol/pdb/receptor_structure/' + NPRID.trim() + '.pdb';

        jQuery.ajax(pdbUri3, {
          success: function (data) {
            let v = viewer3;
            v.addModel(data, "pdb");                       /* load data */
            v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            v.zoomTo();                                      /* set camera */
            v.render();                                      /* render scene */
            v.zoom(1.2, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {
            console.error("Failed to load PDB " + pdbUri3 + ": " + err);
            // $('#predictStru').css("display:none");
            $("#pdbbox3").html("NA")
            $("#message").modal()
          },
        });
        //viewer.addModel("3\n\nC 0 0 0\nO 1.16 0 0\nO -1.16 0 0", "xyz");
        viewer3.addUnitCell();
        //viewer.setStyle({}, {sphere : {}});
        //viewer.zoomTo();
        //viewer.render();
      });
    }

    //第一次加载pdb
    var complexPdb1 = String(`${request.info.complexPdb}`)
    var tempComplexPdbList1 = complexPdb1.split("$");
    var pdbitem1, item4, item5;


    for (let i = 0; i < tempComplexPdbList1.length; i++) {
      let item = tempComplexPdbList1[i].split(";");
      pdbitem1 = item[1]

      item4 = item[4]
      item5 = item[5]
      break
      //this.complexPdbList.push(item)
    }
    if (complexPdb1 != "" && complexPdb1 != "NA") {
      $(function () {
        let element1 = $('#container-02');
        let config1 = {backgroundColor: 'white'};
        viewer1 = $3Dmol.createViewer(element1, config1);
        let pdbUri1 = './jmol/pdb/' + pdbitem1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim() + '.pdb';
        $('#downloadpdb2').attr("href", pdbUri1);
        jQuery.ajax(pdbUri1, {
          success: function (data) {
            let v1 = viewer1;
            v1.addModel(data, "pdb");                       /* load data */
            v1.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            v1.setStyle({chain: item4.split(",")[0].trim()}, {stick: {colorscheme: 'yellowCarbon'}});  /* style all atoms */
            v1.setStyle({chain: item5.split(",")[0].trim()}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            if (NPRID == 'NPR00149')
              v1.setStyle({chain: item5.split(",")[1].trim()}, {cartoon: {color: 'spectrum'}});  /* style all atoms */

            v1.zoomTo();                                      /* set camera */
            v1.render();                                      /* render scene */
            v1.zoom(1.2, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {
            console.error("Failed to load PDB " + pdbUri1 + ": " + err);


          },
        });
        //viewer.addModel("3\n\nC 0 0 0\nO 1.16 0 0\nO -1.16 0 0", "xyz");
        viewer1.addUnitCell();
        //viewer.setStyle({}, {sphere : {}});
        //viewer.zoomTo();
        //viewer.render();
      });
    }


    //处理reference
    var reference = String(`${request.info.pubmedId}`);

    if (reference != null && reference != "" && reference != "NA") {
      var ref_html = '<table><tr><td style="width: 80%; text-align: center">Article</td><td style="width: 20%; text-align: center">PMID</td></tr>';
      reference = reference.split("$");
      for (var i in reference) {
        var item = reference[i].split("//");
        ref_html += '<tr><td style="width: 80%;word-wrap:break-word; word-break:normal;">'
        for (let i = 1; i < item.length; i++) {
          ref_html += item[i];
        }
        ref_html += '</td><td style="width: 20%; text-align: center"><a href="http://www.ncbi.nlm.nih.gov/pubmed/?term=' + item[0] +
            '" target="_blank">' + item[0] + '</a></td></tr>';
      }
      ref_html += "</table>";
      $("#ref").html(ref_html);
    } else {
      $("#ref").html("NA");
    }


    var sub_count = Math.floor((sequence.length) / 10);
    console.log(sub_count);
    $('#sequence').html("");
    let sequenceTable = "<table style='font-family:  Consolas;font-size: 18px ' frame=void >";
    for (var i = 0; i < sub_count; i++) {
      if (i % 5 == 0)
        sequenceTable += "<tr>"
      sequenceTable += "<td style='border-style:none;'>" + sequence.substr(i * 10, 10);
      var sub = "[" + (i + 1) * 10 + "]"
      sequenceTable += sub.sub() + "</td>";
      if (i % 5 == 4)
        sequenceTable += "</tr>"
    }
    if (sequence.substr(i * 10) != '')
      sequenceTable += "<td style='border-style:none;'>" + sequence.substr(i * 10) + "</td>" + "</table>"
    else
      sequenceTable += "</table>"
    $('#sequence').html(sequenceTable);


  });
  let NPRID = String("${request.info.accessNum}")

  //切换数据
  function molChange(pdb, item) {
    let finalpdb = pdb.trim() + '_' + item.split('/')[0].trim()
    let pdbUri = './jmol/pdb/' + pdb.trim() + '_' + item.split('/')[0].trim() + '.pdb';
    console.log(NPRID)
    if (NPRID == 'NPR00149') {
      if (pdb == '3W11' || pdb == '3W12' || pdb == '3W13' || pdb == '4OGA' || pdb == '6HN5' || pdb == '6SOF' || pdb == '6VEP') {
        let tmp = item.replace(',', '_')
        finalpdb = pdb.trim() + '_' + tmp.trim()
        pdbUri = './jmol/pdb/' + pdb.trim() + '_' + tmp.trim() + '.pdb';
        console.log(pdbUri)
      }
    }
    jQuery.ajax(pdbUri, {
      success: function (data) {
        $("#pdbtext").html("The 3D structure of " + finalpdb)
        let element = $('#container-01');
        $('#dowloadpdb').attr("href", pdbUri);
        $('#dowloadpdb').attr("href", pdbUri);
        let config = {backgroundColor: 'white'};
        viewer = $3Dmol.createViewer(element, config);
        let v = viewer;
        v.addModel(data, "pdb");
        if (molType == "cartoon")
          v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
        else if (molType == "stick")
          v.setStyle({}, {stick: {color: 'spectrum'}});  /* style all atoms */
        else if (molType == "Sphere")
          v.setStyle({}, {sphere: {color: 'spectrum'}}); /* load data */
        //v.setStyle({}, {molType: {color: 'spectrum'}});  /* style all atoms */
        v.zoomTo();                                      /* set camera */
        v.render();                                      /* render scene */
        //v.zoom(1.0, 1000);                               /* slight zoom */
      },
      error: function (hdr, status, err) {
        console.error("Failed to load PDB " + pdbUri + ": " + err);
        // $("#pdbbox").html("")
        $("#message").modal()
      },
    });

  }

  //切换形态
  function changeStyle(type) {


    molType = type;
    if (type == "cartoon")
      viewer.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "stick")
      viewer.setStyle({}, {stick: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "Sphere")
      viewer.setStyle({}, {sphere: {color: 'spectrum'}});  /* style all atoms */
    //刷新界面
    viewer.render();

  }

  //切换形态
  function changeStyle3(type) {


    molType = type;
    if (type == "cartoon")
      viewer3.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "stick")
      viewer3.setStyle({}, {stick: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "Sphere")
      viewer3.setStyle({}, {sphere: {color: 'spectrum'}});  /* style all atoms */
    //刷新界面
    viewer3.render();

  }

  //切换形态
  function changeStyle1(type) {


    molType1 = type;
    if (type == "cartoon")
      viewer1.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "stick")
      viewer1.setStyle({}, {stick: {color: 'spectrum'}});  /* style all atoms */
    else if (type == "Sphere")
      viewer1.setStyle({}, {sphere: {color: 'spectrum'}});  /* style all atoms */
    //刷新界面
    viewer1.render();

  }


  function toPropeties() {

    var form = $("<form>");//定义一个form表单
    form.attr("style", "display:none");
    form.attr("target", "");
    form.attr("method", "post");
    form.attr("action", "analyze");
    var input1 = $("<input>");
    input1.attr("type", "hidden");
    input1.attr("name", "SEQ");
    input1.attr("value", '${request.info.sequence }');
    var input2 = $("<input>");
    input2.attr("type", "hidden");
    input2.attr("name", "mw");
    input2.attr("value", '${request.info.mw }');
    var input3 = $("<input>");
    input3.attr("type", "hidden");
    input3.attr("name", "pi");
    input3.attr("value", '${request.info.pi }');
    $("body").append(form);//将表单放置在web中
    form.append(input1);
    form.append(input2);
    form.append(input3);
    form.submit();//表单提交
  }

</script>
<script type="text/javascript">
  var columns = [{
    field: 'first',
    title: 'GO ID',
    align: 'center',
    width: '200px',
    formatter: function aFormatter(value, row, index) {
      return [
        '<a href="http://amigo.geneontology.org/amigo/term/' + value + '"' + 'target="_blank"' + '>' + value + '</a>'
      ].join("")
    }
    // <a :href="'http://amigo.geneontology.org/amigo/term/'+item.first" target="_blank"> {{item.first}}</a>
  }, {
    field: 'second',
    title: 'GO Term',
    align: 'center',
    width: '200px'
  }, {
    field: 'third',
    title: 'Definition',
    align: 'center',
    width: '470px'
  }, {
    field: 'forth',
    title: 'Evidence',
    align: 'center',
    width: '50px'
  }
  ];
  const goinfoList = [];
  var goinfo = String("${request.info.goinfo}");
  //czq 对goinfo进行处理
  //this.document.getElementById("Goinfo").innerHTML="NA";
  if (goinfo != "NA" && goinfo != "") {
    goinfo = goinfo.split("#");
    //每种最多只展示三个 多的不展示
    var countP = 0, countF = 0, countC = 0;
    console.log("goinfo----", goinfo)
    for (let i = 0; i < goinfo.length; i++) {
      let temp = {};
      let item = goinfo[i].split(";");
      console.log("goinfo----", item)
      temp.first = item[0];
      temp.forth = item[2].replace(/(^\s)|(\s*$)/g, "").substring(0, 3);
      //temp.forth=item[2];
      //分开合并的两列
      let vary = item[1].split(":")
      //console.log(vary)
      temp.third = vary[1].replace(/(^\s)|(\s*$)/g, "");

      if (vary[0].indexOf("P") != -1) {
        temp.second = "Biological Process";
        // countP++;
        // if(countP<=3)
        goinfoList.push(temp);
      } else if (vary[0].indexOf("F") != -1) {
        temp.second = "Molecular Function";
        // countF++;
        // if(countF<=3)
        goinfoList.push(temp);
      } else if (vary[0].indexOf("C") != -1) {
        temp.second = "Cellular Component";
        // countC++;
        // if(countC<=3)
        goinfoList.push(temp);
      }
    }
  }
  $(function () {
    //#table表示的是上面table表格中的id
    $("#table").bootstrapTable('destroy').bootstrapTable({
      columns: columns,
      classes: "table table-bordered table-striped",
      data: goinfoList,
      height: getTableHeight(),
      fixedColumns: true,
      fixedNumber: 1,
    });

    function getTableHeight() {
      let height;
      if (goinfoList.length >= 9) {
        height = 370;
      } else {
        height = 150;
      }
      return height;
    }
  })
</script>
<script type="text/javascript">
  let molType1 = "cartoon"
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      NPID: "",
      Name: "",
      Organism: "",
      NCBI: "",
      Lineage: "",
      Length: "",
      Modification: "",
      Sequence: "",
      pmid: "",
      pi: "",
      mw: "",

      TissueSpecificity: "",

      Function: "",
      UniprotID: "",
      PDBID: "",
      GeneO: "",
      goinfo: "",
      goinfoStore: "",
      goinfoArray: [],
      STRID: "",
      gene: "",
      Reactome: "",
      ReactomeArray: [],
      GuidetoPHARMACOLOGY: "",
      family: "",

      Properties: "",
      NeuropeptideArray: [],
      Reference: [],
      pdb: "",
      network: 1,

      drugBank: "",
      drugBankList: [],
      chEMBL: "",
      chEMBLList: [],
      drugCentral: "",
      complexPdb: "",


      pdbtext2: '',
      //模态框
      test: "test",
      m_entryName: "123",
      m_function: "",
      m_geneName: "",
      m_geneOnthologyIds: "",
      m_id: "",
      m_length: "",
      m_organism: "",
      m_proteinFamily: "",
      m_proteinName: "",
      m_pubMedId: "",
      m_sequence: "",
      m_taxonomicLinege: "",
      m_tissueSpecificity: "",
      list: [],
      complexPdbList: [],
      mcmap: {}
    },
    methods: {
      receptorClick: function (e) {

      },
      enter: function () {
        this.goinfo = this.goinfoStore
      },
      leave: function () {
        this.goinfo = this.goinfoStore.slice(0, 3)
      },
      lineFilter: function (arr) {
        var hash = []
        var res = []
        for (var i = 0; i < arr.length; i++) {
          var data = JSON.stringify(arr[i])
          if (!hash[data]) {
            hash[data] = 1
            var rdata = JSON.parse(data)
            res.push(rdata)
          } else {

          }
        }
        return res
      },
      //切换数据2
      molChange2(pdb1, item4, item5) {
        let _this = this
        let pdbUri = './jmol/pdb/' + pdb1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim() + '.pdb';
        $('#downloadpdb2').attr("href", pdbUri);
        jQuery.ajax(pdbUri, {
          success: function (data) {
            _this.pdbtext2 = pdb1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim()
            console.log(_this.pdbtext2)
            let element = $('#container-02');
            let config = {backgroundColor: 'white'};
            viewer1 = $3Dmol.createViewer(element, config);
            let v = viewer1;
            v.addModel(data, "pdb");
            if (molType1 == "cartoon")
              v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */

            //v.setStyle({}, {molType: {color: 'spectrum'}});  /* style all atoms */
            console.log()
            v.setStyle({chain: item4.split(",")[0].trim()}, {stick: {colorscheme: 'yellowCarbon'}});  /* style all atoms */
            v.setStyle({chain: item5.split(",")[0].trim()}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            if (_this.NPID == 'NPR00149')
              v.setStyle({chain: item5.split(",")[1].trim()}, {cartoon: {color: 'spectrum'}});  /* style all atoms */

            v.zoomTo();                                      /* set camera */
            v.render();                                      /* render scene */
            //v.zoom(1.0, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {
            $("#message").modal()
          },
        });

      },
      toReceptor(index) {
        var form = $("<form>");
        form.attr("style", "display:none");
        form.attr("target", "");
        form.attr("method", "post");
        form.attr("action", "receptor.jsp");

        var input = $("<input>");
        input.attr("type", "hidden");
        input.attr("name", "receptor");
        var list = ${request.info.neuropeptideListStr}
            input.attr("value", JSON.stringify(list[index]));

        $("body").append(form);
        form.append(input);
        form.submit();
      }
    },
    created() {
      this.drugBank = String("${request.info.drugbank}")
      this.drugBankList = this.drugBank.split("#")
      this.chEMBL = String("${request.info.chEMBL}")
      this.chEMBLList = this.chEMBL.split('#')
      // this.$set(this.drugBank)
      // this.$set(this.drugBankList)

      this.drugCentral = String("${request.info.drugCentral}")
    },
    mounted() {
      console.log("----hehe----")
      var neuropeptideList = ${request.info.neuropeptideListStr}
          console.log(neuropeptideList)
      if (neuropeptideList != null && neuropeptideList.length) {
        this.list = neuropeptideList

      } else {
        console.log("not exist")
      }

      // 数据 by engow
      var accessNum = String("${request.info.accessNum}")
      this.NPID = accessNum
      var name = String("${request.info.name}")
      var organism = String("${request.info.organism}")
      var taxaId = String("${request.info.taxaId}")
      var lineage = String("${request.info.lineage}")
      var func = String("${request.info.function}")
      var tissueSpecifity = String("${request.info.tissueSpecifity}")
      console.log("?????" + tissueSpecifity)
      var family = String("${request.info.family}")
      var uniProtID = String("${request.info.unitProt_ID}")
      var pdbId = String("${request.info.pdb}")
      var stringId = String("${request.info.stringId}")
      var gene = String("${request.info.gene}")
      var Reactome = String("${request.info.reactome}")
      var GuidetoP = String("${request.info.guidetop}")
      var Neuropeptide = String("${request.info.neuropeptide}")
      this.pi = String("${request.info.pi}")
      this.mw = String("${request.info.mw}")

      this.drugBank = String("${request.info.drugbank}")
      this.drugBankList = this.drugBank.split("#")
      this.chEMBL = String("${request.info.chEMBL}")
      this.chEMBLList = this.chEMBL.split('#')
      // this.$set(this.drugBank)
      // this.$set(this.drugBankList)

      this.drugCentral = String("${request.info.drugCentral}")
      this.complexPdb = String("${request.info.complexPdb}")
      let tempComplexPdbList = this.complexPdb.split("$");
      for (let i = 0; i < tempComplexPdbList.length; i++) {
        let item = tempComplexPdbList[i].split(";");
        this.complexPdbList.push(item)
      }
      if (this.complexPdb != 'NA' && this.complexPdb != '')
        this.pdbtext2 = this.complexPdbList[0][1] + '_' + this.complexPdbList[0][4].trim() + '_' + this.complexPdbList[0][5].replace(',', '_').trim()
      console.log("------------drugbanketeste---" + this.drugBank);
      console.log(this.drugBankList);
      console.log(this.chEMBL)
      console.log(this.drugCentral);
      console.log("-----------", Neuropeptide)
      //CZQ 处理Neuropeptide数据
      if (Neuropeptide == "NA") {
        this.Neuropeptide = []
        $("#neu").html("NA");
      } else {
        let Neuropeptides = Neuropeptide.split("$")

        for (let i = 0; i < Neuropeptides.length; i++) {
          let NeuropeptidesTemp = Neuropeptides[i].split("//");
          //TODO
          //NeuropeptidesTemp[2]=NeuropeptidesTemp[2].split("#")
          this.NeuropeptideArray.push(NeuropeptidesTemp)
        }
        //console.log("-----------",this.NeuropeptideArray)

      }


      var modification = String("${request.info.modification}")
      var sequence = String("${request.info.sequence}")
      //var pubmedId = String('${request.info.pubmedId}')
      this.Name = name
      this.family = family
      var NPID = String("${request.info.accessNum}")
      var organism = String("${request.info.organism}")
      console.log(organism)
      this.Organism = organism

      var Length = String("${request.info.length}")
      console.log("Length")
      console.log(Length)
      this.Length = Length
      var modification = String("${request.info.modification}");
      console.log(modification)
      this.Modification = modification
      var Sequence = String("${request.info.sequence}")
      console.log("Sequence")
      console.log(Sequence)

      var UniProtID = String("${request.info.unitProt_ID}")
      console.log("UniProtID")
      console.log(UniProtID)
      this.UniprotID = UniProtID
      //处理Reference
      //TODO
      //var reference = String(`${request.info.pubmedId}`)
      //reference=reference.split("//")
      //this.Reference = reference
      //this.pmid=this.Reference[0];
      //this.Reference=this.Reference.splice(1);

      //处理reference
      var reference = String(`${request.info.pubmedId}`);

      if (reference != null && reference != "" && reference != "NA") {
        var ref_html = '<table><tr><td style="width: 80%; text-align: center">Article</td><td style="width: 20%; text-align: center">PMID</td></tr>';
        reference = reference.split("$");
        for (var i in reference) {
          var item = reference[i].split("//");
          ref_html += '<tr><td style="width: 80%">'
          for (let i = 1; i < item.length; i++) {
            ref_html += item[i];
          }
          ref_html += '</td><td style="width: 20%; text-align: center"><a href="http://www.ncbi.nlm.nih.gov/pubmed/?term=' + item[0] +
              '" target="_blank">' + item[0] + '</a></td></tr>';
        }
        ref_html += "</table>";
        $("#ref").html(ref_html);
      } else {
        $("#ref").html("NA");
      }
      //处理funcition
      this.Function = func;
      //this.Function=func.split(".");
      // if(this.Function.length>0)
      //     this.Function.splice(this.Function.length-1,1);

      var pdb = String("${request.info.pdb}");
      //console.log("PDB",pdb)
      this.pdb = pdb
      <%--var t = String("${request.info.tISSUE_SPECIFITY}")--%>
      <%--console.log(t)--%>
      var goinfo = String("${request.info.goinfo}");


      //czq 对goinfo进行处理
      goinfo = goinfo.split("#");
      //每种最多只展示三个 多的不展示
      var countP = 0, countF = 0, countC = 0;
      //console.log("goinfo----",goinfo)
      for (let i = 0; i < goinfo.length; i++) {
        let temp = {};
        let item = goinfo[i].split(";");
        console.log("goinfo----", item)
        temp.first = item[0];
        temp.forth = item[2].replace(/(^\s)|(\s*$)/g, "").substring(0, 3);
        //temp.forth=item[2];
        //分开合并的两列
        let vary = item[1].split(":")
        //console.log(vary)
        temp.third = vary[1].replace(/(^\s)|(\s*$)/g, "");

        if (vary[0].indexOf("P") != -1) {
          temp.second = "Biological Process";
          countP++;
          if (countP <= 3)
            this.goinfoArray.push(temp);
        } else if (vary[0].indexOf("F") != -1) {
          temp.second = "Molecular Function";
          countF++;
          if (countF <= 3)
            this.goinfoArray.push(temp);
        } else if (vary[0].indexOf("C") != -1) {
          temp.second = "Cellular Component";
          countC++;
          if (countC <= 3)
            this.goinfoArray.push(temp);
        }
      }
      //console.log("goinfo----",this.goinfoArray)


      // if (goinfo != null && goinfo != "" && goinfo != "NA") {
      //     this.goinfoStore = goinfo.split(",")
      //     this.goinfo = this.goinfoStore.slice(0,3)
      // }else{
      //     this.goinfoStore = []
      //     this.goinfo = this.goinfoStore
      // }

      this.NPID = NPID
      this.Name = name
      this.Organism = organism
      this.NCBI = taxaId
      this.Lineage = lineage
      this.Length = Length

      // modification.forEach(function(item){
      //     item = item.split("#")
      // })
      if (modification == "NA") {
        this.Modification = ""
      } else {
        var m = modification.split("$")
        for (let i = 0; i < m.length; i++) {
          let each = {}
          each.first = m[i].split("#")[0]
          each.second = m[i].split("#")[1]
          each.thrid = m[i].split("#")[2]
          //m[i] = m[i].split("#")
          m[i] = each
        }
        this.Modification = m
      }

      this.Sequence = sequence
      var sub_count = Math.floor((sequence.length) / 10);
      console.log(sub_count);
      $('#sequence').html("");
      let sequenceTable = "<table style='font-family:  Consolas;font-size: 18px;color: #2aabd2 ' frame=void >";
      for (var i = 0; i < sub_count; i++) {
        if (i % 5 == 0)
          sequenceTable += "<tr>"
        sequenceTable += "<td style='border-style:none;'>" + sequence.substr(i * 10, 10);
        var sub = "[" + (i + 1) * 10 + "]"
        sequenceTable += sub.sub() + "</td>";
        if (i % 5 == 4)
          sequenceTable += "</tr>"
      }
      if (sequence.substr(i * 10) != '')
        sequenceTable += "<td style='border-style:none;'>" + sequence.substr(i * 10) + "</td>" + "</table>"
      else
        sequenceTable += "</table>"
      $('#sequence').html(sequenceTable);
      this.TissueSpecificity = tissueSpecifity
      console.log("test===============================")
      console.log(tissueSpecifity)


      this.UniprotID = uniProtID
      //console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
      //console.log(pdbId)
      if (pdbId == "NA") {
        this.PDBID = ""
      } else {
        this.PDBID = pdbId.split(";")
        //console.log(this.PDBID)
      }
      this.STRID = stringId
      this.gene = gene;
      this.Reactome = Reactome;
      if (Reactome != "NA") {
        this.Reactome = Reactome.split("#");
      }
      this.GuidetoPHARMACOLOGY = GuidetoP;
      console.log("this.STRID", stringId)
      // if(Neuropeptide=="NA"){
      //     this.Neuropeptide = ""
      // }else {
      //     this.Neuropeptide = Neuropeptide.split("#")
      //     console.log("----",this.Neuropeptide)
      // }


      var lineageArray = lineage.split("#")
      this.Lineage = lineageArray

      /* Network Chart*/
      let cdata = {
        type: "force",
        categories: [
          {
            name: "aaa"
          }, {
            name: "bbb"
          }
        ],
        nodes: [
          {
            name: "name1",
            value: 10,
            id: 1
          }, {
            name: "name2",
            value: 10,
            id: 2
          }, {
            name: "name3",
            value: 10,
            id: 3
          }
        ],
        links: [
          {
            source: 1,
            target: 2
          }, {
            source: 1,
            target: 3
          }, {
            source: 2,
            target: 3
          }
        ]
      }

      /* var myChart = echarts.init(document.getElementById('mychart'));
      myChart.hideLoading();
      var nodes =







      ${request.info.nodesStr}
            var lines =







      ${request.info.linesStr}
                nodes = this.lineFilter(nodes)
            lines = this.lineFilter(lines)
            console.log("lines ===========================")
            console.log(lines)
            if(!nodes.length)
                this.network = 0
            var mydata = []
            let myedge = []
            nodes.forEach(function(item){
                let o = {}
                o.name = item.name
                o.category = item.value
                mydata.push(o)
            })
            lines.forEach(function(item){
                let o = {}
                o.source = item.source
                o.target = item.traget
                myedge.push(o)
            })
            var option = {
                legend: {
                    data: ['HTMLElement', 'WebGL', 'SVG', 'CSS', 'Other']
                },
                series: [{
                    type: 'graph',
                    layout: 'force',
                    animation: false,
                    label: {
                        normal: {
                            position: 'right',
                            formatter: '{b}'
                        }
                    },
                    draggable: true,
                    data: mydata,
                    categories: cdata.categories,
                    force: {
                        // initLayout: 'circular'
                        // repulsion: 20,
                        edgeLength: 5,
                        repulsion: 100,
                        gravity: 0.1
                    },
                    lineStyle:{
                        normal: {
                            opacity: 0.9,
                            width: 2,
                            curveness: 0
                        }
                    },
                    edges: myedge
                }]
            };

            myChart.setOption(option); */

    },
    beforeUpdate() {
      <%--this.drugBank=String("${request.info.drugbank}")--%>
      <%--this.drugBankList=this.drugBank.split("#")--%>
      <%--this.chEMBL=String("${request.info.chEMBL}")--%>
      <%--this.$set(this.drugBank);--%>
      <%--this.$set(this.drugBankList);--%>
    },

  })
</script>
</body>

</html>


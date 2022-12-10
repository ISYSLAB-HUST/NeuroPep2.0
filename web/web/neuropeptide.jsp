<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>

<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neuropeptide Database - Search</title>
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
    <%--    <script src="https://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>--%>
    <script type="text/javascript" src="neuropeptide/js/3Dmol-min.js"></script>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>


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

      /*th,td{*/
      /*    text-align:center;!** 设置水平方向居中 *!*/
      /*    vertical-align:middle!** 设置垂直方向居中 *!*/
      /*}*/

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

      #hydrop .hydrophobic {
        color: black;
      }

      #hydrop .hydrophobic {
        color: black;

      }

      #hydrop .hydrophilic, #hydrop .nve, #hydrop .pve {
        color: #45b97c;

      }

      #charged .nve {
        color: red;
      }

      #charged .pve {
        color: blue;
      }

      .hydrophilic, .pve, .nve, .hydrophobic {
        padding-right: 2px;
        font-family: Consolas;
        font-size: 16px;
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
    <%--<script src="https://cdn.jsdelivr.net/npm/vue"></script>--%>
    <%--    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>--%>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>


    <link href="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.css" rel="stylesheet"/>
    <script src="https://www.itxst.com/package/bootstrap-table-1.15.3/bootstrap-table.js"></script>

</head>

<body id="Search">

<div id="wrapper">

    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container">

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

        <%--<div id="pagetitle"--%>
        <%--style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--Neuropeptide--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb"
            style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Neuropeptide</li>
        </ol>

        <%--<div id="app">--%>
        <%--{{ message }}--%>
        <%--<p>NPID<span>{{NPID}}</span></p>--%>
        <%--</div>--%>

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
                    <li><a href="#Physicochemical" data-toggle="tab">Physicochemical Properties</a></li>
                    <li><a href="#Receptors" data-toggle="tab" v-if="Receptor.length!=0">Receptors</a></li>
                    <li id="structureTab"><a href="#Structure" data-toggle="tab">Structure</a></li>
                    <li><a href="#Complex" data-toggle="tab" v-if="complexPdb!='NA' && complexPdb != ''">Complex
                        structure</a></li>
                    <li><a href="#Drug" data-toggle="tab"
                           v-if="drugBank.length !=0 || chEMBL.length!=0 || drugCentral.length!=0">Drug Information</a>
                    </li>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Basic">
                        <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                             role="alert">Basic
                            Information
                        </div>
                        <table class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"
                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">


                            <tr>
                                <td width="20%" class="title">NPID</td>
                                <td width="80%">{{NPID}}
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Name</td>
                                <td width="715">{{Name}}</td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Family</td>
                                <td width="715">{{family}}</td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Organism</td>
                                <td width="715">{{Organism}}
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">NCBI Taxa ID</td>
                                <td width="715">
                                    <%--                                    <a href='http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?lvl=0&id=<s:property value="#request.info.Taxa_ID" />'--%>
                                    <%--                                       target="_blank"><s:property value="#request.info.Taxa_ID"/>--%>
                                    <%--                                    </a>--%>
                                    <s:if test="#request.info.Taxa_ID!='NA'">
                                        <a href='http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?lvl=0&id=<s:property value="#request.info.Taxa_ID" />'
                                           target="_blank"><s:property value="#request.info.Taxa_ID"/>
                                        </a>
                                    </s:if>
                                    <s:else>
                                        NA
                                    </s:else>
                                </td>
                            </tr>
                            <tr>
                                <td width="255" class="title">Lineage</td>
                                <td width="715">
                                    <div style="display: inline-block;word-wrap:break-word; word-break:normal;"
                                         v-if="Lineage[0]!='NA'">
                                        <span style="color: black" v-for="(item,index) in Lineage"
                                              style="padding-left: 20px">
                                            <span v-if="index != Lineage.length-1">{{item}},</span>
                                            <span v-else>{{item}}.</span>
                                        </span>
                                    </div>
                                    <div style="display: inline-block" v-else>
                                        <span>NA</span>
                                    </div>
                                </td>
                            </tr>
                            <tr v-if="this.UniprotID!=='NA' && this.UniprotID!== ''">
                                <td width="255" class="title">UniProt ID</td>
                                <td width="715"><a :href="'http://www.uniprot.org/entry/'+UniprotID" target="_blank">{{UniprotID}}</a>
                                </td>
                            </tr>
                            <tr v-if="this.gene!=='NA' && this.gene !== ''">
                                <td width="255" class="title">Gene</td>
                                <td width="715">{{gene}}</td>
                            </tr>
                            <tr v-if="this.TissueSpecificity!=='NA' && this.TissueSpecificity !== ''">
                                <td width="255" class="title">Tissue Specificity</td>
                                <td width="715">
                                    <p style="overflow-wrap: break-word; word-break: normal; text-align: justify">
                                        <s:property value="#request.info.tISSUE_SPECIFITY"/>
                                    </p>
                                </td>
                            </tr>
                            <tr v-if="this.Function!=='NA' && this.Function !== ''">
                                <td width="255" class="title">Function</td>
                                <td width="715">
                                    <%--                <p v-for="(item,index) in Function">{{index+1}}.{{item}}</p>--%>
                                    <p style="overflow-wrap: break-word; word-break: normal; text-align: justify">
                                        {{Function}}</p>
                                </td>
                            </tr>
                            <tr v-if="goinfoArray.length!=0 && goinfoArray.length !== ''">
                                <td width="255" class="title">Gene Ontology</td>
                                <td width="715">
                                    <%--                                    <table class="neuropeptide table table-striped" align="center" border="border: 1px solid #666"--%>
                                    <%--                                           cellpadding="0" cellspacing="0" style="vertical-align: middle;">--%>
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
                            <tr v-if="this.STRID!=='NA' && this.STRID !== ''">
                                <td width="255" class="title">STRING ID</td>
                                <td width="715" v-if="this.STRID!=='NA'"><a
                                        :href="'https://string-db.org/network/'+STRID">{{STRID}}</a></td>
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
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">
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
                        <%--&lt;%&ndash;                                Overview of Protein Modification Sites with Functional and Accessible Surface Area&ndash;%&gt;--%>
                        <%--                            </div>--%>
                        <%--                            <div id="xiushitu" style="margin-bottom: 0px;width: 100%"  >--%>
                        <%--&lt;%&ndash;                                <table>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                    <tr style='font-family:  Consolas;font-size: 18px;color: #2aabd2 ' frame=void >&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                        <td v-for="item in Sequence">{{item}}</td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                    </tr>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                </table>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                <table class="neuropeptide table table-striped"  align="center" border="border: 1px solid #666"&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                       cellpadding="0" cellspacing="0" style="vertical-align: middle;">&ndash;%&gt;--%>

                        <%--&lt;%&ndash;                                    <tr v-if="this.Sequence!=='NA'">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                        <td width="20%" class="title">Experimental PTM sites</td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                        <td width="60%" id="sequenceRef" style='font-family:  Consolas;font-size: 18px;color: black ' frame=void >&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                            <div style="display: inline-block" v-for="(item,indexs) in Sequence">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="(indexs+1)%5==0" >&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                    {{item}}<sub>{{'['+(indexs+1)+']'}}</sub>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                </span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <div style="display: inline-block" v-else>{{item}}</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                <div v-for="(value, key,index) in mcmap">&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                    <div v-if="indexs+1==value[1]">&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='Amidation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='Pyroglutamination'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='Phosphorylation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='Sulfation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='Acetylation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='oxidation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        <span v-if="indexs+1==value[1]&&value[0]=='hydroxylation'" style="color: #a94442;">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                    </div>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                    <div v-else>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                        {{item}}&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                    </div>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;&lt;%&ndash;                                                  <span v-if="isColors(indexs+1)">{{item}}</span>&ndash;%&gt;&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                            &ndash;%&gt;--%>

                        <%--&lt;%&ndash;                                        </td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                        <td width="20%" v-if="this.mcmap">&ndash;%&gt;--%>


                        <%--&lt;%&ndash;                                            <div v-for="(value, key,index) in mcmap" :key="key">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'Amidation'" style="color: #a94442;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'Pyroglutamination'" style="color: #06f;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'Phosphorylation'" style="color: #3c763d;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'Sulfation'" style="color: #8a6d3b;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'Acetylation'" style="color: #f60;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'oxidation'" style="color: #4ae809;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                                <span v-if="value[0] == 'hydroxylation'" style="color: #030915;font-weight:bold;">{{value[0]}}-{{value[1]}}&nbsp</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                        </td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                    </tr>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                                </table>&ndash;%&gt;--%>

                        <%--                            </div>--%>
                        <%--&lt;%&ndash;                            <div style="width: 900px;height: 400px;margin-top: 20px" id="asa-graph">test</div>&ndash;%&gt;--%>
                        <%--                        </div>--%>
                    </div>
                    <div class="tab-pane fade" id="Physicochemical">
                        <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                             role="alert">
                            Physico-chemical Properties
                        </div>
                        <div style="padding-left:40px;text-align: left">
                            <div style="padding-bottom: 15px;">
                                <b style="font-weight: bold;">Molecular weight:</b> {{pi}}
                                <br/>
                                <b style="font-weight: bold;">Theoretical pI:</b> {{mw}}
                                <br/>
                                <b style="font-weight: bold;">Sequence:</b>{{Sequence}}
                            </div>
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
                            <%--                                Total number of hydrophilic residues: <font id="hydrophilic_count"> </font><br/>--%>
                            <%--                            </div>--%>
                            <div id="analyze_text" style="display: none;">
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor=red
                                       style="margin:10px 0px;">
                                    <tr>
                                        <td rowspan=2>Amino Acid Polarity</td>
                                        <td>Hydrophobic</td>
                                        <td colspan=2>Hydrophilic</td>
                                    </tr>
                                    <tr>
                                        <td><span id="hydrophobic_count"></span></td>
                                        <td colspan=2><span id="hydrophilic_count"></span></td>
                                    </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor=red>
                                    <tr>
                                        <td rowspan=2>Amino Acid Charge</td>
                                        <td>+vely charged</td>
                                        <td>-vely charged</td>
                                        <td>Neutral Amino acid</td>
                                    </tr>
                                    <tr>
                                        <td><span id="pve"></span></td>
                                        <td><span id="nve"></span></td>
                                        <td><span id="nac"></span></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                             role="alert" id="histogramsOfPhysicoChemicalPropertiesDivShow">Histograms of
                            physico-chemical properties
                        </div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu1"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu2"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu3"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu4"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu5"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu6"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu7"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu8"></div>
                        <div style="width: 900px;height: 200px;margin-top: 20px" id="zhifangtu9"></div>
                        <div id="hydropathyPlotsDivShow">
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">hydropathy
                                plots
                            </div>
                            <div style="width: 900px;height: 400px;margin-top: 20px" id="qinshuixing"></div>
                        </div>
                        <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                             role="alert">Amino Acids
                            Composition
                        </div>
                        <div id="aacomposition" style="width: 900px;height: 400px;" class="highchart"></div>
                    </div>
                    <div class="tab-pane fade" id="Structure">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">
                                Stucture
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
                                <%--                                    <td  width="255" class="title">Sequence</td>--%>
                                <%--                                    <td  width="715">--%>
                                <%--                                        <div  id="sequence"></div>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <%--                                <tr>--%>
                                <%--                                    <td width="255" class="title">Properties</td>--%>
                                <%--                                    <td width="715">--%>
                                <%--                                        <a class="btn btn-primary btn-md" onclick="toPropeties()" href="javascript:void(0);" style="color:white">View</a>--%>
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

                                                </div>
                                                <div style="margin-top:15px;color: #3d6db6;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">
                                                    The 3D Structure of {{NPID}}
                                                    <span style="margin-left: 8px">
                                                        <a id="dowloadpdb3" :href="'./jmol/pdb/nppdb/'+NPID+'.pdb'"
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
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>


                                <%--<tr v-if="this.PDBID!==''">--%>
                                <%--<td width="255" class="title">PDB ID</td>--%>
                                <%--<td width="715">--%>
                                <%--<div v-for="(item,index) in PDBID">--%>
                                <%--{{item}}--%>
                                <%--</div>--%>
                                <%--</td>--%>
                                <%--</tr>--%>


                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Complex">
                        <div v-if="complexPdb!='NA' && complexPdb != ''">
                            <div style="margin-bottom: 0px;height: 50px;line-height: normal" class="alert alert-info"
                                 role="alert">Complex
                                Structure
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
                                                        <a v-if="item[4] && item[5]"
                                                           :href="'./jmol/pdb/'+item[1]+'_'+item[4].trim()+'_'+item[5].replace(',','_').trim()+'.pdb'"
                                                           style="margin-left: 2px;margin-top: 2px">
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                 width="16"
                                                                 height="16" fill="currentColor"
                                                                 class="bi bi-download"
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

                                                <div id="pdbtext2" style="margin-top:50px;width: 353px">
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
                                    </td>


                                </tr>


                                <%--
                                                                <tr v-if="pdb!='NA'&&pdb!=''">

                                                                    <td>

                                                                    </td>
                                                                </tr>
                                --%>


                            </table>


                        </div>
                    </div>
                    <div class="tab-pane fade" id="Receptors">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px; line-height: normal" class="alert alert-info"
                                 role="alert">
                                Receptors
                            </div>
                            <table class="neuropeptide table table-striped" align="center"
                                   border="border: 1px solid #666"
                                   cellpadding="0" cellspacing="0" style="vertical-align: middle;">

                                <tr>
                                    <td width="255" class="title">Receptor</td>
                                    <td id="rec" width="715">
                                        <%--                <div v-for="(recp_item,index) in list">--%>
                                        <%--                    <a href="javascript:void(0);" @click="toReceptor(index)" :data-index="index">{{recp_item.entryName}}</a><span style="color:#06F;" v-if="index<list.length-1">; </span>--%>
                                        <%--                </div>--%>
                                        <table class="neuropeptide table table-striped" align="center"
                                               border="border: 1px solid #666"
                                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                                            <tr>
                                                <th width="184" style="text-align:center;">NPRID</th>
                                                <th width="184" style="text-align:center;">Uniport_ID</th>
                                                <th width="184" style="text-align:center;">STRING_ID</th>
                                                <th width="184" style="text-align:center;">Reactome_ID
                                                </th>
                                                <th width="184" style="text-align:center;">IUPHAR_ID
                                                </th>
                                            </tr>
                                            <tr v-for="(item,index) in Receptor">
                                                <td width="184" align="center">
                                                    <a :href="'searchReceptor_info?pepNum='+item[0]" target="_blank">{{item[0]}}</a>
                                                </td>
                                                <td width="184" align="center">
                                                    <a v-if="item[1] != 'NA'"
                                                       :href="'http://www.uniprot.org/entry/'+item[1]" target="_blank">{{item[1]}}</a>
                                                    <span v-else>{{item[1]}}</span>
                                                </td>
                                                <td width="184" align="center">
                                                    <a v-if :href="'https://string-db.org/network/'+item[2]"
                                                       target="_blank">{{item[2]}}</a>
                                                    <span v-else>{{item[2]}}</span>
                                                </td>
                                                <td width="184" align="center">
                                                    <div v-for="aitem in item[3]">
                                                        <a v-if :href="'https://reactome.org/content/detail/'+aitem"
                                                           target="_blank">{{aitem}}</a>
                                                        <span v-else>{{aitem}}</span>
                                                    </div>
                                                </td>
                                                <td width="184" align="center">
                                                    <a v-if
                                                       :href="'https://www.guidetopharmacology.org/GRAC/ObjectDisplayForward?objectId='+item[4]"
                                                       target="_blank">{{item[4]}}</a>
                                                    <span v-else>{{item[4]}}</span>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>


                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Drug">
                        <div>
                            <div style="margin-bottom: 0px;height: 50px" class="alert alert-info" role="alert">Drug
                                Information
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
                                    <td v-if="drugBank!=''">
                                        <span v-for="(value,index) in drugBankList">
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
                                               v-if="index != chEMBLList.length-1">{{value}},</a>
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
    <!-- close div#container -->

    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
<script type="text/javascript" src="neuropeptide/js/highcharts.src.js"></script>
<script type="text/javascript">
</script>
<script type="text/javascript">
  var sequence = String("${request.info.sequence}");
  var categories = ['A',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'K',
    'L',
    'M',
    'N',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'V',
    'W',
    'Y',
  ];

  var Hydrophobic = ['V', 'L', 'I', 'F', 'C', 'P', 'A', 'M', 'W'];
  var Hydrophilic = ['N', 'Q', 'S', 'T', 'G', 'H', 'Y'];
  var positive_ve = ['R', 'K'];
  var negative_ve = ['E', 'D'];
  var aacomposition = ${request.aacompostion};

  var hydrophobic_count = 0;
  var hydrophilic_count = 0;
  var pve_count = 0;
  var nve_count = 0;
  var aa_composition = {
    chart: {
      type: 'column',
      margin: [50, 50, 100, 80],
      zoomType: 'x'
    },
    title: {
      text: 'Amino Acids Composition'
    },
    subtitle: {
      text: ''
    },
    xAxis: {
      categories: categories,
    },
    yAxis: {
      min: 0,
      title: {
        text: 'Amino Acid % Composition of Peptide'
      }
    },
    legend: {
      enabled: false
    },
    tooltip: {
      pointFormat: 'frequency: <b>{point.y} %</b>',
    },
    series: [{
      data: aacomposition,
    }]
  };
  $(document).ready(function () {
    $('#aacomposition').highcharts(aa_composition);
    cc(sequence);
    console.log(sequence);
    console.log("${request.aacompostion}");
    console.log(aa_composition);
  });

  // $(function () {
  //     var buildChart = function(){
  //         $('#aacomposition').highcharts(aa_composition);
  //     }
  //     buildChart()
  // })

  function cc(seq) {
    var aa;
    var sequence = "";
    for (var i = 0; i < seq.length; i++) {
      aa = seq.charAt(i);
      if (i % 80 == 0) {
        sequence += '<br />'
      }
      if (Hydrophobic.in_array(aa)) {
        console.log(aa);
        hydrophobic_count++;
        sequence += '<strong class="hydrophobic">' + aa + '</strong>';
      } else if (Hydrophilic.in_array(aa)) {
        hydrophilic_count++;
        sequence += '<strong class="hydrophilic">' + aa + '</strong>';
      } else if (positive_ve.in_array(aa)) {
        pve_count++;
        hydrophilic_count++;
        sequence += '<strong class="pve">' + aa + '</strong>';
      } else if (negative_ve.in_array(aa)) {
        nve_count++;
        hydrophilic_count++;
        sequence += '<strong class="nve">' + aa + '</strong>';
      } else {
        sequence += '<font>' + aa + '</font>';
      }
    }
    console.log(sequence);
    console.log(hydrophilic_count);
    console.log(hydrophobic_count);

    $("#charged").html(sequence);
    $("#nve_count").html(nve_count);
    $("#pve_count").html(pve_count);

    $("#hydrop").html(sequence);
    $("#hydrophilic_count").html(hydrophilic_count);
    $("#hydrophobic_count").html(hydrophobic_count);

  }

  Array.prototype.in_array = function (e) {
    for (var i = 0; i < this.length; i++) {
      if (this[i] == e)
        return true;
    }
    return false;
  }


</script>

<script type="text/javascript">


  //定义全局的viewer对象
  let viewer;
  let molType = "cartoon";
  let viewer1;
  let molType1 = "cartoon";
  let viewer3;
  let molType3 = "cartoon";


  // var $table = $('#table'),
  //     $button = $('#button'),
  //     $button2 = $('#button2');
  //
  // $(function () {
  //     $button.click(function () {
  //         $table.bootstrapTable('expandRow', 1);
  //     });
  //     $button2.click(function () {
  //         $table.bootstrapTable('collapseRow', 1);
  //     });
  // });


  $(document).ready(function () {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // 获取已激活的标签页的名称
      var activeTab = $(e.target).text();
      // 获取前一个激活的标签页的名称
      var previousTab = $(e.relatedTarget).text();
      $(".active-tab span").html(activeTab);
      $(".previous-tab span").html(previousTab);
    });

    //绘制直方图和亲水性图
    let phyProperties = String("${request.info.phyProperties}");
    let hydropathy = String("${request.info.hydropathy}");
    if (hydropathy == '' || hydropathy == 'NA') {
      $("#hydropathyPlotsDivShow").hide();
    } else {
      $("#hydropathyPlotsDivShow").show();
    }
    //绘制亲水性图
    hydropathy = hydropathy.split("#")
    let hyMin = 100, hyMax = -100;
    for (let i = 0; i < hydropathy.length; i++) {
      hyMax = Math.max(hyMax, hydropathy[i])
      hyMin = Math.min(hyMin, hydropathy[i])
    }
    let qinshuixingX = []
    for (let i = 0; i < hydropathy.length; i++)
      qinshuixingX.push(i + 1)
    let qinshuixingDom = document.getElementById('qinshuixing');
    let qinshuixingChart = echarts.init(qinshuixingDom);
    var option10;
    option10 = {

      title: {
        text: 'Hydropathy plot of NPID (Kyte & Doolittle)',
        left: 'center',
        textStyle: {//主标题的属性
          color: '#2169c2',//颜色
          fontSize: 16,//大小
          fontWeight: 400,//
        },
      },
      tooltip: {
        trigger: 'axis'
      },
      legend: {
        x: 'center',
        y: 'bottom',
        data: ['Hphob. OMH / Sweet et al.']
      },
      xAxis: {
        type: 'category',
        boundaryGap: false,
        splitLine: {show: true},
        data: qinshuixingX
      },
      yAxis: {
        type: 'value',
        axisLine: {onZero: false},

      },
      // dataZoom: [
      //
      //     {
      //         show: true,
      //         type: 'inside',
      //         filterMode: 'none',
      //         yAxisIndex: [0],
      //         startValue: hyMin,
      //         endValue: hyMax
      //     }
      // ],
      series: [
        {
          data: hydropathy,
          type: 'line',
          name: ['Hphob. OMH / Sweet et al.'],
          itemStyle: {
            normal: {
              color: '#ff00e5',
              lineStyle: {
                width: 3,
                shadowColor: 'rgba(0,0,0,0.3)',
                shadowBlur: 10,
                shadowOffsetY: 8
              },
            }
          },

        }
      ]
    };
    let NPIDtitle = String("${request.info.accessNum}")
    option10.title.text = 'Hydropathy plot of ' + NPIDtitle + ' (Kyte & Doolittle)';
    option10 && qinshuixingChart.setOption(option10);
    //绘制直方图
    phyProperties = phyProperties.split("$")
    let zhifangLen = 0;
    for (let i = 0; i < phyProperties.length; i++) {
      phyProperties[i] = phyProperties[i].split("#")

    }
    zhifangLen = phyProperties[0].length
    let zhifangtuDom = [];
    let zhifangChart = [];
    let zhifangX = [];
    let graghtitle = String("${request.info.accessNum}")
    let zhifangTitle = ["Tiny residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Small residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Aliphatic residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Aromatic residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Non-polar residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Polar residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Charged residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Positive residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
      "Negative residues in " + graghtitle + " from postion in 1 to " + zhifangLen,
    ];

    for (let i = 1; i <= phyProperties[0].length; i++)
      zhifangX.push(i);
    let zhifangOption;
    let colorList = ['#FFFF00', '#66CC00', '#00FFFF', '#FF99CC', '#FFCC66', '#CCCCCC', '#990000', '#0033CC', '#D9ED4F', '#E48E64', '#F697D4', '#8957A1', '#C38E32'];


    zhifangOption = {

      title: {
        text: 'ProtScale output for user_sequence',
        left: 'center',
        textStyle: {//主标题的属性
          color: '#2169c2',//颜色
          fontSize: 16,//大小
          fontWeight: 400,//
        },
      },
      grid: {
        height: 50
      },
      xAxis: {
        type: 'category',
        data: zhifangX,

      },
      yAxis: [
        {
          type: 'value',
          min: 0,
          max: 1,
          splitNumber: 1,
          position: 'left',
          splitLine: {
            show: false
          },
          axisTick: {
            show: false
          },
          // 刻度标签
          axisLabel: {
            show: false
          }
        },
        {
          type: 'value',
          position: 'right',
          axisTick: {
            show: false
          },
          // 刻度标签
          axisLabel: {
            show: false
          }
        }

      ],
      series: [
        {
          data: [],
          type: 'bar',
          barWidth: '100%',

          itemStyle: {
            color: '',
            borderWidth: 2,
            borderColor: '#333'
          },
        }
      ]
    };

    console.log('test-dragh8----------' + phyProperties[7]);

    function isallZero(value) {
      return value == 0;
    }

    if (phyProperties[7].every(isallZero)) {
      console.log("都为0");
    } else {
      console.log("不全为0");
    }
    let histogramsOfPhysicoChemicalPropertiesDivShow = false
    for (let i = 1; i <= 9; i++) {
      zhifangtuDom.push(document.getElementById('zhifangtu' + i));
      zhifangChart.push(echarts.init(zhifangtuDom[i - 1]));
      zhifangOption.series[0].data = phyProperties[i - 1]
      zhifangOption.series[0].itemStyle.color = colorList[i - 1]
      zhifangOption.title.text = zhifangTitle[i - 1]
      //全为0的数据不渲染
      if (phyProperties[i - 1].every(isallZero)) {
        $('#zhifangtu' + i).css('display', 'none');
        continue;
      }
      histogramsOfPhysicoChemicalPropertiesDivShow = true
      zhifangOption && zhifangChart[i - 1].setOption(zhifangOption);
    }
    if (histogramsOfPhysicoChemicalPropertiesDivShow == true) {
      $('#histogramsOfPhysicoChemicalPropertiesDivShow').show();
    } else {
      $('#histogramsOfPhysicoChemicalPropertiesDivShow').hide();
    }

    let PredictASA = String("${request.info.predictASA}");
    PredictASA = PredictASA.split("#")
    let RealASA = String("${request.info.realASA}");
    RealASA = RealASA.split("#")
    let RealASAPos = String("${request.info.realASAPos}");
    RealASAPos = RealASAPos.split("-");
    console.log("--!!!!!!!!!!-------" + PredictASA + "---------")
    console.log("-----------" + RealASA + "----------")
    console.log("------RealASAPos------" + RealASAPos + "--------")
    // let asaMax = 1,asaMin=0;
    // for(let i=0;i < PredictASA.length;i++){
    //     asaMax = Math.max(asaMax,PredictASA[i]);
    //     asaMin = Math.max(asaMin,PredictASA[i]);
    // }
    // let  asaX = [];
    // for(let i =0;i<PredictASA.length;i++){
    //     asaX.push(i+1)
    // }
    // console.log('testasxxxxx!!!!'+asaX);
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
    //         },
    //     },
    //     tooltip: {
    //         trigger: 'axis'
    //     },
    //     legend: {
    //         x:'center',
    //         y:'bottom',
    //         data: ['Predicted ASA']
    //     },
    //     xAxis: {
    //         type: 'category',
    //         boundaryGap: false,
    //         splitLine: { show: true } ,
    //         data: asaX,
    //         // axisLabel:{interval: 0},
    //         // splitArea : {show : false}
    //     },
    //     yAxis: {
    //         type: 'value',
    //         axisLine: { onZero: false },
    //         splitLine: { show: false }
    //         // splitArea : {show : false}
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
    // optionAsa.xAxis.data = asaX;
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


    var res = "${request}";
    var pdb = String("${request.info.pdb}");
    let sequence = String("${request.info.sequence}");
    var goinfo = String("${request.info.goinfo}");
    //var modification = String("${request.info.modification}");
    console.log("res")
    console.log(pdb)
    console.log(sequence)
    console.log("goinfo", goinfo)
    //console.log(modification)

    console.log("--------engow-------------")

    var nodes =
    ${request.info.nodesStr}
    var lines = ${request.info.linesStr}

        console.log(nodes)
    console.log(lines)

    // if (goinfo != null && goinfo != "") {
    //     if (goinfo == "NA") {
    //         $("#Goinfo").html("NA");
    //     } else {
    //         var goinfo_html = '<table width="100%" cellspacing="0" cellpadding="3" border="0">' +
    //             '<tr><td width="20%" class="style1">GO ID</td><td width="27%" class="style1">GO Term</td><td width="38%" class="style1">Definition</td><td width="15%" class="style1"><a href="http://www.geneontology.org/GO.evidence.shtml" target="_blank"><div class="style1">Evidence</div></a></td></tr>';
    //         goinfo = goinfo.split("#");
    //         for (var i in goinfo) {
    //             goinfo_html += "<tr>";
    //             var item = goinfo[i].split(";");
    //             for (var j in item) {
    //                 if (j == 0) {
    //                     goinfo_html += '<td><a href="http://amigo.geneontology.org/cgi-bin/amigo/term_details?term=' + item[j].trim() + '" target="_blank">' + item[j] + '</a></td>';
    //                 } else {
    //                     goinfo_html += '<td>' + item[j] + '</td>';
    //                 }
    //             }
    //             goinfo_html += "</tr>";
    //         }
    //         goinfo_html += "</table>";
    //         $("#Goinfo").html(goinfo_html);
    //     }
    // }

    // if (modification != null && modification != "") {
    //     var modification_html = '<table width="100%" cellspacing="0" cellpadding="3" border="0">' +
    //         '<tr><td width="50%" class="style1">Modification</td>' +
    //         '<td width="20%" class="style1">Residue</td>' +
    //         '<td width="15%" class="style1">Start</td>' +
    //         '<td width="15%" class="style1"><div class="style1">End</div></td></tr>';
    //     modification = modification.split("$");
    //     for (var i in modification) {
    //         modification_html += "<tr>";
    //         var item = modification[i].split("#");
    //         modification_html += '<td>' + item[2] + '</td>';
    //         modification_html += '<td>' + item[1] + '</td>';
    //         modification_html += '<td>' + item[0] + '</td>';
    //         modification_html += '<td>' + item[0] + '</td>';
    //         modification_html += "</tr>";
    //     }
    //     modification_html += "</table>";
    //     $("#ModificationInfo").html(modification_html);
    // } else {
    //     $("#ModificationInfo").html("NA");
    // }

    //处理pdb
    if (pdb != null && pdb != "NA") {
      var pdb_html = '<table width="100%" cellspacing="0" cellpadding="3" class="table table-striped" border="0">' +
          '<tr>' +
          '<td style="text-align: center" width="15%" class="style1">PDB</td>' +
          '<td style="text-align: center" width="15%" class="style1">Method</td>' +
          '<td style="text-align: center" width="15%" class="style1">Resolution</td>' +
          '<td style="text-align: center" width="10%" class="style1">Chain</td>' +
          '<td style="text-align: center"width="15%" class="style1">Position</td>' +
          '<td style="text-align: center" width="15%" class="style1">Download PDB</td>' +
          '<td style="text-align: center" width="15%" class="style1">RCSB-PDB</td></tr>';
      let pdblist = pdb.split("$");
      //用来存储第一次展示的PDB
      var firstPdb = "";

      var firstItem = pdblist[0].split(";");
      var firstItemTmp = []
      if (firstItem[3]) {
        firstItemTmp = firstItem[3].split("=");
      }
      firstPdb = firstItem[0].trim() + '_' + firstItemTmp[0].split('/')[0].trim();
      $("#pdbtext").html("The 3D structure of " + firstPdb)
      //firstPdb=firstItem[0].trim()


      $(function () {
        let element = $('#container-01');
        let config = {backgroundColor: 'white'};
        viewer = $3Dmol.createViewer(element, config);
        let pdbUri = './jmol/pdb/' + firstPdb + '.pdb';
        $('#dowloadpdb').attr("href", pdbUri);
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


      for (let i = 0; i < pdblist.length; i++) {
        pdb_html += "<tr>";
        console.log("----" + pdblist[i])
        var item = pdblist[i].split(";");
        if (item.length != 4) continue;
        let tmp = item[3].split("=");
        //pdb_html += '<td><a href="pdb.jsp?pdbName=' + item[0].trim() + tmp[0].split('/')[0].trim() + '" target="_blank">' + item[0] + '</a></td>';
        pdb_html += '<td style="text-align: center"><a onclick="molChange(' + "'" + item[0].trim() + '_' + tmp[0].split('/')[0].trim() + "'" + ')">' + item[0] + '</a></td>';

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

    let NPID = String("${request.info.accessNum}")
    if (pdb == null || pdb == "NA") {
      $(function () {
        let element3 = $('#container-03');
        let config3 = {backgroundColor: 'white'};
        viewer3 = $3Dmol.createViewer(element3, config3);
        let pdbUri3 = './jmol/pdb/nppdb/' + NPID.trim() + '.pdb';
        jQuery.ajax(pdbUri3, {
          success: function (data) {
            let v = viewer3;
            v.addModel(data, "pdb");                       /* load data */
            v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            v.zoomTo();                                      /* set camera */
            v.render();                                      /* render scene */
            v.zoom(1.2, 1000);                               /* slight zoom */
            $("#structureTab").show()
          },
          error: function (hdr, status, err) {
            console.error("Failed to load PDB " + pdbUri3 + ": " + err);
            // $('#predictStru').css("display:none");
            $("#pdbbox3").html("NA")
            // $("#message").modal()
            $("#structureTab").hide()
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
    if (complexPdb1 != '' && complexPdb1 != 'NA') {
      $(function () {
        let element1 = $('#container-02');
        let config1 = {backgroundColor: 'white'};
        viewer1 = $3Dmol.createViewer(element1, config1);
        let pdbUri1 = './jmol/pdb/' + pdbitem1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim() + '.pdb';

        $('#downloadpdb2').attr("href", pdbUri1);
        jQuery.ajax(pdbUri1, {
          success: function (data) {
            let v1 = viewer1;
            v1.addModel(data, "pdb");
            v1.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms *//* load data */
            v1.setStyle({chain: item4.split(",")[0].trim()}, {stick: {colorscheme: 'yellowCarbon'}});  /* style all atoms */
            v1.setStyle({chain: item5.split(",")[0].trim()}, {cartoon: {color: 'spectrum'}});

            v1.zoomTo();                                      /* set camera */
            v1.render();                                      /* render scene */
            v1.zoom(1.2, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {
            console.error("Failed to load PDB " + pdbUri1 + ": " + err);
            pdbUri1 = './jmol/pdb/nppdb/' + pdbitem1 + '.pdb';
            jQuery.ajax(pdbUri1, {
              success: function (data) {
                let v1 = viewer1;
                v1.addModel(data, "pdb");                       /* load data */
                v1.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
                v1.zoomTo();                                      /* set camera */
                v1.render();                                      /* render scene */
                v1.zoom(1.2, 1000);                               /* slight zoom */
              },
              error: function (hdr, status, err) {
                console.error("Failed to load PDB " + pdbUri1 + ": " + err);
                $("#message").modal()
                // $("#pdbbox1").html("")
              },
            });
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
      var ref_html = '<table style="width: 100%"><tr><td style="width: 80%; text-align: center">Article</td><td style="width: 20%; text-align: center">PMID</td></tr>';
      reference = reference.split("$");
      for (var i = 0; i < reference.length; i++) {
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
  });

  //切换数据
  function molChange(pdb) {
    let pdbUri = './jmol/pdb/' + pdb + '.pdb';
    jQuery.ajax(pdbUri, {
      success: function (data) {
        $("#pdbtext").html("The 3D structure of " + pdb)
        $('#dowloadpdb').attr("href", pdbUri);
        let element = $('#container-01');
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
        $("#message").modal()
        // $("#pdbbox").html("")
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
      sequenceList: [],

      pdbtext2: "",
      TissueSpecificity: "",

      Function: "",
      UniprotID: "",
      PDBID: "",
      GeneO: "",
      goinfo: "",
      goinfoArray: [],
      goinfoStore: "",
      STRID: "",
      gene: "",
      family: "",
      pmid: "",
      Properties: "",
      Receptor: [],
      Reference: [],
      pdb: "",
      network: 1,
      pi: "",
      mw: "",
      drugBank: "",
      drugBankList: [],
      chEMBL: "",
      chEMBLList: [],
      drugCentral: "",
      complexPdb: "",
      complexPdbList: [],
      taxa_id: '',


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
      mcmap: new Map(),
      cArray: []
    },
    methods: {
      receptorClick: function (e) {

      },
      handleSpace(item) {

        let itemN = item.replace(/\s*/g, "");
        console.log(itemN);
        return itemN;
      },
      //切换数据2
      molChange2(pdb1, item4, item5) {
        let pdbUri = './jmol/pdb/' + pdb1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim() + '.pdb';
        $('#downloadpdb2').attr("href", pdbUri);
        let _this = this
        jQuery.ajax(pdbUri, {
          success: function (data) {
            _this.pdbtext2 = pdb1 + '_' + item4.split(",")[0].trim() + '_' + item5.replace(',', '_').trim()
            let element = $('#container-02');
            let config = {backgroundColor: 'white'};
            viewer1 = $3Dmol.createViewer(element, config);
            let v = viewer1;
            v.addModel(data, "pdb");
            if (molType1 == "cartoon")
              v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
            else if (molType1 == "stick")
              v.setStyle({}, {stick: {color: 'spectrum'}});  /* style all atoms */
            else if (molType1 == "Sphere")
              v.setStyle({}, {sphere: {color: 'spectrum'}}); /* load data */
            v.setStyle({chain: item4.split(",")[0].trim()}, {stick: {colorscheme: 'yellowCarbon'}});  /* style all atoms */
            v.setStyle({chain: item5.split(",")[0].trim()}, {cartoon: {color: 'spectrum'}});  /* style all atoms */


            v.zoomTo();                                      /* set camera */
            v.render();                                      /* render scene */
            //v.zoom(1.0, 1000);                               /* slight zoom */
          },
          error: function (hdr, status, err) {
            //console.error( "Failed to load PDB " + pdbUri + ": " + err );
            $("#message").modal()
            //$("#pdbbox").html("")
          },
        });

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
      toReceptor(index) {
        var form = $("<form>");
        form.attr("style", "display:none");
        form.attr("target", "");
        form.attr("method", "post");
        form.attr("action", "receptor.jsp");

        var input = $("<input>");
        input.attr("type", "hidden");
        input.attr("name", "receptor");
        var list = ${request.info.receptorListStr}
            input.attr("value", JSON.stringify(list[index]));

        $("body").append(form);
        form.append(input);
        form.submit();
      }
    },
    mounted() {
      var receptorList = ${request.info.receptorListStr}
          console.log(receptorList)
      if (receptorList.length) {
        this.list = receptorList
        // receptorList = receptorList[0]
        // this.m_entryName = receptorList.entryName
        // this.m_geneName = receptorList.geneName
        // this.m_geneOnthologyIds = receptorList.geneOnthologyIds
        // this.m_id = receptorList.id
        // this.m_length = receptorList.length
        // this.m_organism = receptorList.organism
        // this.m_proteinFamily = receptorList.proteinFamily
        // this.m_proteinName = receptorList.proteinName
        // this.m_pubMedId = receptorList.pubMedId
        // this.m_sequence = receptorList.sequence
        // this.m_taxonomicLinege = receptorList.taxonomicLinege
        // this.m_tissueSpecificity = receptorList.tissueSpecificity
      } else {
        console.log("not exist")
      }

      // 数据 by engow
      var accessNum = String("${request.info.accessNum}")
      var name = String("${request.info.name}")
      var organism = String("${request.info.organism}")
      var taxaId = String("${request.info.taxaId}")
      var lineage = String("${request.info.lineage}")
      var func = String("${request.info.function}")
      var tissueSpecifity = String("${request.info.tissueSpecifity}")
      var family = String("${request.info.family}")
      var uniProtID = String("${request.info.unitProt_ID}")
      var pdbId = String("${request.info.pdb}")
      var stringId = String("${request.info.stringId}")
      var gene = String("${request.info.gene}")
      var receptor = String("${request.info.receptor}")
      <%--this.taxa_id = String("${request.info.Taxa_ID}")--%>

      this.pi = String("${request.info.pi}")
      this.mw = String("${request.info.mw}")
      this.drugBank = String("${request.info.drugBank}")
      this.drugBankList = this.drugBank.split("#")
      this.chEMBL = String("${request.info.chEMBL}")
      this.chEMBLList = this.chEMBL.split('#')
      this.drugCentral = String("${request.info.drugCentral}")
      this.complexPdb = String("${request.info.complexPdb}")
      let tempComplexPdbList = this.complexPdb.split("$");
      for (let i = 0; i < tempComplexPdbList.length; i++) {
        let item = tempComplexPdbList[i].split(";");
        this.complexPdbList.push(item)
      }
      console.log("receptor-----", this.complexPdbList);
      if (this.complexPdb != 'NA' && this.complexPdb != '') {
        this.pdbtext2 = this.complexPdbList[0][1] + '_' + this.complexPdbList[0][4].trim() + '_' + this.complexPdbList[0][5].replace(',', '_').trim()
      }
      console.log(this.complexPdbList[0][1])
      //this.molChange2(this.complexPdbList[0][1],this.complexPdbList[0][0])

      //czq处理receptor
      if (receptor == "NA") {
        this.Receptor = []
        $("#rec").html("NA");
      } else {
        let receptors = receptor.split("$")
        for (let i = 0; i < receptors.length; i++) {
          let receptorsTemp = receptors[i].split("//");
          receptorsTemp[3] = receptorsTemp[3].split("#")
          this.Receptor.push(receptorsTemp)
        }

      }
      //console.log("receptor-----",this.Receptor)

      var modification = String("${request.info.modification}")
      var sequence = String("${request.info.sequence}")
      //this.sequence= sequence
      var pubmedId = String('${request.info.pubmedId}')

      this.Name = name
      this.family = family

      var NPID = String("${request.info.accessNum}")
      console.log(NPID)
      /*
      *
      *   Basic information
      *       NPID             this.NPID = NPID
      *       Name             this.Name = name
      *       Organism         this.Organism = organism
      *       NCBI Taxa ID     this.NCBI = taxaId
      *       Lineage          this.Lineage = lineage
      *       Length           this.Length = Length
      *       Modification     this.Modification = modification
      *       Sequence         this.Sequence = sequence
      *   Tissue Specifi
      *       Tissue Specificity   this.TissueSpecificity = tissueSpecifity
      *
      *   Function
      *       Function     this.Function = func
      *
      *   Annotation
      *       UniProt ID    this.UniprotID = uniProtID
      *       PDB ID        this.PDBID = pdbId
      *       //Gene Ontology this.GeneO
      *       STRING ID      this.STRID = stringId
      *
      *   Properties
      *
      *   Receptor           this.Receptor = receptor
      *
      *   Reference          this.Reference = pubmedId
      *
      *
      * */


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


      var UniProtID = String("${request.info.unitProt_ID}")
      console.log("UniProtID")
      console.log(UniProtID)
      this.UniprotID = UniProtID
      var reference = String('${request.info.pubmedId}')
      //处理Reference
      var reference = String(`${request.info.pubmedId}`)
      reference = reference.split("//")
      this.Reference = reference
      this.pmid = this.Reference[0];
      this.Reference = this.Reference.splice(1);
      //处理funcition
      this.Function = func;
      // this.Function=func.split(".");
      // if(this.Function.length>0){
      //     this.Function.splice(this.Function.length-1,1);
      // }
      var pdb = String("${request.info.pdb}");
      console.log(pdb)
      this.pdb = pdb
      <%--var t = String("${request.info.tISSUE_SPECIFITY}")--%>
      <%--console.log(t)--%>
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
            this.goinfoArray.push(temp);
          } else if (vary[0].indexOf("F") != -1) {
            temp.second = "Molecular Function";
            // countF++;
            // if(countF<=3)
            this.goinfoArray.push(temp);
          } else if (vary[0].indexOf("C") != -1) {
            temp.second = "Cellular Component";
            // countC++;
            // if(countC<=3)
            this.goinfoArray.push(temp);
          }
        }

      }


      this.NPID = NPID
      this.Name = name
      this.Organism = organism
      this.NCBI = taxaId
      this.Lineage = lineage
      this.Length = Length


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

      this.TissueSpecificity = tissueSpecifity
      console.log("test===============================")
      console.log(tissueSpecifity)
      //this.Function = func

      this.UniprotID = uniProtID
      console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
      console.log(pdbId)
      if (pdbId == "NA") {
        this.PDBID = ""
      } else {
        this.PDBID = pdbId.split(";")
        //console.log(this.PDBID)
      }
      this.STRID = stringId
      this.gene = gene;


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
      let mChange = String("${request.info.modification_change}");
      mChange = mChange.split("#");
      console.log("----mchange---" + mChange);
      let mcmap = new Map();
      // let mcArray = []
      for (let i = 0; i < mChange.length;) {
        let val = mChange[i]
        let key = mChange[i + 1]
        mcmap.set(key, val)
        this.cArray.push(val)
        i = i + 2;
      }
      console.log("----test----" + mChange)
      console.log("----test----" + mcmap)
      this.mcmap = mcmap;


    }

  })
</script>
</body>
</html>


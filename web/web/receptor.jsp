<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neuropeptide Database - Receptor</title>

    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>

    <style>
        .receptor-table td{
            padding-left: 10px;
            color: #666;
            border: 1px solid #ccc;
            line-height: 30px;
            word-wrap: break-word;
            word-break: break-all;
        }
        .receptor-table a{
            color: #06F;
        }
        .receptor-table .title-box{
            font-weight: bold;
        }
    </style>

</head>
<body>
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>

<div id="container" >

<input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

<ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
    <li>Receptor Infomation</li>
</ol>

<div id="app" style="margin: 35px 10px 15px 10px;">
    <table class="table table-striped receptor-table" width="1200px">
        <tr v-if="receptor.entryName!==''">
            <td width="20%" class="title-box">Entry name</td>
            <td width="80%">{{receptor.entryName}}</td>
        </tr>
        <tr v-if="receptor.proteinName!==''">
            <td width="20%" class="title-box">Protein names</td>
            <td width="80%">{{receptor.proteinName}}</td>
        </tr>
        <tr v-if="receptor.geneName!==''">
            <td width="20%" class="title-box">Gene names</td>
            <td width="80%">{{receptor.geneName}}</td>
        </tr>
        <tr v-if="receptor.organism!==''">
            <td width="20%" class="title-box">Organism</td>
            <td width="80%">{{receptor.organism}}</td>
        </tr>
        <tr v-if="receptor.length!==''">
            <td width="20%" class="title-box">Length</td>
            <td width="80%">{{receptor.length}}</td>
        </tr>
        <tr v-if="receptor.function!==''">
            <td width="20%" class="title-box">Function</td>
            <td width="80%">{{receptor.function}}</td>
        </tr>
        <tr v-if="receptor.proteinFamily!==''">
            <td width="20%" class="title-box">Protein families</td>
            <td width="80%">{{receptor.proteinFamily}}</td>
        </tr>
        <tr v-if="receptor.taxonomicLinege!==''">
            <td width="20%" class="title-box">Taxonomic lineage</td>
            <td width="80%">{{receptor.taxonomicLinege}}</td>
        </tr>
        <tr v-if="receptor.pubMedId">
            <td width="20%" class="title-box">PubMed ID</td>
            <td width="80%">
                <span v-for="(pid,index) in receptor.pubMedId.match(/\d+/g)">
                    <a :href="'https://www.ncbi.nlm.nih.gov/pubmed/'+pid">{{pid}}</a><span v-if="index < receptor.pubMedId.match(/\d+/g).length-1" style="color:#06F;">; </span>
                </span>
            </td>
        </tr>
        <tr v-if="receptor.geneOnthologyIds">
            <td width="20%" class="title-box">Gene ontology IDs</td>
            <%--鼠标移入显示全部id, 鼠标移出只显示第一个id--%>
            <td width="80%" @mouseenter="showGOIDCount=99999" @mouseleave="showGOIDCount=1">
                <%--通过正则，把geneOnthologyIds字符串转go id数组--%>
                <div v-for="GOid in receptor.geneOnthologyIds.match(/GO:\d+/g).slice(0,showGOIDCount)">
                    <a :href="'http://amigo.geneontology.org/amigo/term/'+GOid">{{GOid}}</a>
                </div>
            </td>
        </tr>
        <tr v-if="receptor.tissueSpecificity!==''">
            <td width="20%" class="title-box">Tissue specificity</td>
            <td width="80%" style="overflow-wrap: break-word; word-break: normal; text-align: justify">{{receptor.tissueSpecificity}}</td>
        </tr>
        <tr v-if="receptor.sequence!==''">
            <td valign="middle" width="20%" class="title-box">Sequence</td>
            <td width="80%">{{receptor.sequence}}</td>
        </tr>
    </table>
</div>

</div>

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script>
    new Vue({
        el:'#app',
        data:{
            receptor:{},
            showGOIDCount:1,
        },
        mounted(){
            console.log(${param.receptor})
            this.receptor = ${param.receptor}
        }
    })
</script>

</body>
</html>
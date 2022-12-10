<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@    taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Browse</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>

    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="neuropeptide/css/jquery.dataTables.css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript"
            src="neuropeptide/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>


    <style type="text/css">
        #datatable {
            word-break: break-all;
            word-wrap: break-all;
        }

        a {
            text-decoration: none;
            color: #06F;
        }

        a:hover {
            text-decoration: none;
            color: #F60;
        }


        div.seq:hover {
            text-overflow: inherit;
            overflow: visible;
            white-space: inherit;
        }

        div .seq {
            text-overflow: ellipsis;
            overflow: hidden;
            width: 200px;
            white-space: nowrap;
        }
    </style>


</head>

<body id="Home">
<div id="wrapper">

<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

    <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
    <%--Browse by--%>
    <%--<c:out value="${type}"></c:out>--%>
    <%--<hr class="nav_hr"/>--%>
    <%--</div>--%>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Browse</li>
        <li>
            <%--            <c:out value="${type}"></c:out>--%>
            <c:if test="${ppType=='neuro'}">
                <c:choose>
                    <c:when test="${type=='organism'}">
                        <a href="browse?type=${type}&phyla=Annelida">by ${type}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="browse?type=${type}">by ${type}</a>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <c:if test="${ppType=='recep'}">
                <c:choose>
                    <c:when test="${type=='organism'}">
                        <a href="browseReceptor?type=${type}&phyla=Annelida">by ${type}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="browseReceptor?type=${type}">by ${type}</a>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </li>
        <li><c:out
                value="${param.name}"></c:out></li>
    </ol>

    <div id="content">
        <div id="download" style="margin: 10px 10px;">
            <div style="float: left;">
                Total number of results for <span style="color: red"><c:out
                    value="${param.name}"></c:out></span> are <span style="color: red"><c:out
                    value="${fn:length(result)}"></c:out></span>
            </div>
            <div style="float: right; padding: 0 0 10px 0;">
                <a onclick="downloadData()" href="javascript:void(0);">Download
                    as</a>&nbsp;&nbsp;<input type="radio" checked="checked" value="fasta"
                                             name="download_type">Fasta&nbsp;&nbsp;<input type="radio"
                                                                                          value="full"
                                                                                          name="download_type">All
            </div>
        </div>


        <div style="margin: 10px 10px;">
            <table cellpadding="0" cellspacing="0" border="0" class="display"
                   id="datatable" width="100%">
                <thead>
                <tr>
                    <c:if test="${ppType=='neuro'}">
                        <th style="width: 10%">NPID</th>
                    </c:if>
                    <c:if test="${ppType=='recep'}">
                        <th style="width: 10%">NPRID</th>
                    </c:if>
                    <th style="width: 15%">Sequence</th>
                    <th>Length</th>
<%--                    <c:if test="${ppType=='neuro'}">--%>
<%--                        <th style="width: 10%">Length</th>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${ppType=='recep'}">--%>
<%--&lt;%&ndash;                        <th style="width: 10%">modification</th>&ndash;%&gt;--%>
<%--                    </c:if>--%>
                    <th style="width: 15%">Organism</th>
                    <c:if test="${ppType=='neuro'}">
                        <th style="width: 10%">Family</th>
                    </c:if>
                    <th style="width: 20%">Name</th>
                    <c:if test="${ppType=='neuro'}">
                        <th style="width: 20%">Receptor</th>
                    </c:if>
                    <c:if test="${ppType=='recep'}">
                        <th style="width: 20%">Ligand</th>
                    </c:if>
                    <%--<th>Peptide_REF</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="value" items="${result}">
                    <tr>
                        <td>
                            <a href="search${pType}_info?pepNum=${value.accessNum}">${value.accessNum}</a>

                        </td>

                       <td>
                            <div class="seq">${value.sequence}</div>
                        </td>
                        <td>${value.length}</td>
<%--                        <c:choose>--%>
<%--                            <c:when test="${ppType=='neuro'}">--%>
<%--                                <td>${value.length}</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${ppType=='recep'}">--%>
<%--&lt;%&ndash;                                <td>${value.modification}</td>&ndash;%&gt;--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>

                        <td>${value.organism}</td>
                        <c:if test="${ppType=='neuro'}">
                            <td>${value.family}</td>
                        </c:if>
                        <td>${value.name}</td>
                        <%--<c:if test="${ppType==neuro}">
                            <td>${value.receptor}</td>
                        </c:if>
                        <c:if test="${ppType==recep}">
                            <td>${value.neuropeptide}</td>
                        </c:if>--%>
                        <c:choose>
                            <c:when test="${ppType=='neuro'}">
                                <td>
<%--                                    <li v-for="(value,key,index) in ${value.receptor}"></li>--%>
                                    <c:set var="ridsValues" value="${fn:split(value.receptor,'split')}"/>
                                    <c:forEach var="rid" items="${ridsValues}">
                                        <c:choose>
                                            <c:when test="${rid=='NA'}">
                                                <ol><span>${rid}</span></ol>
                                            </c:when>
                                            <c:otherwise>
                                                <ol><a target="_blank" href="searchReceptor_info?pepNum=${rid}">${rid}</a></ol>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
<%--                                    <a href="searchReceptor_info?pepNum=${value.receptor}">${value.receptor}</a>--%>

                                </td>
                            </c:when>
                            <c:when test="${ppType=='recep'}">

                                <td>
                                    <c:set var="nidsValues" value="${fn:split(value.neuropeptide,'split')}"/>
                                    <c:forEach var="nid" items="${nidsValues}">
                                        <c:choose>
                                            <c:when test="${nid=='NA'}">
                                                <ol><span>${nid}</span></ol>
                                            </c:when>
                                            <c:otherwise>
                                                <ol><a target="_blank" href="search_info?pepNum=${nid}">${nid}</a></ol>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
<%--                                    <a href="search_info?pepNum=${value.neuropeptide}">${value.neuropeptide}</a>--%>
                                </td>
                            </c:when>
                        </c:choose>
<%--                        <td>${value.peptide_REF}</td>--%>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- close div#content -->
</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').dataTable({
            "searching": false,
            "autoWidth": true,
            "columnDefs": [{
                "width": "8%",
                "targets": 0
            }, {
                "width": "17%",
                "targets": 1
            }, {
                "width": "5%",
                "targets": 2
            }, {
                "width": "20%",
                "targets": 3
            }, {
                "width": "20%",
                "targets": 4
            },
                {
                    "width": "20%",
                    "targets": 5
                }
/*
                , {
                    "targets": 6,
                    "width": "10%",
                    /!*"render": function (data, type, row) {
                        var s = row[7];
                        s = s.split("$");
                        var result = "";
                        for (var i in s) {
                            result += s[i].split("#")[0] + " ";
                        }
                        return result;

                    }*!/
                }
*/
            ]
        });
    });

    function downloadData() {

        var form = $("<form>");//定义一个form表单
        form.attr("style", "display:none");
        form.attr("target", "");
        form.attr("method", "post");
        form.attr("action", "download_browse");
        var input1 = $("<input>");
        input1.attr("type", "hidden");
        input1.attr("name", "type");
        input1.attr("value", "${type}");
        var input2 = $("<input>");
        input2.attr("type", "hidden");
        input2.attr("name", "name");
        input2.attr("value", "${param.name}");
        var input3 = $("<input>");
        input3.attr("type", "hidden");
        input3.attr("name", "download_type");
        input3.attr("value", $('input[name="download_type"]:checked').val());
        var input4 = $("<input>");
        input4.attr("type", "hidden");
        input4.attr("name", "NPtype");
        input4.attr("value", "${ppType}");

        $("body").append(form);//将表单放置在web中
        form.append(input1);
        form.append(input2);
        form.append(input3);
        form.append(input4);
        form.submit();//表单提交
    }

    <%--const  app = new Vue({--%>
    <%--    el: '#content',--%>
    <%--    data:{--%>
    <%--        toReceptoridsList:{}--%>
    <%--    },--%>
    <%--    mounted(){--%>
    <%--        let neuroinfoList = "${request.result}";--%>
    <%--        console.log(neuroinfoList);--%>
    <%--        for(let i=0;i < neuroinfoList.length;i++){--%>
    <%--            neuroinfoList.receptor =  neuroinfoList[i].receptor.split("///");--%>
    <%--        }--%>
    <%--    },--%>
    <%--    method(){--%>
    <%--        getReceptorIds(){--%>
    <%--            return this.toReceptoridsList.split("\\");--%>
    <%--        }--%>
    <%--    }--%>

    <%--})--%>





</script>

</body>
</html>
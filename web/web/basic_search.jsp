<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>

    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/jquery-ui-1.10.4.custom.css"
          rel="stylesheet" type="text/css"/>

    <link href="neuropeptide/css/jquery.dataTables.css" rel="stylesheet"
          type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-ui-1.10.4.custom.js"></script>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css"
          href="neuropeptide/css/jquery.dataTables.css"/>
    <script type="text/javascript"
            src="neuropeptide/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="neuropeptide/css/up_btn.css"/>
    <script src="neuropeptide/js/up_btn.js"></script>

    <style type="text/css">
      #basic_search div {
        display: inline;
      }

      #search_field {
        width: 110px;
      }

      #search_text {
        width: 600px;
        height: 1.5em;
        height: 30px;
      }

      #search_button {
        background-color: #4477AA;
        color: #FFFFFF;
        font-size: inherit;
        font-weight: bold;

        border: 0 none;
        border-radius: 5px;
        box-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, 0.5);
        cursor: pointer;
        margin: 0 0.2em;
        overflow: visible;
        padding: 0.2em 0.4em;
        text-shadow: 0.1em 0.1em 0.1em rgba(0, 0, 0, 0.5);
        width: auto;
      }

      #datatable {
        word-break: break-all;
        word-wrap: break-all;
      }
    </style>

</head>

<body id="Search">
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" style="min-height: 500px;">

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

        <ol class="breadcrumb"
            style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Search</li>
            <li>Quick Search</li>
        </ol>

        <div id="content"
             style="line-height: 35px; margin: 35px 10px 15px 10px;"> <!-- border: 1px solid #999;"> -->
            <div id="nullValDiv"></div>

            <input type="hidden" name="p" value="search"/>

            <div id="wrap" class="clearfix">

                <div id="basic_search" align="center">


                    <p>A quick search feature allows users to search the database with keywords such as sequence, name,
                        and NPID, etc.</p>
                    <select id="search_type" onchange="changeType(this.options[this.selectedIndex].value)">
                        <option value="basic_search.jsp" selected="selected">Neuropeptide</option>
                        <option value="basic_receptorSearch.jsp">Receptor</option>
                    </select>
                    <select id="search_field" onchange="selectCategoryONchange(this)">
                        <option value="accessNum">NPID</option>
                        <option value="organism">ORGANISM</option>
                        <option value="family">FAMILY</option>
                        <option value="name">NAME</option>
                        <option value="unitprot_id">UniProt ID</option>
                        <option value="sequence">SEQUENCE</option>
                        <option value="pubmedId">PMID</option>
                    </select>
                    <input type="text" id="search_text"/>
                    <%--<input type="text" class="form-control" id="search_text" placeholder="">--%>
                    <%--<button type="submit" id="search_button" onclick="basicSearch()">Search</button>--%>
                    <button type="submit" class="btn btn-primary" onclick="basicSearch()">Search</button>
                    <br>
                    <div id="nptip">The unique identifier in NPID. E.g.<a href="javascript:void(0);"
                                                                          onclick="expamleSearch('NP10746')">NP10746</a>
                    </div>
                    <div id="orgid" style="display: none;">The organism in neuropeptide.E.g
                        <a href="javascript:void(0);" onclick="expamleSearch('Homo sapiens')">Homo sapiens</a>,
                        <a href="javascript:void(0);" onclick="expamleSearch('Rattus norvegicus')">Rattus norvegicus</a>,
                        <a href="javascript:void(0);" onclick="expamleSearch('Mus musculus')">Mus musculus</a>,
                        <a href="javascript:void(0);" onclick="expamleSearch('Caenorhabditis elegans')">Caenorhabditis
                            elegans</a>,
                        <a href="javascript:void(0);" onclick="expamleSearch('Callinectes sapidus')">Callinectes
                            sapidus</a>,
                        <a href="javascript:void(0);" onclick="expamleSearch('Drosophila melanogaster')">Drosophila
                            melanogaster</a>
                    </div>
                    <div id="ftip" style="display: none;">The family in neuropeptide.E.g.<a href="javascript:void(0);"
                                                                                            onclick="expamleSearch('Tachykinin')">Tachykinin</a>
                    </div>
                    <div id="namtip" style="display: none">The Name in neuropeptide.E.g <a href="javascript:void(0);"
                                                                                           onclick="expamleSearch('Substance P')">Substance
                        P</a></div>
                    <div id="uitip" style="display: none">The UNIPROT ID in neuropeptide.E.g <a
                            href="javascript:void(0);" onclick="expamleSearch('TKN1_HUMAN')">TKN1_HUMAN</a></div>
                    <div id="stip" style="display: none">The Sequence in neuropeptide.E.g <a href="javascript:void(0);"
                                                                                             onclick="expamleSearch('RPKPQQFFGLM')">RPKPQQFFGLM</a>
                    </div>
                    <div id="ptip" style="display: none">The PMID in neuropeptide.E.g <a href="javascript:void(0);"
                                                                                         onclick="expamleSearch('10477125')">10477125</a>
                    </div>
                </div>

            </div>
        </div>
        <!-- close div#content -->

        <div id="search_result" align="center" style="margin: auto 10px 25px 10px; font-size: 13px">
            <%--        <div id = "download">--%>
            <%--            <div style="float:left;padding:0 0 10px 0">Number of hits: <strong style="color:#06F" id="relCount"><c:out--%>
            <%--                    value="${fn:length(result)}"></c:out></strong></div>--%>
            <%--            <div style="float:right;padding: 0 0 10px 0;"><a href="javascript:void(0);">Download file as</a>&nbsp;&nbsp;--%>
            <%--                <input type="radio" name="download_type" value="fasta" checked="checked">Fasta</input>&nbsp&nbsp;<input type="radio" name="download_type" value="full">All</input>--%>
            <%--            </div>--%>
        </div>

        <%--        <table cellpadding="0" cellspacing="0" border="0" class="display"--%>
        <%--               id="datatable" width="100%">--%>
        <%--            <thead>--%>
        <%--            <tr>--%>
        <%--                <th style="width: 10%">NPID</th>--%>
        <%--                <th style="width: 15%">Sequence</th>--%>
        <%--                <th style="width: 10%">Length</th>--%>
        <%--                <th style="width: 15%">Organism</th>--%>
        <%--                <th style="width: 10%">Family</th>--%>
        <%--                <th style="width: 20%">Name</th>--%>
        <%--                <th style="width: 20%">Receptor</th>--%>
        <%--            </tr>--%>
        <%--            </thead>--%>
        <%--            <tbody>--%>
        <%--            <c:forEach var="value" items="${result}">--%>
        <%--                <tr>--%>
        <%--                    <td>--%>
        <%--                        <a href="search${pType}_info?pepNum=${value.accessNum}">${value.accessNum}</a></td>--%>
        <%--                    <td>--%>
        <%--                        <div class="seq">${value.sequence}</div>--%>
        <%--                    </td>--%>
        <%--                    <td>${value.length}</td>--%>
        <%--&lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:when test="${ppType=='neuro'}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;                            <td>${value.length}</td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:when test="${ppType=='recep'}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;                            <td>${value.modification}</td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>

        <%--                    <td>${value.organism}</td>--%>
        <%--                    <td>${value.family}</td>--%>
        <%--                    <td>${value.name}</td>--%>
        <%--                    <td>--%>
        <%--                            &lt;%&ndash;                                    <li v-for="(value,key,index) in ${value.receptor}"></li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:set var="ridsValues" value="${fn:split(value.receptor,'split')}"/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:forEach var="rid" items="${ridsValues}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;                            <ol><a href="searchReceptor_info?pepNum=${rid}">${rid}</a></ol>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
        <%--                            &lt;%&ndash;                                    <a href="searchReceptor_info?pepNum=${value.receptor}">${value.receptor}</a>&ndash;%&gt;--%>

        <%--                    </td>--%>
        <%--                        &lt;%&ndash;<c:if test="${ppType==neuro}">--%>
        <%--                            <td>${value.receptor}</td>--%>
        <%--                        </c:if>--%>
        <%--                        <c:if test="${ppType==recep}">--%>
        <%--                            <td>${value.neuropeptide}</td>--%>
        <%--                        </c:if>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:when test="${ppType=='neuro'}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        <c:when test="${ppType=='recep'}">&ndash;%&gt;--%>
        <%--&lt;%&ndash;                            <td>${value.neuropeptide}</td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>
        <%--                        &lt;%&ndash;                        <td>${value.peptide_REF}</td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;                    <td>KKK</td>&ndash;%&gt;--%>
        <%--                </tr>--%>
        <%--            </c:forEach>--%>
        <%--            </tbody>--%>
        <%--        </table>--%>
        <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Notice</h4>
                    </div>
                    <div class="modal-body">
                        <p>Input cannot be empty</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->

        </div>

    </div>

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script type="text/javascript">


  // let sfDisplay = true;
  function selectCategoryONchange(obj) {
    $('#search_text').val('');
    $('#search_result').html('');
    var value = $(obj).val();
    console.log(value);
    if (value == 'accessNum') {
      $("#nptip").css('display', 'block');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'none');
    } else if (value == 'organism') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'block');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'none');
    } else if (value == 'family') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'block');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'none');
    } else if (value == 'name') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'block');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'none');
    } else if (value == 'unitprot_id') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'block');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'none');
    } else if (value == 'sequence') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'block');
      $('#ptip').css('display', 'none');
    } else if (value == 'pubmedId') {
      $("#nptip").css('display', 'none');
      $("#orgid").css('display', 'none');
      $("#ftip").css('display', 'none');
      $("#namtip").css('display', 'none');
      $('#uitip').css('display', 'none');
      $("#stip").css('display', 'none');
      $('#ptip').css('display', 'block');
    }
  }

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

    $('#datatable').dataTable({
      "searching": false,
      "autoWidth": false,
      "columnDefs": [{
        "width": "12%",
        "targets": 0
      }, {
        "width": "15%",
        "targets": 1
      }, {
        "width": "10%",
        "targets": 2
      }, {
        "width": "10%",
        "targets": 3
      }, {
        "width": "15%",
        "targets": 4
      },
        {
          "width": "15%",
          "targets": 5
        }, {
          "targets": 6,
          "width": "15%",
          /*"render": function (data, type, row) {
              var s = row[7];
              s = s.split("$");
              var result = "";
              for (var i in s) {
                  result += s[i].split("#")[0] + " ";
              }
              return result;

          }*/
        }
      ]
    });
  });


  var search_data = null;

  function basicSearch() {
    // if(text == undefined){
    //     text = ''
    // }
    if ($("#search_text").val() == '') {
      $("#message").modal();
    } else {
      $.ajax({
        url: "search_basic",
        type: "POST",
        data: {
          field: $("#search_field").val(),
          text: $("#search_text").val(),
        },
        dataType: "json",
        beforeSend: function () {
          $('#search_result').html('<img src="neuropeptide/img/ajax-loader.gif"/>loading...');
        },
        success: function (data) {
          search_data = data;
          var download_div = '<div id = "download">' +
              '<div style="float:left;padding:0 0 10px 0;display: none;" >Number of hits: <strong style="color:#06F" id="relCount">' + data.length + '</strong></div>' +
              '<div style="float:right;padding: 0 0 10px 0;"><a href="javascript:void(0);" onclick="downloadData()">Download file as</a>' +
              '&nbsp;&nbsp;<input type="radio" name="download_type" value="fasta" checked="checked">Fasta</input>&nbsp&nbsp;' +
              '<input type="radio" name="download_type" value="full">All</input></div>' +
              '</div>';
          $('#search_result').html(download_div + ' <table cellpadding="0" cellspacing="0" border="0" class="display" id="datatable" width="100%"></table>');
          let dataTable = {
            "autoWidth": false,
            "searching": false,
            "data": data,
            "columns": [{
              "title": "NPID"
            }, {
              "title": "Sequence"
            },
              {
                "title": "Length"
              }, {
                "title": "Organism"
              }, {
                "title": "Family"
              }, {
                "title": "Name"
              }, {
                "title": "Receptor"
              }],
            "columnDefs": [
              {
                // `data` refers to the data for the cell (defined by `mData`,
                // which
                // defaults to the column being worked with, in this case is the
                // first
                // Using `row[0]` is equivalent.
                "render": function (data, type, row) {
                  return '<a target="_blank" href="search_info?pepNum=' + row[0] + '">'
                      + data + '</a>';
                },
                "targets": 0
              }, {
                "width": "8%",
                "targets": 0
              }, {
                "render": function (data, type, row) {
                  return '<div class="seq">' + data + '</div>';
                },
                "width": "22%",
                "targets": 1
              },
              {
                "width": "8%",
                "targets": 2
              },
              {
                "width": "17%",
                "targets": 3
              },
              {
                "width": "17%",
                "targets": 4
              },
              {
                "width": "17%",
                "targets": 5
              }, {
                "width": "11%",
                "render": function (data, type, row) {
                  const info = data.split(';');
                  let res = ''
                  for (id of info) {
                    if (id !== 'NA') {
                      res = res + '<a target="_blank" href="searchReceptor_info?pepNum=' + id + '">' + id + '</a><br/>';
                    } else {
                      res = res + '<span>' + id + '</span><br/>';
                    }
                  }
                  return res;
                },
                "targets": 6
              }]
          }
          $('#datatable').dataTable(dataTable);
        }
      });
    }

  }

  function expamleSearch(text) {

    $('#search_text').val(text);
    // if($("#search_field").val()==field){
    //     $("#search_text").val('');
    //     basicSearch(text);
    // }else {
    //     $("#search_text").val('');
    //     $("#search_field").val('accessNum');
    //     basicSearch(text)
    // }

  }

  function downloadData() {
    var download_type = $('input[name="download_type"]:checked').val();
    var dataStr = JSON.stringify(search_data);
    console.log(dataStr);
    var form = $("<form>");//定义一个form表单
    form.attr("style", "display:none");
    form.attr("target", "");
    form.attr("method", "post");
    form.attr("action", "download_search");
    var input1 = $("<input>");
    input1.attr("type", "hidden");
    input1.attr("name", "data");
    input1.attr("value", dataStr);
    var input2 = $("<input>");
    input2.attr("type", "hidden");
    input2.attr("name", "type");
    input2.attr("value", download_type);
    var input3 = $("<input>");
    input3.attr("type", "hidden");
    input3.attr("name", "NPtype");
    input3.attr("value", "neuro");
    $("body").append(form);//将表单放置在web中
    form.append(input1);
    form.append(input2);
    form.append(input3);
    form.submit();//表单提交
  }

  function changeType(val) {
    console.log(val)
    window.location.href = val
  }
</script>
</body>
</html>

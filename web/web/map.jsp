<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript"
            src="neuropeptide/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        label {
            display: block;
            /*margin-top:10px;*/
        }

        .indent {
            padding-left: 20px;
        }

        .question {
            position: relative;
            top: 3px;
            background: url("neuropeptide/img/question.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
            display: inline-block;
            height: 15px;
            margin-left: 4px;
            width: 15px;
        }

        /*
        a.ui-toggler span.ui-icon, a.ui-ncbitoggler-open span.ui-icon {
            display: inline;
            left: 0;
            position: absolute;
        }

        .ui-icon{
            width: 16px;
            height: 16px;
        }

        a.ui-toggler span.ui-icon-plus-minus-big, a.ui-ncbitoggler-open span.ui-icon-plus-minus-big-open {
            background-color: transparent;
            background-image: url("neuropeptide/img/toggler-plus-minus-big.gif");
            background-repeat: no-repeat;
            margin-left: -0.1em;
            top: 0.2em;
        }
        */

        #map_sequence {
            display: block;
            font: 14px/1.5 times new roman, Arial, Verdana, Tahoma, "宋体";
            line-height: 25px !important;
        }
    </style>

</head>

<body id="Search">

<div id="wrapper">

    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" style="min-height:500px;">

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

        <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--Map--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Tools</li>
            <li>Map</li>
        </ol>


        <div id="content"
             style="line-height: 30px; margin-left: 5%;margin-bottom:5%;margin-right: 2%;">
            <!-- <a class="ui-toggler"><span class="ui-icon ui-icon-plus-minus-big"></span></a> -->
            <span>MAP is used to retrieve NeuroPep 2.0 database peptides against the query sequence.</span>
            <!-- <br/>Please see HELP page for more information. -->

            <a title="help of the map tool" href="help.jsp#map" target="_blank" class="question"></a>
            <div>
                <label for="map_sequence" style="font-size: 18px;font-family: inherit">Enter sequence below in FASTA
                    format ('&gt;' is mandatory, <a href="javascript:void(0)" onclick="getExample()" style="color: #06F;">click for an example</a>)</label>
                <div>
                    <textarea  class="form-control" id="map_sequence" name="map_sequence" rows="6"></textarea>
                </div>
                <div class="example" style="display: none">
                    Example: <br/>
                    <div>
                        <span id="map_example">>Q868F8<br/>MKTSAYNVYLGVVAAMLALLFVTINAAPMEADDETAENTLVAHPDGDMELSGPWDAINTA<br/>ALRKLLLQLDAEDRMGGVTRSWPQAEPRGWGLRALDSRLARQWRADKRQVRFRQCYFNPI<br/>SCFRK</span>
                    </div>
                </div>
                <hr/>
                <div style="margin-top: 10px;">
                    <input type="submit"class="btn btn-default btn-primary" onclick="map()" value="Analysis"/>
                </div>
            </div>


        </div>
        <!-- close div#content -->

        <div id="search_result" align="center"
             style="margin: auto 10px 25px 10px; font-size: 13px">
        </div>

    </div>
    <!-- close div#container -->

    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>

</div>

<script type="text/javascript">
    function map() {
        $.ajax({
            url: "tools_map",
            type: "POST",
            data: {
                map_sequence: $("#map_sequence").val()
            },
            dataType: "json",
            beforeSend: function () {
                $('#search_result').html('<img src="neuropeptide/img/ajax-loader.gif"/>loading...');
            },
            success: function (data) {
                search_data = data;
                var download_div = '<div id = "download">' +
                    '<div style="float:left;padding:0 0 10px 0">There is <strong style="color:#06F" id="relCount">' + data.length + '</strong> entry matching your query</div>' +
                    '<div style="float:right;padding: 0 0 10px 0;display: none;"><a href="javascript:void(0);" onclick="downloadData()">Download to</a>' +
                    '&nbsp;&nbsp;<input type="radio" name="download_type" value="fasta" checked="checked">Fasta</input>&nbsp&nbsp;' +
                    '<input type="radio" name="download_type" value="full">Full</input></div>' +
                    '</div>';
                //$('#content').slideUp();
                $('#search_result').html(download_div + ' <table cellpadding="0" cellspacing="0" border="0" class="display" id="datatable" width="100%"></table>');
                $('#datatable').dataTable({
                    "autoWidth": false,
                    "searching": false,
                    "data": data,
                    "columns": [{
                        "title": "NPID"
                    }, {
                        "title": "Sequence"
                    }, {
                        "title": "Length"
                    },
                        {
                            "title": "Organism"
                        }, {
                            "title": "Family"
                        }, {
                            "title": "Name"
                        }, {
                            "title": "Start Position"
                        },],
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
                            "targets": 5,
                        }, {
                            "width": "11%",
                            "targets": 6
                        },]
                });
            }
        });
    }

    function getExample() {
        $("#map_sequence").val(">Q868F8" + "\n" +
            "MKTSAYNVYLGVVAAMLALLFVTINAAPMEADDETAENTLVAHPDGDMELSGPWDAINTA" + "\n" +
            "ALRKLLLQLDAEDRMGGVTRSWPQAEPRGWGLRALDSRLARQWRADKRQVRFRQCYFNPI" + "\n" +
            "SCFRK");
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
        $("body").append(form);//将表单放置在web中
        form.append(input1);
        form.append(input2);
        form.submit();//表单提交
    }
</script>
</body>
</html>
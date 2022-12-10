<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neuropeptide Database - Search</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/search.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/jquery-ui-1.10.4.custom.css"
          rel="stylesheet" type="text/css"/>


    <link href="neuropeptide/css/jquery.dataTables.css"
          rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        #search_condition td {
            padding: 2px 5px;
        }

        .op_combo {
            width: 100%;
        }

        .search_field {
            width: 100%;
        }

        .search_text {
            width: 100%;
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

        .rem_line {
            background: url("neuropeptide/img/3317099.png") no-repeat scroll -16px 50% rgba(0, 0, 0, 0);
        }

        .line_ico {
            display: inline-block;
            width: 15px;
            height: 15px;
            margin: 0 2px;
            padding: 3px 2px;
            position: relative;
            text-indent: -9999em;
            top: 1px;
        }

        .question {
            background: url("neuropeptide/img/question.png") no-repeat rgba(0, 0, 0, 0);
            display: inline-block;
            width: 15px;
            height: 15px;
            margin-left: 4px;
        }

        .add_line {
            background: url("neuropeptide/img/3317099.png") no-repeat scroll 2px 50% rgba(0, 0, 0, 0);
            display: inline-block;
            width: 15px;
            height: 15px;
            margin: 0 2px;
            padding: 3px 2px;
            position: relative;
            text-indent: -9999em;
            top: -1px;
        }
    </style>

    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript"
            src="neuropeptide/js/jquery-ui-1.10.4.custom.js"></script>

    <script type="text/javascript"
            src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

</head>

<body id="Search">

<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" style="min-height:500px;">

        <input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

        <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--Advanced Search--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Search</li>
            <li>Advanced Search</li>
        </ol>


        <div id="content"
             style="line-height: 35px; margin: 35px 10px 15px 10px;">
            <!-- border: 1px solid #999;"> -->
            <div id="nullValDiv"></div>

            <input type="hidden" name="p" value="search"/>

            <div id="wrap" class="clearfix">
                <%--<div id="advanced_search" align="center">
                    <div align="right" style="padding-right: 30px; display: block">

                    </div>

                    <table id="search_condition" cellpadding="0" cellspacing="0" border="0" width="80%">
                        <tr class="add_condition">
                            <td></td>
                            <td></td>
                            <td align="right"><span style="font-size:12px;">Add</span></td>
                            <td>
                                <a title="Add new builder line" href="javascript:void(0)" class="add_line"></a>
                            </td>
                        </tr>
                        <tr class="sb_line">
                            <td width="10%">&nbsp;</td>
                            <td width="15%">
                                <select class="search_field">
                                    <option value="organism">ORGANISM</option>
                                    <option value="family">FAMILY</option>
                                    <option value="name">NAME</option>
                                </select>
                            </td>
                            <td width="70%">
                                <input type="text" class="search_text" required="required"/>
                            </td>
                            <td width="5%">
                                <a title="help of the advanced search" href="help.jsp#advanced_search" target="_blank"
                                   class="question"></a>
                                <!--
                                <img src="neuropeptide/img/question.png" alt="" style="margin-left: 5px;" onclick="" />
                                -->
                            </td>
                            <!--
                            <a title="Remove this line from builder" class="index_del rem_line line_ico" href="javascript:void(0)" style=""></a>
                             -->
                        </tr>
                    </table>
                    <div align="left" style="width:80% ;margin-top:10px;text-align: center">
                        &lt;%&ndash;<button type="submit" id="search_button" onclick="advancedSearch()">Search</button>&ndash;%&gt;
                        <button type="submit" class="btn btn-primary" onclick="advancedSearch()">Search</button>
                    </div>--%>
                <div class="row" style="padding-left: 15%;padding-right: 15%">
                    <strong>Search for</strong>
                    <select id="search_category" class="selectType" onchange="selectCategoryONchange(this)">
                        <option value="neuro">Neuropeptide</option>
                        <option value="Receptor">Receptor</option>
                    </select>
<%--                    <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                    <br/>
                    <h3 style="color: #26de71">Search Options</h3>
                    <p>Search results will satisfy the conditions of all inputs.Leaving an input empty will exclude it from the search </p>
                    <form id="search_table" id="stable">
                        <div class="form-group">
                            <label class="search_field" >Name</label>
<%--                            <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                            <div class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;"><input id="NPIDval" type="text" class="search_text form-control" placeholder="Enter entire or part of name"></div>
                            </div>
                            <span id="nametips">The Name in neuropeptide.E.g <a style="cursor: pointer" onclick="setNPval('Substance P')">Substance P</a></span>
                            <span id="nametipsR" style="display: none">The Name in receptor.E.g <a style="cursor: pointer" onclick="setNPval('Substance-P receptor')">Substance-P receptor</a></span>
                        </div>
<%--                        <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                        <div class="form-group">

                            <label class="search_field">Organism</label>
<%--                            </div>--%>
                            <div  class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;">
                                    <input type="text" id="Organismval" class="search_text form-control" placeholder="Enter entire or part of an organism name">
                                </div>
                            </div>
                            <div style="width: 600px">
                                <span id="organismtips">The organism.E.g
                                <a style="cursor: pointer" onclick="setOrganismVal('Homo sapiens')">Homo sapiens</a>,
                                <a href="javascript:void(0);" onclick="setOrganismVal('Rattus norvegicus')">Rattus norvegicus</a>,
                                <a href="javascript:void(0);" onclick="setOrganismVal('Mus musculus')">Mus musculus</a>,
                                <a href="javascript:void(0);" onclick="setOrganismVal('Caenorhabditis elegans')">Caenorhabditis elegans</a>,
                                <a href="javascript:void(0);" onclick="setOrganismVal('Callinectes sapidus')">Callinectes sapidus</a>,
                                <a href="javascript:void(0);" onclick="setOrganismVal('Drosophila melanogaster')">Drosophila melanogaster</a>
                            </span>
                            </div>

                        </div>
                        <div class="form-group" id="neuroFamily">
                            <label class="search_field">Family</label>
                            <div class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;"><input type="text" id="Familyval" class="search_text form-control" placeholder="Enter entire or part of a faimly name"></div>
                            </div>
                            <span id="familytips">The family in neuropeptide.E.g <a style="cursor: pointer" onclick="setFamilyVal('Tachykinin')">Tachykinin</a></span>
                        </div>
                        <div class="form-group">
                            <label class="search_field">Length</label>
<%--                            <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                            <div class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;"><input type="text" id="Lengthval"class="search_text form-control" placeholder="Enter entire or part of an sequence name"></div>
                            </div>
                            <span id="lengthtips">The length range of the sequence, E.g <a style="cursor: pointer" onclick="setLengthVal('10-50')">10-50</a></span>
                            <span id="lengthRtips" style="display: none;">The length range of the sequence, E.g <a style="cursor: pointer" onclick="setLengthVal('500-1500')">500-1500</a></span>
                        </div>
                        <div class="form-group" id="neuroMw">
                            <label class="search_field">Molecular Weight</label>
<%--                            <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                            <div class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;"><input type="text" id="mwval" class="search_text form-control" placeholder="Molecular Weight"></div>
                            </div>
                            <span id="MWtips">The range of Molecular Weight in neuropeptide.E.g <a style="cursor: pointer" onclick="setMWVal('7-12')">7-12</a></span>

                        </div>
                        <div class="form-group" id="neuroPi">
                            <label class="search_field" >Isoelectric Point</label>
<%--                            <select class="op_combo"><option value="AND">AND</option><option value="OR">OR</option></select>--%>
                            <div class="row" style="width: 100%">
                                <div class="col-sm-1" style="margin-right: 20px !important;"><select class="itemSearch"><option value="AND">AND</option><option value="OR">OR</option></select></div>
                                <div class="col-sm-10" style="padding-left: 0px !important;"><input type="text" id="pival" class="search_text form-control" placeholder="Isoelectric Point"></div>
                            </div>
                            <span id="PItips">The range of Isoelectric Point in neuropeptide.E.g <a style="cursor: pointer" onclick="setPIVal('1000-2000')">1000-2000</a></span>
                        </div>
                    </form>
                    <button type="submit" class="btn btn-primary" onclick="advancedSearch()">Search</button>
                    <button type="submit" class="btn btn-primary" onclick="clearData()">Reset</button>
                </div>
            </div>
        </div>


        <div id="search_result" align="center"
             style="margin: auto 10px 25px 10px; font-size: 13px">
        </div>
    </div>
    <!-- close div#content --
</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>





<script type="text/javascript" src="neuropeptide/js/myDataTable.js"></script>
<script type="text/javascript">
    function setNPval(value) {
        $('#NPIDval').val(value);
    }
    function setOrganismVal(value) {
        $('#Organismval').val(value);
    }
    function setFamilyVal(value) {
        $('#Familyval').val(value);
    }
    function setLengthVal(value) {
        $('#Lengthval').val(value);
    }
    function setMWVal(value) {
        $('#mwval').val(value);
    }
    function setPIVal(value) {
        $('#pival').val(value);
    }
    function makeData() {
        var queryData = "";
        var text;
        var field;
        /*最所有search_text进行遍历 */
        $(".search_text").each(function () {
            if (this.value.trim() != "") {
                text = this.value.trim();
                //获取上一个兄弟结点得值
                field = $(this).parent().parent().prev().text();
                andOrNot = $(this).parent().prev().children().val();
                console.log(field);
                console.log(andOrNot);
                // if(field=='Name'){
                //     field = 'accessNum'
                // }
                if(field=='Molecular Weight'){
                    field = 'pi'
                }
                if(field=='Isoelectric Point'){
                    field = 'mw'
                }
                if(field == 'Length'){
                    field = 'length'
                }
                // queryData += "AND%"+field + "%";
                queryData += andOrNot+"#"+field+"%";
                queryData += text + "$";
            }
        });
        console.log(queryData);
        return queryData;
    }

    function clearData() {
        $(':input').not(".selectType").not(".itemSearch")
            .val('');
    }

    function advancedSearch() {

        $.ajax({
            url: "search_newAdvanced",
            type: "POST",
            data: {
                queryString: makeData(),
                queryCategoey: $("#search_category").val()
            },
            dataType: "json",
            beforeSend: function () {
                $('#search_result').html('<img src="neuropeptide/img/ajax-loader.gif"/>loading...');
            },
            success: function (data) {
                search_data = data;
                var download_div = '<div id = "download">' +
                    '<div style="float:left;padding:0 0 10px 0">Number of hits: <strong style="color:#06F" id="relCount">' + data.length + '</strong></div>' +
                    '<div style="float:right;padding: 0 0 10px 0"><a href="javascript:void(0);" onclick="downloadData()">Download file as</a>' +
                    '&nbsp;&nbsp;<input type="radio" name="download_type" value="fasta" checked="checked">Fasta</input>&nbsp&nbsp;' +
                    '<input type="radio" name="download_type" value="full">All</input></div>' +
                    '</div>';
                $('#search_result').html(download_div + ' <table cellpadding="0" cellspacing="0" border="0" class="display" id="datatable" width="100%"></table>');
                var queryCategory = $("#search_category").val();
                console.log(queryCategory);
                if (queryCategory === 'neuro') {
                    $('#datatable').dataTable({
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
                            }, {
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
                            },
                          {
                                "width": "11%",
                                "render": function (data, type, row) {
                                    // let result = ''
                                    // for(id of ids){
                                    //     result = ''+'<a href="search_info?pepNum=' + id + '">' + id + '</a>'+'\n';
                                    //
                                    console.log(data);
                                    const  info = data.split(';');
                                    let res = ''
                                    for(id of info){
                                        if (id === "NA"){
                                          res = res+'<span>' + id + '</span><br/>';
                                        } else {
                                          res = res+'<a target="_blank" href="searchReceptor_info?pepNum=' + id + '">' + id + '</a><br/>';
                                        }
                                    }
                                    return res;
                                },
                                "targets": 6
                            },
                        ]
                    });

                }else if (queryCategory === 'Receptor'){
                    $('#datatable').dataTable({
                        "autoWidth": false,
                        "searching": false,
                        "data": data,
                        "columns": [{
                            "title": "NPRID"
                        }, {
                            "title": "Sequence"
                        }, {
                            "title": "Length"
                        }, {
                            "title": "Organism"
                        }, {
                          "visible": false,
                            "title": "Family"
                        }, {
                            "title": "Name"
                        }, {
                            "title": "Ligand"
                        },],
                        "columnDefs": [
                            {
                                // `data` refers to the data for the cell (defined by `mData`,
                                // which
                                // defaults to the column being worked with, in this case is the
                                // first
                                // Using `row[0]` is equivalent.
                                "render": function (data, type, row) {
                                    return '<a target="_blank" href="searchReceptor_info?pepNum=' + row[0] + '">'
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
                                "width": "19%",
                                "targets": 1
                            }, {
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
                            },
                          {
                                "width": "14%",
                                "render": function (data, type, row) {
                                    // let result = ''
                                    // for(id of ids){
                                    //     result = ''+'<a href="search_info?pepNum=' + id + '">' + id + '</a>'+'\n';
                                    //
                                    console.log(data);
                                    const  info = data.split('$');
                                    let res = ''
                                    for(id of info){
                                      if (id === "NA"){
                                        res = res+'<span>' + id + '</span><br/>';
                                      } else {
                                        res = res+'<a target="_blank" href="searchReceptor_info?pepNum=' + id + '">' + id + '</a><br/>';
                                      }
                                    }
                                    return res;
                                },
                                "targets": 6
                            },
                        ]
                    });
                }
            }
        });
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
    function selectCategoryONchange(obj) {
        // $('#datatable').dataTable()
        $('#search_result').html('');
        clearData();
        $('#NPIDval').val('');
        var value = $(obj).val();
        console.log(value);
        if(value == 'Receptor'){
            $("#neuroFamily").css('display','none');
            $("#neuroMw").css('display','none');
            $("#neuroPi").css('display','none');
            $("#nametips").css('display','none');
            $('#nametipsR').css('display','block');
            $("#lengthtips").css('display','none');
            $('#lengthRtips').css('display','block');
        }else if(value == 'neuro'){
            $("#neuroFamily").css('display','block');
            $("#neuroMw").css('display','block');
            $("#neuroPi").css('display','block');
            $("#nametips").css('display','block');
            $('#nametipsR').css('display','none');
            $("#lengthtips").css('display','block');
            $('#lengthRtips').css('display','none');
        }
    }



</script>
</body>
</html>

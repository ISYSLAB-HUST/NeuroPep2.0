<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neuropeptide Database - Analyze</title>

    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/highcharts.src.js"></script>
    <%--<script src="http://code.highcharts.com/highcharts.js"></script>--%>
    <script type="text/javascript">
        console.log()
        var sequence = "${param.SEQ}";
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

    <style type="text/css">

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

    </style>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <%--<script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container" >

        <input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

        <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
        <%--Analyze--%>
        <%--<hr class="nav_hr"/>--%>
        <%--</div>--%>

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Analyze</li>
        </ol>

        <div id="content" style="margin: 35px 10px 15px 10px;">

            <div style="padding-left:40px;">
                <div style="padding-bottom: 15px;">
                    <b style="font-weight: bold;">Molecular weight:</b> <c:out value="${param.mw }"></c:out>
                    <br/>
                    <b style="font-weight: bold;">Theoretical pI:</b> <c:out value="${param.pi }"></c:out>
                </div>
                <div style="padding:15px 0px;">
                    <div id="charged"></div>
                    <span style="font-size: 14px; padding-left: 10px;">Red: negatively charged; Blue: positively charged</span><br/>
                    Total number of negatively charged residues (Asp + Glu): <font id="nve_count"></font><br/>
                    Total number of positively charged residues (Arg + Lys): <font id="pve_count"></font><br/>

                </div>
                <div style="padding:15px 0px;">
                    <div id="hydrop"></div>
                    <span style="font-size: 14px; padding-left: 10px;">Green: hydrophilic; Black: hydrophobic</span><br/>
                    Total number of hydrophobic residues: <font id="hydrophobic_count"> </font><br/>
                    Total number of hydrophilic residues: <font id="hydrophilic_count"> </font><br/>
                </div>
                <div id="analyze_text" style="display: none;">
                    <table cellpadding="0" cellspacing="0" border="1" bordercolor=red style="margin:10px 0px;">
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
            <div id="aacomposition" style="width: 80%" class="highchart"></div>
        </div>
    </div>
    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Statistics</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/highcharts.src.js"></script>
    <script type="text/javascript" src="neuropeptide/js/exporting.src.js"></script>
    <script type="text/javascript" src="neuropeptide/js/statistics-charts.js"></script>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">

        .highchart {
            min-width: 900px;
            height: 450px;
            padding: 10px;
            background: #d0d0d0;
        }

    </style>

    <script type="text/javascript">
        $(document).ready(function () {
//		$.get("http://localhost:8080/NeuroPep/service/rest/statistics/amino-acid-distribution",function(data){
/*
            var data = [17437, 6849, 15417, 19323, 13711, 20841, 7206, 9995, 13954, 26413, 6333, 11651, 16643, 12705, 18184, 22708, 11540, 12721, 3837, 9094];
            var sum = 0;
            var arr = new Array();
            for (var key in data) {
                sum += data[key];
            }
            console.log(sum);
            for (var j = 0; j < data.length; j++) {
                arr[j] = (data[j] / sum);
            }
*/
          let arr = [
              0.064,
              0.021,
              0.055,
              0.067,
              0.052,
              0.072,
              0.025,
              0.039,
              0.053,
              0.096,
              0.024,
              0.045,
              0.057,
              0.045,
              0.061,
              0.082,
              0.046,
              0.05,
              0.014,
              0.031]
            amin_oacids_column.series[0].data = arr;
            console.log(amin_oacids_column);
            new Highcharts.Chart(amin_oacids_column);
//		});
//		$.get("service/rest/statistics/family-distribution",function(data){
//             var data2 =
//                 [["FARP", 867], ["NA", 538], ["Allatostatin", 361], ["Periviscerokinin", 282], ["Tachykinin", 269], ["Pyrokinin", 266], ["Glucagon", 242], ["CCK/gastrin", 233], ["NPY", 226], ["Insulin ", 207], ["POMC", 207], ["Orcokinin", 191], ["AKH/HRTH/RPCH", 182], ["Opioid", 175], ["CHH/MIH/GIH/VIH", 117], ["Serpin", 104], ["Somatotropin/prolactin", 101], ["Chromogranin/secretogranin ", 98], ["Vasopressin/oxytocin", 88], ["Natriuretic peptide", 84], ["GnRH", 74], ["Corazonin", 63], ["others", 974]];
            var data2 = [['AKH/HRTH/RPCH', 520],
                ['Allatostatin', 604],
                ['Arthropod CHH/MIH/GIH/VIH hormone', 154],
                ['Bombesin/neuromedin-B/ranatensin', 60],
                ['Bradykinin-related peptide', 157],
                ['Calcitonin', 61],
                ['Cerebellins', 48],
                ['Chromogranin/secretogranin', 350],
                ['Corazonin', 185],
                ['Endothelin/sarafotoxin', 55],
                ['FMRFamide related peptide', 1153],
                ['Gastrin/cholecystokinin', 393],
                ['Glucagon', 293],
                ['GnRH', 209],
                ['Insulin ', 516],
                ['Kinin', 89],
                ['Motilin', 57],
                ['NPY', 369],
                ['Natriuretic peptide', 373],
                ['Neuropeptide-like peptide', 645],
                ['Opioid', 288],
                ['Orcokinin', 269],
                ['POMC', 206],
                ['Periviscerokinin', 383],
                ['ProSAAS', 101],
                ['Pyrokinin', 515],
                ['Sauvagine/corticotropin-releasing factor/urotensin I', 89],
                ['Serpin', 327],
                ['Somatostatin', 106],
                ['Somatotropin/prolactin', 217],
                ['Tachykinin', 403],
                ['VGF', 40],
                ['Vasopressin/oxytocin', 135],
                ['others', 2447]];
            familyPie.series[0].data = data2;
            new Highcharts.Chart(familyPie);
//		});
//		$.get("service/rest/statistics/phyla-distribution",function(data){
//             var data3 =
//                 [["Arthropoda", 2635], ["Chordata", 2457], ["Nematoda", 355], ["Mollusca", 302], ["NA", 89], ["Cnidaria", 58], ["Annelida", 24], ["Platyhelminthes", 15], ["Echinodermata", 12], ["Hemichordata", 2]]
//             ;
            var data3 = [['Annelida', 30],
                ['Arthropoda', 5084],
                ['Chordata', 4723],
                ['Cnidaria', 83],
                ['Echinodermata', 75],
                ['Hemichordata', 2],
                ['Mollusca', 519],
                ['Nematoda', 709],
                ['Platyhelminthes', 19]];
            phylaPie.series[0].data = data3;
            new Highcharts.Chart(phylaPie);
//		});
//		$.get("service/rest/statistics/source-distribution",function(data){
            var data4 =
                [["Scientific literature", 2069], ["UniProt", 2216], ["NeuroPedia and database <br/> www.neuropeptides.nl", 1664]]
            ;
            sourcePie.series[0].data = data4;
            new Highcharts.Chart(sourcePie);

            var data5 = [['Chordata', 432],
                ['Arthropoda', 16],
                ['Nematoda', 4],
                ['Mollusca', 3],
                ['Annelida', 1]];
            phylaPieReceptor.series[0].data = data5;
            new Highcharts.Chart(phylaPieReceptor);

            // var data6 = [['Adrenomedullin', 33],
            //     ['AKH/HRTH/RPCH', 3],
            //     ['Apelin', 14],
            //     ['PDH', 2],
            //     ['AVIT (prokineticin)', 7],
            //     ['Bombesin/neuromedin-B/ranatensin', 16],
            //     ['Bradykinin-related peptide', 26],
            //     ['Calcitonin', 37],
            //     ['Corazonin', 37],
            //     ['CCHamide', 2],
            //     ['Endothelin/sarafotoxin', 43],
            //     ['FARP', 66],
            //     ['Galanin', 27],
            //     ['CCK/gastrin', 147],
            //     ['Glucagon', 57],
            //     ['GnRH ', 44],
            //     ['Insulin', 111],
            //     ['KISS1', 12],
            //     ['Leptin', 6],
            //     ['MCH', 21],
            //     ['Motilin', 13],
            //     ['Natriuretic peptide', 166],
            //     ['Neurexophilin', 7],
            //     ['NmU', 25],
            //     ['Neuropeptide B/W', 18],
            //     ['Neurotensin', 16],
            //     ['NPY', 133],
            //     ['Opioid', 93],
            //     ['Orexin', 23],
            //     ['Parathyroid hormone', 15],
            //     ['POMC', 98],
            //     ['Pyrokinin', 4],
            //     ['RFamide neuropeptide', 3],
            //     ['Sauvagine/CRF/urotensin', 32],
            //     ['Serpin', 19],
            //     ['Somatostatin', 39],
            //     ['Somatotropin/prolactin', 57],
            //     ['Spexin', 10],
            //     ['Tachykinin', 16],
            //     ['TRH', 7]
            //     ['Urotensin-2', 7],
            //     ['Vasopressin/oxytocin', 27]
            // ];
            // familyPieNandR.series[0].data = data6;
            new Highcharts.Chart(familyNandR_column);
//		});
            displayGraph(2);
//		displayGraph(0);
// 		displayGraph(3);
        });

        function displayGraph(selectedIndex) {
            var number = Math.random() + 1;
            var now = new Date();
            var randomNum = number + now;
            url = "dataView?value=" + selectedIndex + "&RrandomNum=" + randomNum;
            $.getJSON(url, {
                "resultType": "json"
            }, function (dataDraw, textStatus) {
                draw(dataDraw, selectedIndex);
            });

        }

        function draw(dataDraw, selectedIndex) {

            if ("0" == selectedIndex) {
                organismVertebratePie.series[0].data = dataDraw.vertebrate;
                organismInvertebratePie.series[0].data = dataDraw.invertebrate;
                console.log(organismVertebratePie);
                new Highcharts.Chart(organismVertebratePie);
                new Highcharts.Chart(organismInvertebratePie);
            } else if ("2" == selectedIndex) {
//			lenHistogram.subtitle.text = "Length distribution of neuropeptides";
                var series = [];
                var index = 0;
                for (attribute in dataDraw.series) {
                    var temp = {};
                    temp['name'] = attribute;
                    if (index == 1) {
                        temp['color'] = '#8bbc21';
                    }
                    temp['data'] = dataDraw.series[attribute];
                    series[index] = temp;
                    index++;
                }
                lenHistogram.xAxis.categories = dataDraw.category;
                lenHistogram.series = series;
//			lenHistogram.xAxis.min = 0;
//			lenHistogram.xAxis.max = len;
                console.log(lenHistogram);
                new Highcharts.Chart(lenHistogram);
            } else if ("1" == selectedIndex) {
                familyPie.series[0].data = dataDraw;
                new Highcharts.Chart(familyPie);
            } else if ("3" == selectedIndex) {
                sourcePie.series[0].data = dataDraw;
                new Highcharts.Chart(sourcePie);
            } else {
                alert("erro");
            }

        }
    </script>
</head>

<body id="Statistics">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

<input type="hidden" name="nav_cap" id="nav_cap" value="Statistics"/>

<%--<div id="pagetitle"--%>
<%--style="clear: both; font-size: 18px; color: #F60;">--%>
<%--Statistics--%>
<%--<hr class="nav_hr"/>--%>
<%--</div>--%>

<ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
    <li>Statistics</li>
</ol>

<div id="content"
     style="line-height: 35px; margin: 35px 10px 15px 10px;">
    <!--
    <select id="indicatorChange" style="width: 160px;"
        name="indicatorChange"
        onchange="displayGraph(this.options.selectedIndex)">
        <option>Family</option>
        <option>Organism</option>
        <option>Sequence length</option>
        <option>Source</option>
    </select>
     -->
    <div id="family_graph_container" class="highchart"></div>
    <div id="phyla_graph_container" class="highchart"></div>
    <div id="phyla_graph_container_receptor" class="highchart" style="display: none"></div>
    <div id="family_graph_container_NandR" class="highchart"></div>
    <div id="source_graph_container" class="highchart" style="display: none"></div>
    <div id="orgnism_invertebrate_container" class="highchart" style="display: none"></div>
    <div id="orgnism_vertebrate_container" class="highchart" style="display: none"></div>
    <div id="seq_graph_container" class="highchart"></div>
    <div id="amino_acids_distribution_container" class="highchart"></div>
</div>
<!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>

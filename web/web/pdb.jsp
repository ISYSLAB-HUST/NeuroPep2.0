<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
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
    <title>Neuropeptide Database - Analyze</title>

    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/highcharts.src.js"></script>
    <script type="text/javascript" src="jmol/Jmol.js"></script>

    <script type="text/javascript">
        var sequence = "${param.pdb}";

        function cc(seq) {
            var aa;
            for (var i = 0; i < seq.length; i++) {
                aa = seq.charAt(i);
                if (Hydrophobic.in_array(aa)) {
                    console.log(aa);
                    hydrophobic_count++;
                    $('#colorsequence').append('<span class="hydrophobic">' + aa + '</span>');
                } else if (Hydrophilic.in_array(aa)) {
                    hydrophilic_count++;
                    $('#colorsequence').append('<span class="hydrophilic">' + aa + '</span>');
                } else if (positive_ve.in_array(aa)) {
                    pve_count++;
                    hydrophilic_count++;
                    $('#colorsequence').append('<span class="pve">' + aa + '</span>');
                } else if (negative_ve.in_array(aa)) {
                    nve_count++;
                    hydrophilic_count++;
                    $('#colorsequence').append('<span class="nve">' + aa + '</span>');
                } else {
                    $('#colorsequence').append('<span>' + aa + '</span>');
                }
            }
            var nac_count = sequence.length - pve_count - nve_count;
            $('#hydrophobic_count').html(hydrophobic_count + '<font color=blue>(' + (hydrophobic_count / sequence.length * 100).toFixed(1) + '%)</font>');
            $('#hydrophilic_count').html(hydrophilic_count + '<font color=blue>(' + (hydrophilic_count / sequence.length * 100).toFixed(1) + '%)</font>');
            $('#pve').html(pve_count + '<font color=blue>(' + (pve_count / sequence.length * 100).toFixed(1) + '%)</font>');
            $('#nve').html(nve_count + '<font color=blue>(' + (nve_count / sequence.length * 100).toFixed(1) + '%)</font>');
            $('#nac').html(nac_count + '<font color=blue>(' + (nac_count / sequence.length * 100).toFixed(1) + '%)</font>');

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
        .hydrophobic {
            color: green;
        }

        .pve {
            color: red;
        }

        .nve {
            color: blue;
        }
    </style>


</head>
<body>
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container" >

<input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

<%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
<%--PDB--%>
<%--<hr class="nav_hr"/>--%>
<%--</div>--%>

<ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
    <li>PDB</li>
</ol>

<div id="content" style="margin: 35px 10px 15px 10px;">
    <div align="center">
        <script type="text/javascript">
            var pdb = "${param.pdbName}";
            /*去掉其中的括号 */
            pdb = pdb.replace(/\(.*\)/, "");
            pdb = pdb.replace(/MODEL_/, "");
            jmolInitialize("<%=basePath%>jmol");
            jmolApplet(
                450,
                "load jmol/pdb/"
                + pdb
                + ".pdb"
                + ";  restrict water; select protein; color group; cartoon;  select 158,188,203,204,205,206,218,239; spacefill 25%;  wireframe 50; color group; select 158 and *.ca; label %m%r; color label magenta;select 188 and *.ca; label %m%r; color label magenta;select 203 and *.ca; label %m%r; color label magenta;select 204 and *.ca; label %m%r; color label magenta;select 205 and *.ca; label %m%r; color label magenta;select 206 and *.ca; label %m%r; color label magenta;select 218 and *.ca; label %m%r; color label magenta;select 239 and *.ca; label %m%r; color label magenta;  label %m%r; color label magenta; zoomto {40.678 7.626 20.585} 150; spin on; select hetero; spacefill 95%; frame all;");
            document.write("<br>");
            jmolButton("Reset", "Reset to initial orientation");
            jmolCheckbox("spin on", "spin off", "spin", "checked=true");
            jmolBr();
        </script>
    </div>
</div>
</div>

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
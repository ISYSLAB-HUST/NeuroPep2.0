<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <title>Neuropeptide Database - Submission</title>
    <meta name="keywords"
        content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict" />
    <meta name="description" content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database" />
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/front_login.css" rel="stylesheet" type="text/css" />
    <link href="neuropeptide/css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="favicon.ico" type="mage/x-icon" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <!-- <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>
    <script type='text/javascript' src='dwr/interface/NeuropeptideDWR.js'></script> -->
    <script type="text/javascript" src="neuropeptide/js/ajax.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $(".signin").click(function (e) {
                e.preventDefault();
                $("fieldset#signin_menu").toggle();
                $(".signin").toggleClass("menu-open");
            });
            $("fieldset#signin_menu").mouseup(function () {
                return false;
            });
            $(document).mouseup(function (e) {
                if ($(e.target).parent("a.signin").length == 0) {
                    $(".signin").removeClass("menu-open");
                    $("fieldset#signin_menu").hide();
                }
            });

        });

        function strToJson(strResult) {
            var json = (new Function("return " + strResult))();
            return json;
        }

        function autoC_organism() {
            var organisms = function callbackorganisms(data) {
                var jsonData = strToJson(data);
                $("#organism").autocomplete(jsonData, {
                    minChars: 0,
                    max: 100,
                    autoFill: false,
                    mustMatch: false,
                    matchContains: false
                });
            };
            NeuropeptideDWR.get_organism(organisms);
        }
    </script>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .submission td {
            padding-left: 10px;
            line-height: 30px;
            word-wrap: break-word;
            word-break: break-all;
        }

        .submission a {
            text-decoration: none;
            color: #06F;
        }

        .submission a:hover {
            text-decoration: none;
            color: #F60;
        }

        .entrance_a {
            text-decoration: none;
            color: #06F;
            cursor: pointer;
        }

        .entrance_a:hover {
            color: #F60;
        }

        .menu {
            width: 200px;
        }
    </style>

</head>

<body id="Submission">

<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="topnav" class="topnav" style="margin-right: 10px;position: absolute;right: 30px;top: 130px">

    <span class="label label-primary">Admin Approval Entrance</span>
    <a href="login" class="signin"><span>login</span></a>
</div>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Submission" />
    <fieldset id="signin_menu">
        <form method="post" id="signin" action="submission">
            <p>
                <label for="username">Username</label>
                <input id="username" name="username" value="" title="username" tabindex="4" type="text" />
            </p>
            <p>
                <label for="password">Password</label>
                <input id="password" name="password" value="" title="password" tabindex="5" type="password" />
            </p>
            <p class="remember">
                <input id="signin_submit" value="Login" tabindex="6" type="submit" />
            </p>
        </form>
    </fieldset>
    <%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
    <%--Submission--%>
    <%--<div id="topnav" class="topnav"--%>
    <%--style="margin-right: 10px;">--%>
    <%--Admin Approval Entrance <a href="login" class="signin"><span>login</span>--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--<fieldset id="signin_menu">--%>
    <%--<form method="post" id="signin" action="submission">--%>
    <%--<p>--%>
    <%--<label for="username">Username</label> <input id="username"--%>
    <%--name="username" value="" title="username" tabindex="4"--%>
    <%--type="text"/>--%>
    <%--</p>--%>
    <%--<p>--%>
    <%--<label for="password">Password</label> <input id="password"--%>
    <%--name="password" value="" title="password" tabindex="5"--%>
    <%--type="password"/>--%>
    <%--</p>--%>
    <%--<p class="remember">--%>
    <%--<input id="signin_submit" value="Login" tabindex="6" type="submit"/>--%>
    <%--</p>--%>
    <%--</form>--%>
    <%--</fieldset>--%>

    <%--<!-- <div style="float:right; margin-right:10px;"><a class="entrance_a"--%>
    <%--onclick="">Admin Approval Entrance</a></div> -->--%>


    <%--<hr class="nav_hr"/>--%>
    <%--</div>--%>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Submission</li>
    </ol>

    <div id="content" style="line-height: 35px; margin: 35px 10px 15px 10px;">
        <p id="infoBox" style="color: #06F; padding-left: 15px;">
            <s:if test="#request.relInfo != null">"${relInfo}"</s:if>
        </p>
        <table class="submission" width="960" align="center" border="0" cellpadding="0" cellspacing="3"
            style="vertical-align: middle;">
            <tr>
                <td class="menu"><label for="sequence"><strong>choose to</strong><font color="red">*</font></label></td>
                <td width="815">
                    <select id="search_category" class="selectType" onchange="excCategory(this)">
                        <option value="neuro">Neuropeptite</option>
                        <option value="Receptor">Receptor</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="menu"><label for="sequence">Sequence<font color="red">*</font></label></td>
                <td width="815">
                    <textarea id="sequence" name="sequence" rows="6" cols="75"
                        style="vertical-align: middle;"></textarea>
                    <input name="exaSequence" type="button" value="Example" onclick="exaSequence();" />
                    <span id="sequenceErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr>
                <td class="menu"><label for="organism">Organism<font color="red">*</font></label></td>
                <td class="menu">
                    <input type="text" id="organism" name="organism" value="" style="width: 230px;" />
                <input name="exaOrganism" type="button" value="Example" onclick="exaOrganism();" />
                <span id="organismErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr>
                <td class="menu"><label for="phyla">Phyla</label></td>
                <td width="715"><input type="text" id="phyla" name="phyla" value="" style="width: 230px;" />
                    <input name="exaPhyla" type="button" value="Example" onclick="exaPhyla();" /> <span id="phylaErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr id="familyitem">
                <td class="menu"><label for="family">Family</label></td>
                <td width="715">
                    <input type="text" id="family" name="family" value="" style="width: 230px;" />
                    <input name="exaFamily" type="button" value="Example" onclick="exaFamily();" /> <span id="familyErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr>
                <td class="menu"><label for="name">Name</label></td>
                <td width="715">
                    <input type="text" id="name" name="name" value="" style="width: 230px;" />
                    <input name="exaName" type="button" value="Example" onclick="exaName();" /> <span
                        id="nameErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr>
                <td class="menu"><label for="modification">Modification</label></td>
                <td width="715">
                    <input type="text" id="modification" name="modification" value=""
                        style="width: 230px;" />
                    <input name="exaModification" type="button" value="Example"
                        onclick="exaModification();" />
                    <span id="modificationErro" style="color: #F00; padding-left: 5px;"></span>
                </td>
            </tr>
            <tr>
                <td class="menu"><label for="tissue_specificity">Tissue Specificity</label></td>
                <td width="715">
                    <input type="text" id="tissue_specificity" name="tissue_specificity" value="" style="width: 230px;" /> <input name="exaTissue_specificity" type="button"
                        value="Example" onclick="exaTissue_specificity()" />
                    <span id="tissue_specificityErro" style="color: #F00; padding-left: 5px;"></span></td>
            </tr>
            <tr>
                <td class="menu"><label for="uniprotNum">UnitProt ID</label></td>
                <td width="715">
                    <input type="text" id="uniprotAcc" name="uniprotAcc" value="" /> <input name="exaUniprot" type="button" value="Example" onclick="exaUniprot();" />
                </td>
            </tr>
            <tr>
                <td class="menu">
                    <label for="email">E-mail<font color="red">*</font></label></td>
                <td width="715">
                    <input type="text" id="email" name="email" value="" style="width: 230px;" />
                    <span id="emailErro" style="color: #F00; padding-left: 5px;"></span>
                </td>
            </tr>
            <tr>
                <td class="menu"><label for="description">Description</label></td>
                <td width="715"><textarea id="description" name="description" rows="6" cols="75">
            </textarea></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <input name="submit" class="btn btn-primary" type="submit" value="Submit" onclick="subSubmit();" />&nbsp;
                    <input type="reset" class="btn btn-primary" name="resetbutton" value="Reset" onclick="reset(); " />
                </td>
            </tr>
        </table>
    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>

</html>

<script type="text/javascript">
    function excCategory(obj){
        reset();
        // $('#NPIDval').val('');
        var value = $(obj).val();
        console.log(value);
        if(value == 'Receptor'){
            $("#familyitem").css('display','none');
            // $("#neuroMw").css('display','none');
            // $("#neuroPi").css('display','none');
            // $("#nametips").css('display','none');
            // $('#nametipsR').css('display','block');
        }else if(value == 'neuro'){
            $("#familyitem").css('display','table-row');
            // $("#neuroFamily").css('display','block');
            // $("#neuroMw").css('display','block');
            // $("#neuroPi").css('display','block');
            // $("#nametips").css('display','block');
            // $('#nametipsR').css('display','none');
        }

    }
    // 在指定的URL上添加参数
    function makeSubString() {
        var category = document.getElementById("search_category").value;
        var email = document.getElementById("email").value;
        var name = document.getElementById("name").value;
        var sequence = document.getElementById("sequence").value;
        var organism = document.getElementById("organism").value;
        var family = document.getElementById("family").value;
        var phyla = document.getElementById("phyla").value;
        var tissue_specificity = document.getElementById("tissue_specificity").value;
        var uniprotAcc = document.getElementById("uniprotAcc").value;
        var description = document.getElementById("description").value;
        var queryString = "email=" + email + "&name=" + name +
            "&sequence=" + sequence +
            "&organism=" + organism +
            "&family=" + family +
            "&uniprotAcc=" + uniprotAcc +
            "&description=" + description +
            "&phyla=" + phyla +
            "&tissue_specificity=" + tissue_specificity+
            "&category=" + category;
        return queryString;
    }

    function userTip(xmlhttp, obj) {

        var strResult = xmlhttp.responseText;
        var infoBox = document.getElementById("infoBox");
        infoBox.innerHTML = strResult;
        var input = document.getElementsByTagName("input");
        var textarea = document.getElementsByTagName("textarea");
        for (var i = 0; i < input.length; i++) {
            if (input[i].type == "text") {
                input[i].value = "";
            }
        }

        for (var i = 0; i < textarea.length; i++) {
            textarea[i].value = "";
        }

    }

    function RegEmail() {
        var regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        var str_email = document.getElementById("email").value;
        var result = regEmail.test(str_email);
        if (result == false) {
            var emailErro = document.getElementById("emailErro");
            emailErro.innerHTML = "wrong email address, please check again !";
        } else {
            var emailErro = document.getElementById("emailErro");
            emailErro.innerHTML = "";
        }
        return result;
    }

    function RegName() {
        var regName = /^[A-Za-z]*(\s[A-Za-z]+)*$/;
        var name = document.getElementById("name").value;
        var result = regName.test(name);
        if (result == false) {
            var nameErro = document.getElementById("nameErro");
            nameErro.innerHTML = "wrong name, please check again !";
            return false;
        } else {
            var nameErro = document.getElementById("nameErro");
            nameErro.innerHTML = "";
            return true;
        }
    }

    function RegSequence() {
        var regSequence = /^[A-Za-z]+$/;
        var sequence = document.getElementById("sequence").value;
        var result = regSequence.test(sequence);
        if (result == false) {
            var sequenceErro = document.getElementById("sequenceErro");
            sequenceErro.innerHTML = "wrong sequence, please check again !";
            return false;
        } else {
            var sequenceErro = document.getElementById("sequenceErro");
            sequenceErro.innerHTML = "";
            return true;
        }
    }

    function RegOrganism() {
        var regOrganism = /^[A-Za-z]*(\s[A-Za-z]+)*(\s\([A-Za-z(\s)?]+\))?$/;
        var organism = document.getElementById("organism").value;
        var result = regOrganism.test(organism);
        if (result == false) {
            var nameErro = document.getElementById("organismErro");
            nameErro.innerHTML = "wrong organism, please check again !";
            return false;
        } else {
            var organismErro = document.getElementById("organismErro");
            organismErro.innerHTML = "";
            return true;
        }
    }

    function RegFamily() {
        var regFamily = /^[A-Za-z]*(\s[A-Za-z]+)*$/;
        var family = document.getElementById("family").value;
        var result = regFamily.test(family);
        if (result == false) {
            var nameErro = document.getElementById("familyErro");
            nameErro.innerHTML = "wrong family, please check again !";
            return false;
        } else {
            var nameErro = document.getElementById("nameErro");
            nameErro.innerHTML = "";
            return true;
        }
    }

    function exaEmail() {
        document.getElementById("email").value = "example@example.com"
    }

    function exaName() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("name").value = "Receptor activity-modifying protein 2"
        }else if(category == 'neuro'){
            document.getElementById("name").value = "7B2 C-terminal peptide (5-13)"
        }
    }

    function exaSequence() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("sequence").value = "MASLRVERAGGPRLPRTRVGRPAALRLLLLLGAVLNPHEALAQPLPTTGTPGSEGGTVKNYETAVQFCWNHYKDQMDPIEKDWCDWAMISRPYSTLRDCLEHFAELFDLGFPNPLAERIIFETHQIHFANCSLVQPTFSDPPEDVLLAMIIAPICLIPFLITLVVWRSKDSEAQA"
        }else if(category == 'neuro'){
            document.getElementById("sequence").value = "FSEEEKEPE"
        }
    }

    function exaOrganism() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("organism").value = "Homo sapiens"
        }else if(category == 'neuro'){
            document.getElementById("organism").value = "Rattus norvegicus"
        }

    }

    function exaFamily() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("family").value = "Adrenomedullin"
        }else if(category == 'neuro'){
            document.getElementById("family").value = "7B2"
        }
    }

    function exaUniprot() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("uniprotAcc").value = "RAMP2_HUMAN"
        }else if(category == 'neuro'){
            document.getElementById("uniprotAcc").value = "7B2_HUMAN"
        }
    }

    function exaPhyla() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("phyla").value = "Chordata"
        }else if(category == 'neuro'){
            document.getElementById("phyla").value = "Chordata"
        }
    }

    function exaModification() {
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("modification").value = "Phosphorylation"
        }else if(category == 'neuro'){
            document.getElementById("modification").value = "Amidation"
        }
    }

    function exaTissue_specificity(){
        var category = document.getElementById("search_category").value;
        if(category == 'Receptor'){
            document.getElementById("tissue_specificity").value = "Expressed in epididymis (at protein level)."
        }else if(category == 'neuro'){
            document.getElementById("tissue_specificity").value = "Highly expressed in young leaves, at intermediate level in mature leaves and at low levels in flowers and fruits."
        }

    }


    function subSubmit() {
        if (RegEmail() == true && RegOrganism() == true && RegSequence()) {
            ajaxrequest("save_submission", "post", true, makeSubString(), userTip, document);
        } else {
            return;
        }
    }

    function reset() {
        document.getElementById("email").value = "";
        document.getElementById("name").value = "";
        document.getElementById("sequence").value = "";
        document.getElementById("organism").value = "";
        document.getElementById("family").value = "";
        document.getElementById("uniprotAcc").value = "";
        document.getElementById("modification").value = "";
        document.getElementById("description").value = "";
        document.getElementById("phyla").value = "";
        document.getElementById("tissue_specificity").value = "";
    }
</script>
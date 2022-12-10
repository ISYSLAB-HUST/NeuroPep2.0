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

    <link href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css"
          rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        .ui-autocomplete {
            max-height: 150px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }

        #datatable {
            word-break: break-all;
            word-wrap: break-all;
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
<div id="container">

<input type="hidden" name="nav_cap" id="nav_cap" value="Search"/>

<%--<div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">--%>
<%--Advanced Search--%>
<%--<!----%>
<%--<div id="navSearch" class="navSearch" style="margin-right: 10px;">--%>
<%--<div>--%>
<%--<a href="blast.jsp" class="blast_search"><span>Blast--%>
<%--Search</span> </a>--%>
<%--</div>--%>
<%--<div>--%>
<%--<a href="web_service.jsp" class="web_service"><span>Web--%>
<%--Service</span> </a>--%>
<%--</div>--%>
<%--</div>--%>
<%---->--%>
<%--<hr class="nav_hr"/>--%>
<%--</div>--%>

<ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
    <li>Search</li>
    <li>Advanced Search</li>
</ol>


<div id="content" style="line-height: 35px; margin: 35px 10px 15px 10px; border: 1px solid #999;">
    <div id="nullValDiv"></div>

    <form name="searchform">
        <input type="hidden" name="p" value="search"/>

        <table class="searchform" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="labelText">
                    <label for="accession_number">
                        <a href="help.jsp#peptide_accession_number" target="_blank">Peptide
                    accession number:</a>
                    </label>
                </td>
                <td class="expand">
                    <input id="accession_number"
                            name="accession_number" value="" type="text" tabindex="1"/>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="name">
                    <a href="help.jsp#peptide_name" target="_blank">Peptide name:</a> </label>
                </td>
                <td class="expand">
                    <input id="name" name="name" value="" type="text" tabindex="2" onblur="RegName()"/>
                    <span id="nameErro" style="color: #F00; padding-left: 5px;"></span>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="organism_group">
                    <a href="help.jsp#organism" target="_blank">Organism:</a></label>
                </td>
                <td class="expand">
                    <input id="organism_group"
                        name="organism_group" style="width: 300px;" tabindex="3"/><!--
                        <img src="neuropeptide/img/comment.ico" style="position:absolute;z-index:1001;margin-left:1px;margin-top:3px;"> -->
                    <span id="nameErro" style="color: #F00; padding-left: 5px;"></span>
                </td>
            </tr>

            <tr>
                <td class="labelText"><label for="familyspecs">
                    <a href="help.jsp#peptide_family" target="_blank">Peptide family:</a></label>
                </td>
                <td class="expand">
                    <input id="family_group"name="family_group" tabindex="6" style="width: 300px;"/>
                    <!-- <img class="autocomplete_comment_img" src="neuropeptide/img/comment.ico" style="position:absolute;z-index:1001;margin-left:1px;margin-top:3px;"> -->
                    <span id="nameErro" style="color: #F00; padding-left: 5px;"></span>
                </td>

            </tr>
            <tr style="display: none;">
                <td class="labelText"><label for="uniprot">
                    <a href="help.jsp#uniprot_accession_number" target="_blank">Uniprot
                    accession number:</a> </label>
                </td>
                <td class="expand">
                    <input id="uniprot" name="uniprot" value="" type="text" tabindex="7"/>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="aminoacid">
                    <a href="help.jsp#aminoacid" target="_blank">Amino acid
                    sequence:</a> </label>
                </td>
                <td class="expand">
                    <input id="aminoacid" name="aminoacid"
                        value="" type="text" tabindex="8" onblur="RegSequence()"/>
                    <span id="sequenceErro" style="color: #F00; padding-left: 5px;"></span>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="length"><a
                        href="help.jsp#peptide_length" target="_blank">Length:</a> </label></td>
                <td class="expand">
                    <normal>from:</normal>
                    <input class="short condi_from" id="length_from" name="length_from"
                            value="" type="text" tabindex="4"/>
                    <normal>to:</normal>
                    <input class="short condi_to" id="length_to" name="length_to" value=""
                            type="text" tabindex="5"/>
                    <span class="erroMessage" style="color: #F00;"></span>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="mw">
                    <a href="help.jsp#peptide_length" target="_blank">Molecular
                    Weight:</a> </label>
                </td>
                <td class="expand">
                    <normal>from:</normal>
                    <input class="short condi_from" id="mw_from" name="mw_from" value=""
                        type="text" tabindex="4"/>
                    <normal>to:</normal>
                    <input class="short condi_to" id="mw_to" name="mw_to" value=""
                        type="text" tabindex="5"/>
                    <span class="erroMessage" style="color: #F00;"></span>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="pi"><a
                        href="help.jsp#peptide_length" target="_blank">Isoelectric
                    Point:</a> </label></td>
                <td class="expand">
                    <normal>from:</normal>
                    <input class="short condi_from" id="pi_from" name="pi_from" value=""
                            type="text" tabindex="4"/>
                    <normal>to:</normal>
                    <input class="short condi_to" id="pi_to" name="pi_to" value=""
                            type="text" tabindex="5"/>
                    <span class="erroMessage" style="color: #F00;"></span>
                </td>
            </tr>
            <tr>
                <td class="labelText"><label for="source">
                    <a href="help.jsp#aminoacid" target="_blank">Source:</a></label>
                </td>
                <td class="expand">
                    <input type="checkbox" name="source" value="A" checked="checked"/>
                    &nbsp;&nbsp;PubMed &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="source" value="SP" checked="checked"/>&nbsp;&nbsp;Uniprot
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="source" value="F" checked="checked"/>&nbsp;&nbsp;PDF
                </td>
            </tr>

            <tr>
                <td class="labelText">&nbsp;</td>
                <td class="expand">
                    <input class="button" type="button" name="submitbutton" value="Submit" onclick="searchSubmit();"
                        tabindex="9"/>&nbsp;&nbsp;
                    <input class="button" type="reset" name="resetbutton" value="Reset" tabindex="10"/>
                </td>
            </tr>
        </table>

    </form>


</div>
<!-- close div#content -->


<div id="search_result" align="center"
     style="margin: auto 10px 25px 10px; font-size: 13px"></div>

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>


<script type="text/jscript">

$(document).ready(function(){

	$("#family_group").autocomplete({
		source: ${family},
		minLength: 0,
		change: function(event,ui){
			if (!ui.item) {
                $(this).val('');
               	$(this).siblings("span").text("your input didn't match any item");
            }else{
            	$(this).siblings("span").text("");
            }
		}}
	);

	$("#organism_group").autocomplete({
		source: ${organism},
		minLength: 0,
		change: function(event,ui){
			if (!ui.item) {
                $(this).val('');
               	$(this).siblings("span").text("your input didn't match any item");
            }else{
            	$(this).siblings("span").text("");
            }
		}}
	);

//	$(".autocomplete_comment_img").hover(function(){

//	});

	$(".condi_from").change(function(){
		var regName = /(^[1-9][0-9]*$)|([1-9][0-9]*\.[0-9]+$)/g;
	    var from = $(this).val().trim();
	    $(this).siblings("span").text("");
	    if(!from) return;
	    if(!regName.test(from)){
	    	$(this).siblings("span").text("wrong from length, please check again !");
	    	$(this).val("");
	    }
	    var next_to = $(this).next().next().val();
//	    console.log(parseFloat(from));
//	    console.log(parseFloat(next_to));
	    if(next_to && parseFloat(from) > parseFloat(next_to)){
	    	$(this).siblings("span").text("from length should not greater than to length");
	    	$(this).val("");
	    }
	});

	$(".condi_to").change(function(){
		var regName = /(^[1-9][0-9]*$)|([1-9][0-9]*\.[0-9]+$)/g;
	    var to = $(this).val().trim();
//	    console.log(to);
	    $(this).siblings("span").text("");
	    if(!to) return;
	    if(!regName.test(to)){
	    	$(this).siblings("span").text("wrong to length, please check again !");
	    	$(this).val("");
	    }
	    var prev_from = $(this).prev().prev().val();
	    if(prev_from && parseFloat(prev_from) > parseFloat(to)){
	    	$(this).siblings("span").text("to length should not less than from length");
	    	$(this).val("");
	    }
	});
});

function Regfrom(obj) {
      var regName = /(^[1-9][0-9]*$)|([1-9][0-9]*\.[0-9]+$)/g;
      var from = obj.value.trim();
      console.log(from);
      if(from && !regName.test(from)){
    	  alert("wrong from length, please check again !");
    	  obj.value = "";
      }
}

function Regto(obj) {
    var regName = /(^[1-9][0-9]*$)|([1-9][0-9]*\.[0-9]+$)/g;
    var to = obj.value;
    console.log(to);
    if(to && !regName.test(to)){
        alert("wrong from length, please check again !");
        obj.value = "";
    }
    var sibling_from = $(obj).siblings("input").value();
    console.log(sibling_from);
    if(to && sibling_from){
        if(to < sibling_from)
            alert("wrong to length, must greater than to !");
    }
    if (name != "" || name != null) {
        var result =  regName.test(name);
        if ( result == false ) {
            alert("wrong to length, please check again !");
            document.getElementById("length_to").value = "";
            return false;
        }
        if ( from != "" && from > name ) {
            alert("wrong to length, please check again !");
            document.getElementById("length_to").value = "";
            return false;
        }
    }
}

	// 在指定的URL上添加参数
    function makeQueryString(){
    var accession_number = document.getElementById("accession_number").value;
    var name = document.getElementById("name").value;
    var length_from = document.getElementById("length_from").value;
    var length_to = document.getElementById("length_to").value;
    var uniprot = document.getElementById("uniprot").value;
    var aminoacid = document.getElementById("aminoacid").value;
    var organism_group = document.getElementById("organism_group").value;
    var family_group = document.getElementById("family_group").value;
    var source = "";
    var mw_from = document.getElementById("mw_from").value;
    var mw_to = document.getElementById("mw_to").value;
    var pi_from = document.getElementById("pi_from").value;
    var pi_to = document.getElementById("pi_to").value;

    if ( $("input[name='source']:checkbox:checked").length >0 ) {
        $("input[name='source']:checkbox:checked").each(function () {
            source += this.value +",";
        });
    } else {
    alert("please select a source !")
    }

    var queryString = "accession_number=" +

	accession_number + "&name=" + name +
                      "&length_from=" + length_from +
                      "&length_to=" + length_to +
                      "&organism_group=" + organism_group +
                      "&family_group=" + family_group +
                      "&uniprot=" + uniprot +
                      "&source=" + source +
                      "&aminoacid=" + aminoacid +
                      "&mw_from=" + mw_from +
                      "&mw_to=" + mw_to +
                      "&pi_from=" + pi_from +
                      "&pi_to=" + pi_to
    return queryString;
    }

    function strToJson(strResult){
        var json = (new Function("return " + strResult))();
        return json;
	}

    function checkAll() {
        if ($('input[name="checkAll"]:checkbox').is(":checked") == true) {
            $("input[name='neuro']:checkbox").prop("checked",true);//全选
        } else {
            $("input[name='neuro']:checkbox").prop("checked",false);//取消全选
        }
    }

    function checkNeuro(checked) {
        if ( checked == false ) {
            if ( $('input[name="checkAll"]:checkbox').is(":checked") == true ) {
                $('input[name="checkAll"]:checkbox').prop("checked",false);
            }
        }
    }

    function exportData() {
        var urlStr = "nueros=";

        if ($("input[name='neuro']:checkbox:checked").length > 0) {
            $("input[name='neuro']:checkbox:checked").each(function () {
                urlStr += this.value +",";
            });
            var urldata = urlStr.substring(0, urlStr.length-1);
            window.location.href = "download_xml?" + urldata;
        } else {
            alert("please select checkbox !");
            return;
        }
    }

    function searchSubmit(){
    	$('.erroMessage').html('');
    	$.ajax({
    		url:"search_result",
    		type : "POST",
    		dataType : "json",
    		data: makeQueryString(),
    		beforeSend: function(){
    			$('#search_result').html('<img src="neuropeptide/img/ajax-loader.gif"/>loading...');
    		},
    		success: function(data){
    			$('#search_result').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="datatable" width="100%"></table>' );
    			$('#datatable').dataTable({
    				"autoWidth": false,
    				"data": data,
    				"columns": [
    				    { "title": "sequence" },
    				    { "title": "length" },
    				    { "title": "family" },
    				    { "title": "organism" },
    				    { "title": "name" },
    				    { "title": "type" },
    				    { "title": "accessNum"}
    				  ],
    				 "columnDefs": [
		                   {
		                       // `data` refers to the data for the cell (defined by `mData`, which
		                       // defaults to the column being worked with, in this case is the first
		                       // Using `row[0]` is equivalent.
		                       "render": function ( data, type, row ) {
		                           return '<a target="_blank" href="search_info?pepNum='+ row[6]  +'">'+ data +'</a>';
		                       },
		                       "targets": 0
		                   },
		                   { "width": "20%", "targets": 0 },
		                   { "width": "10%", "targets": 5 },
		                   {
		                	   "visible": false,
		                	   "targets": 6
		                   }
    				  ]
    			});
    		}
    	});
    }


</script>

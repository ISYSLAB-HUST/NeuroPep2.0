<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


    <title>Neuropeptide Database - Submission</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        .neuropeptide td {
            padding-left: 10px;
            color: #666;
            border: 1px solid #ccc
            line-height: 30px;
            word-wrap: break-word;
            word-break: break-all;
        }

        .neuropeptide a {
            text-decoration: none;
            color: #06F;
        }

        .neuropeptide a:hover {
            text-decoration: none;
            color: #F60;
        }
    </style>

    <script type="text/jscript">
function deleteSub() {
   var subID = document.getElementById("subID").value;
   window.location.href = "delete_delSub?subID=" + subID;
}



    </script>
</head>

<body id="Search">
<div id="wrapper">

<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Submission"/>

    <%--<div id="pagetitle"--%>
    <%--style="clear:both; font-size:18px; color:#F60;">--%>
    <%--Submission--%>
    <%--<hr class="nav_hr"/>--%>
    <%--</div>--%>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Submission</li>
    </ol>


    <div id="content"
         style="line-height:35px; margin:35px 10px 15px 10px;">

        <form action="save_approval" name="approvalForm" id="approvalForm"
              method="post">
            <table class="neuropeptide" width="960" align="center" border="0"
                   cellpadding="0" cellspacing="3" style="vertical-align:middle;">

                <tr>
                    <td width="245">Email</td>
                    <td width="715"><s:property value="#request.subDetail.email"/>
                    </td>
                </tr>

                <tr>
                    <td width="245"><label for="name">Peptide name</label>
                    </td>
                    <td width="715"><input id="name" name="name"
                                           value='<s:property value="#request.subDetail.name" />'
                                           type="text" tabindex="1"/></td>
                </tr>

                <tr>
                    <td width="245"><label for="sequence">Sequence</label></td>
                    <td width="715"><textarea rows="4" cols="125" id="sequence"
                                              name="sequence" tabindex="2" readonly="readonly">
							<s:property value="#request.subDetail.sequence"/>
						</textarea></td>
                </tr>

                <tr>
                    <td width="245"><label for="length">Length</label>
                    </td>
                    <td width="715"><input id="length" name="length"
                                           value='<s:property value="#request.subDetail.length" />'
                                           type="text" tabindex="3"/></td>
                </tr>

                <tr>
                    <td width="245"><label for="organism_group">Organism</label>
                    </td>
                    <td width="715"><input id="organism_group"
                                           name="organism_group" style="width:200px;" tabindex="4"
                                           value='<s:property value="#request.subDetail.organism" />'
                                           type="text"/></td>
                </tr>
                <tr>
                    <td width="245"><label for="phyla">Phyla</label>
                    </td>
                    <td width="715"><input id="phyla"
                                           name="phyla" style="width:200px;" tabindex="4"
                                           value='<s:property value="#request.subDetail.phyla" />'
                                           type="text"/></td>
                </tr>

                <tr>
                    <td width="245"><label for="familyspecs">Peptide
                        family</label></td>
                    <td width="715"><input id="family_group" name="family_group"
                                           tabindex="5" style="width:200px;"
                                           value='<s:property value="#request.subDetail.family" />'
                                           type="text"/></td>
                </tr>
                <tr>
                    <td width="245"><label for="uniprot">UnitProt ID</label></td>
                    <td width="715"><input id="uniprot" name="uniprot"
                                           value='<s:property
									value="#request.subDetail.uniprotAcc" />'
                                           type="text" tabindex="6"/></td>
                </tr>
                <tr>
                    <td width="245"><label for="tissue_specificity">Tissue Specificity</label></td>
                    <td width="715"><input id="tissue_specificity" name="tissue_specificity"
                                           value='<s:property
									value="#request.subDetail.tissue_specificity" />'
                                           type="text" tabindex="6"/></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="hidden" id="subID" name="subID"
                               value='<s:property value="#request.subDetail.id" />'/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input class="button"
                                                          type="submit" name="submitbutton" value="Approval"
                                                          tabindex="7"/>&nbsp;&nbsp;
                        <input class="button" type="button" name="delbutton"
                               value="Delete" onclick="deleteSub();" tabindex="8"/></td>
                </tr>
            </table>
        </form>

    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
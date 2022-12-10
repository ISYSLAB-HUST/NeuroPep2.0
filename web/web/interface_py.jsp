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

    <style type="text/css">
        a {
            text-decoration: none;
            color: #06F;
        }

        a:hover {
            text-decoration: none;
            color: #F60;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="Submission">
<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <%--<%@ include file="/neuropeptide/nav/header.jsp" %>--%>
    <input type="hidden" name="nav_cap" id="nav_cap" value="Submission"/>

    <div id="pagetitle"
         style="clear:both; border:1px solid #F60; color:#F60; margin:50px 10px auto 10px;">
        <h1 style="padding-left: 15px; padding-right: 15px;">Perl example for scripting the Neutopeptide Database
            RESTful
            web services</h1>
    </div>
    <div style="margin-top: 10px; padding-left: 15px; padding-right: 15px;">
        This search finds all neuropeptedes that have been resolved for a
        particular sequence. For more information on the RESTful web services
        see <a href="web_service.jsp">here</a>.
        <hr class="nav_hr"/>
    </div>


    <div id="content"
         style="line-height:35px; margin:35px 10px 15px 10px;">
		<pre>

import urllib2


url = '/CXFService/infos/sequence/'

queryText = """

&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;NeuropeptideQuery&gt;

&lt;queryType&gt;org.pdb.neuropeptide.simple.SequenceQuery&lt;/queryType&gt;

&lt;description&gt;Sequence Search : Sequence=<font color="#2040a0">$sequence</font>&lt;/description&gt;

&lt;sequence&gt;<font color="#2040a0">$sequence</font>&lt;/sequence&gt;

&lt;/NeuropeptideQuery&gt;

"""


print "query:\n", queryText

print "querying neuropeptide...\n"

req = urllib2.Request(url, data=queryText)

f = urllib2.urlopen(req)

result = f.read()


if result:

    print "Found number of neuropeptide entries:", result.count('\n')

else:

    print "Failed to retrieve results"
</pre>

    </div>
    <!-- close div#content -->

</div>
<!-- close div#container -->

<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
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

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

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

<font color="0000ff"><strong>import java.io.BufferedReader;</strong></font>
<font color="0000ff"><strong>import java.io.IOException;</strong></font>

<font color="0000ff"><strong>import java.io.InputStream;</strong></font>
<font color="0000ff"><strong>import java.io.InputStreamReader;</strong></font>
<font color="0000ff"><strong>import java.io.OutputStream;</strong></font>
<font color="0000ff"><strong>import java.io.OutputStreamWriter;</strong></font>
<font color="0000ff"><strong>import java.net.URL;</strong></font>
<font color="0000ff"><strong>import java.net.URLConnection;</strong></font>
<font color="0000ff"><strong>import java.net.URLEncoder;</strong></font>
<font color="0000ff"><strong>import java.util.ArrayList;</strong></font>
<font color="0000ff"><strong>import java.util.List;</strong></font>


<strong>public</strong> <strong>class</strong> <font color="#2040a0">PostXMLQuery</font>
<font color="4444FF"><strong>{</strong></font>
   <strong>public</strong> <strong>static</strong> <strong>final</strong> <font color="#2040a0">String</font> <font
                color="#2040a0">SERVICELOCATION</font><font color="4444FF">=</font><font color="#008000">&quot;/CXFService/infos/sequence/&quot;</font><font
                color="4444FF">;</font>
   <strong>public</strong> <strong>static</strong> <strong>void</strong> <font color="#2040a0">main</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">String</font><font color="4444FF"><strong>[</strong></font><font
                color="4444FF"><strong>]</strong></font> <font color="#2040a0">args</font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF"><strong>{</strong></font>
      <font color="#2040a0">String</font> <font color="#2040a0">xml</font> <font color="4444FF">=</font>
         <font color="#008000">&quot;  &lt;NeuropeptideQuery&gt;&quot;</font><font color="4444FF">+</font>
         <font color="#008000">&quot;    &lt;queryType&gt;org.pdb.neuropeptide.simple.SequenceQuery&lt;/queryType&gt;&quot;</font><font
                color="4444FF">+</font>
         <font color="#008000">&quot;    &lt;description&gt;&lt;![CDATA[Sequence Search : Sequence=<font
                 color="#2040a0">$sequence</font>]]&gt;&lt;/description&gt;&quot;</font><font color="4444FF">+</font>
         <font color="#008000">&quot;    &lt;sequence&gt;&lt;![CDATA[SVPHFSDEDKDPE]]&gt;&lt;/sequence&gt;&quot;</font><font
                color="4444FF">+</font>
         <font color="#008000">&quot;  &lt;/NeuropeptideQuery&gt;&quot;</font><font color="4444FF">;</font>
         <font color="#2040a0">PostXMLQuery</font> <font color="#2040a0">t</font> <font color="4444FF">=</font> <strong>new</strong> <font
                color="#2040a0">PostXMLQuery</font><font color="4444FF"><strong>(</strong></font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
         <strong>try</strong> <font color="4444FF"><strong>{</strong></font>
            <font color="#2040a0">List</font><font color="4444FF">&lt;</font><font color="#2040a0">String</font><font
                color="4444FF">&gt;</font> <font color="#2040a0">Ids</font> <font color="4444FF">=</font> <font
                color="#2040a0">t</font>.<font color="#2040a0">postQuery</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">xml</font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
            <strong>for</strong> <font color="4444FF"><strong>(</strong></font><font color="#2040a0">String</font> <font
                color="#2040a0">string</font> <font color="4444FF">:</font> <font color="#2040a0">neuropeptideIds</font><font
                color="4444FF"><strong>)</strong></font>
            <font color="4444FF"><strong>{</strong></font>
               <font color="#2040a0">System</font>.<font color="#2040a0">out</font>.<font color="#2040a0">println</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">string</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
            <font color="4444FF"><strong>}</strong></font>
         <font color="4444FF"><strong>}</strong></font> <strong>catch</strong> <font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">Exception</font> <font
                color="#2040a0">e</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF"><strong>{</strong></font>
            <font color="#2040a0">e</font>.<font color="#2040a0">printStackTrace</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
         <font color="4444FF"><strong>}</strong></font>
   <font color="4444FF"><strong>}</strong></font>
   <font color="#444444"><i>/** post am XML query (Neuropeptide XML query format)  to the RESTful RCSB web service
    *
    * @param xml
    * @return a list of Neuropeptide ids.
    */</i></font>
   <strong>public</strong> <font color="#2040a0">List</font><font color="4444FF">&lt;</font><font
                color="#2040a0">String</font><font color="4444FF">&gt;</font> <font
                color="#2040a0">postQuery</font><font color="4444FF"><strong>(</strong></font><font color="#2040a0">String</font> <font
                color="#2040a0">xml</font><font color="4444FF"><strong>)</strong></font>
      <strong>throws</strong> <font color="#2040a0">IOException</font><font color="4444FF"><strong>{</strong></font>
      <font color="#2040a0">URL</font> <font color="#2040a0">u</font> <font color="4444FF">=</font> <strong>new</strong> <font
                color="#2040a0">URL</font><font color="4444FF"><strong><font
                color="4444FF"><strong>(</strong></font></strong></font><font
                color="#2040a0">SERVICELOCATION</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#2040a0">String</font> <font color="#2040a0">encodedXML</font> <font color="4444FF">=</font> <font
                color="#2040a0">URLEncoder</font>.<font color="#2040a0">encode</font><font color="4444FF"><strong><font
                color="4444FF"><strong>(</strong></font></strong></font><font color="#2040a0">xml</font>,<font
                color="#008000">&quot;UTF-8&quot;</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#2040a0">InputStream</font> <font color="#2040a0">in</font> <font color="4444FF">=</font>  <font
                color="#2040a0">doPOST</font><font color="4444FF"><strong>(</strong></font><font
                color="#2040a0">u</font>,<font color="#2040a0">encodedXML</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#2040a0">List</font><font color="4444FF">&lt;</font><font color="#2040a0">String</font><font
                color="4444FF">&gt;</font> <font color="#2040a0">neuropeptideIds</font> <font
                color="4444FF">=</font> <strong>new</strong> <font color="#2040a0">ArrayList</font><font color="4444FF">&lt;</font><font
                color="#2040a0">String</font><font color="4444FF">&gt;</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#2040a0">BufferedReader</font> <font color="#2040a0">rd</font> <font color="4444FF">=</font> <strong>new</strong> <font
                color="#2040a0">BufferedReader</font><font color="4444FF"><strong>(</strong></font><strong>new</strong> <font
                color="#2040a0">InputStreamReader</font><font color="4444FF"><strong>(</strong></font><font
                color="#2040a0">in</font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
      <font color="#2040a0">String</font> <font color="#2040a0">line</font><font color="4444FF">;</font>
      <strong>while</strong> <font color="4444FF"><strong>(</strong></font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">line</font> <font color="4444FF">=</font> <font
                color="#2040a0">rd</font>.<font color="#2040a0">readLine</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF"><strong>)</strong></font> <font color="4444FF">!</font><font
                color="4444FF">=</font> <strong>null</strong><font color="4444FF"><strong>)</strong></font> <font
                color="4444FF"><strong>{</strong></font>
        <font color="#2040a0">neuropeptideIds</font>.<font color="#2040a0">add</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">line</font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
      <font color="4444FF"><strong>}</strong></font>
      <font color="#2040a0">rd</font>.<font color="#2040a0">close</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <strong>return</strong> <font color="#2040a0">neuropeptideIds</font><font color="4444FF">;</font>
   <font color="4444FF"><strong>}</strong></font>
   <font color="#444444"><i>/** do a POST to a URL and return the response stream for further processing elsewhere.
    *
    *
    * @param url
    * @return
    * @throws IOException
    */</i></font>
   <strong>public</strong> <strong>static</strong> <font color="#2040a0">InputStream</font> <font
                color="#2040a0">doPOST</font><font color="4444FF"><strong>(</strong></font><font
                color="#2040a0">URL</font> <font color="#2040a0">url</font>, <font color="#2040a0">String</font> <font
                color="#2040a0">data</font><font color="4444FF"><strong>)</strong></font>
   <strong>throws</strong> <font color="#2040a0">IOException</font>
   <font color="4444FF"><strong>{</strong></font>
   <font color="#444444">// Send data</font>
      <font color="#2040a0">URLConnection</font> <font color="#2040a0">conn</font> <font color="4444FF">=</font> <font
                color="#2040a0">url</font>.<font color="#2040a0">openConnection</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#2040a0">conn</font>.<font color="#2040a0">setDoOutput</font><font color="4444FF"><strong>(</strong></font><strong>true</strong><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
      <font color="#2040a0">OutputStreamWriter</font> <font color="#2040a0">wr</font> <font
                color="4444FF">=</font> <strong>new</strong> <font color="#2040a0">OutputStreamWriter</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">conn</font>.<font color="#2040a0">getOutputStream</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
      <font color="#2040a0">wr</font>.<font color="#2040a0">write</font><font
                color="4444FF"><strong>(</strong></font><font color="#2040a0">data</font><font
                color="4444FF"><strong>)</strong></font><font color="4444FF">;</font>
      <font color="#2040a0">wr</font>.<font color="#2040a0">flush</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
      <font color="#444444">// Get the response</font>
      <strong>return</strong> <font color="#2040a0">conn</font>.<font color="#2040a0">getInputStream</font><font
                color="4444FF"><strong>(</strong></font><font color="4444FF"><strong>)</strong></font><font
                color="4444FF">;</font>
   <font color="4444FF"><strong>}</strong></font>
<font color="4444FF"><strong>}</strong></font>
</pre>
    </div>
    <!-- close div#content -->

    <%-- <%@ include file="/neuropeptide/nav/footer.jsp"%> --%>

</div>
<!-- close div#container -->
<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>
</html>
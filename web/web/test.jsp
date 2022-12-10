<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'test.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

    <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>
    <script type='text/javascript' src='dwr/interface/NeuropeptideDWR.js'></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>

    <style>
        .a1 {
            background: blue;
            display: block;
            color: #fff
        }

        .a2 {
            background: blue;
            color: #fff
        }
    </style>

    <script type="text/javascript">
        function basicSearch() {
            $.ajax({
                url: "search_basic"
            });
        }

        var mycall = function callBack(data) {
            dwr.util.setValue("demo1", data);
        };

        function showMyName() {
            NeuropeptideDWR.getMyName(mycall);
        }

        function clearName() {
            demo1.value = "";
        }
    </script>
</head>

<body>
This is my JSP page.
<br>
<a href="<%=basePath%>jmol"></a>

<a class="a1" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a1" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a1" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a1" href="http://www.gift12345.com/">http://www.gift12345.com</a>

<br>

<a class="a2" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a2" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a2" href="http://www.gift12345.com/">http://www.gift12345.com</a>
<a class="a2" href="http://www.gift12345.com/">http://www.gift12345.com</a>


<div>
    <h1>Ajax Test Page</h1>
    <input type="button" value="显示姓名" onclick="javascript:showMyName()">
    <input type="button" value="清空" onclick="javascript:clearName()"><br>
    <button type="submit" onclick="basicSearch()">搜索</button>
    <input type="text" id="demo1"><br>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div id="wrapper">
    <div id="pagetitle" style="clear: both; font-size: 18px; color: #F60;">
        Submission
        <div id="topnav" class="topnav" style="margin-right: 10px;">
            Admin Approval Entrance <a href="login" class="signin"><span>login</span>
            </a>
        </div>
        <fieldset id="signin_menu">
            <form method="post" id="signin" action="login">
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

        <!-- <div style="float:right; margin-right:10px;"><a class="entrance_a"
onclick="">Admin Approval Entrance</a></div> -->


        <hr class="nav_hr" />
    </div>
    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>
</body>

</html>
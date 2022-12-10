/**
 * 创建ajax对象
 */
function getajaxHttp() {
    var xmlHttp;

    try {
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        try {
            xmlHttp = new ActiveObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                xmlHttp = new ActiveObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("您的浏览器不支持AJAX！");
                return false;
            }
        }
    }

    return xmlHttp;
}

/**
 * 发送ajax请求 url——url methodtype(post/get) con(true(异步)|false(同步)) parameter(参数)
 * functionName(回调方法名，不需要引号，这里只有成功的时候才调用。 注意：这个方法有二个参数，一个就是xmlHttp，一个就是要处理的对象)
 * obj需要到回调方法中处理的对象
 */
function ajaxrequest(url, methodtype, con, parameter, functionName, obj) {
    var xmlhttp = getajaxHttp();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200) {
                // HTTP响应已经完全接收才调用
                functionName(xmlhttp, obj);
            }
        }
    };
    xmlhttp.open(methodtype, url, con);
    xmlhttp.setRequestHeader("Content-Type",
        "application/x-www-form-urlencoded");
    xmlhttp.send(parameter);
}
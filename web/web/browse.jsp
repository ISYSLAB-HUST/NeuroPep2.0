<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Browse</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

    <link rel="stylesheet" href="neuropeptide/css/up_btn.css" />
    <script src="neuropeptide/js/up_btn.js"></script>

    <style type="text/css">
        #list ol li {
            height: 40px;
        }

        #list ol li a {
            height: 40px;
            line-height: 40px;
            text-decoration: none;
            color: #06F;
        }

        #list ol li a:hover {
            text-decoration: none;
            color: #F60;
        }
        .btn{
            width: 69px !important;
        }

        ul,ol {
            list-style: none;
        }
        .list-container {
            padding-left: 40px;
            line-height: 40px;
        }

        .list-title {
            font-size: 16px;
            color: #aaa;
            height: 40px;
            margin: 16px 0 8px;
            transition: .15s ease-out;
            border-bottom: 1px solid #f0f0f0;
        }

        .list-item a {
            height: 40px;
            color: #444;
            font-size: 14px;
            white-space: nowrap;
            text-overflow: ellipsis;
            font-weight: 400;
            text-decoration: none;
            transition: .15s ease-out;
        }

        .list-item a:hover {
            color: #409eff;
        }
        #phyla {min-height:40px ;}
        #phyla > li > a{
            padding: 3px 10px;
            color: #0f0f0f;
            border-radius: 15px;
        }
        #phyla > li > a:hover{
            background-color: #98d4ff;
        }
        #phyla > li{
            border-radius: 15px;
        }
        .menu {
            background: #ffffff;
            font-size: 16px;

            text-align: left;
            /*height: 720px;*/
            width: auto;
            height: 40px;
            padding: 5px;
            /*margin: auto;*/
            /*margin-left: 25px;*/
            z-index: 999;
            /*border: 1px solid #999;*/
            /*box-shadow: 0 0 4px #999;*/
            top: 10%;
            left: 20%;
            /*padding-left: 12px;*/
            border-bottom: 1px solid #f0f0f0;
            border-top: 1px solid #f0f0f0;
        }
        .menu span {
            padding: 6px 18.5px 5px 18.5px;
            border-bottom: 4px solid #FFBF00;
            border-radius: 5px 5px 0 0;
            cursor: pointer;
        }
        .activeMenu  {
            color: white;
            background: #FFBF00;
        }
        .defaultMenu {
            color: #0e5a88;

        }
        .menuContent{
            position: relative;
        }


    </style>

    <style lang="scss">
        .el-tabs__nav-scroll{
            background-color: #fff;
            border-bottom: 7px solid #005b8f;

        }
        .el-tabs__nav.is-top{

        }
        .el-tabs__item.is-active{
            color: white;
            background-color: #005b8f;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .el-tabs__active-bar {
            background-color:#005b8f;
        }
        .box .el-tabs__active-bar.is-top{

        }
        #tab-Annelida{
            padding-left: 20px;
        }
        #tab-Other{
            padding-right: 20px;
        }
    </style>


    <style>

    </style>
</head>

<body id="Home">

<div id="wrapper">
<%@ include file="/neuropeptide/nav/newheader.jsp" %>
<div id="container">

    <input type="hidden" name="nav_cap" id="nav_cap" value="Home"/>

    <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
        <li>Browse</li>
        <li><c:out value="${proType}"></c:out></li>
        <li>by <c:out value="${param.type}"></c:out></li>
    </ol>

    <div v-if="type==2" id="tabs">
    <el-tabs v-model="activeName"  @tab-click="handleClick" v-if="proType == 'Receptor'">
        <el-tab-pane label="Annelida" name="Annelida"></el-tab-pane>
        <el-tab-pane label="Arthropoda" name="Arthropoda"></el-tab-pane>
        <el-tab-pane label="Chordata" name="Chordata"></el-tab-pane>
        <el-tab-pane label="Mollusca" name="Mollusca"></el-tab-pane>
        <el-tab-pane label="Nematoda" name="Nematoda"></el-tab-pane>
    </el-tabs>
        <el-tabs v-model="activeName"  @tab-click="handleClick" v-else>
            <el-tab-pane label="Annelida" name="Annelida"></el-tab-pane>
            <el-tab-pane label="Arthropoda" name="Arthropoda"></el-tab-pane>
            <el-tab-pane label="Chordata" name="Chordata"></el-tab-pane>
            <el-tab-pane label="Cnidaria" name="Cnidaria"></el-tab-pane>
            <el-tab-pane label="Echinodermata" name="Echinodermata"></el-tab-pane>
            <el-tab-pane label="Hemichordata" name="Hemichordata"></el-tab-pane>
            <el-tab-pane label="Mollusca" name="Mollusca"></el-tab-pane>
            <el-tab-pane label="Nematoda" name="Nematoda"></el-tab-pane>
            <el-tab-pane label="Other" name="Other"></el-tab-pane>
        </el-tabs>
    </div>




    <div id="app">


        <div  class="list-container" id="listCon">


<%--            <ul v-if="type==2"  id="phyla" class="nav nav-pills">--%>
<%--                &lt;%&ndash;<li role="presentation"><a href="phylaData.action?phylaType=Annelida">Annelida</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Arthropoda">Arthropoda</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Chordata">Chordata</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Cnidaria">Cnidaria</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Echinodermata">Echinodermata</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Hemichordata">Hemichordata</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Mollusca">Mollusca</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Nematoda">Nematoda</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=Platyhelminthes">Platyhelminthes</a></li>--%>
<%--                <li role="presentation"><a href="phylaData.action?phylaType=NA">NA</a></li>&ndash;%&gt;--%>
<%--                    <c:forEach items="${requestScope.pList}" var="keyword">--%>

<%--                        <c:url var="purl" value="./browse${pType}">--%>
<%--                            <c:param name="type" value="organism"></c:param>--%>
<%--                            <c:param name="phyla" value="${keyword}"></c:param>--%>
<%--                        </c:url>--%>

<%--                        <li role="presentation" id="${keyword}">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${keyword=='Other'}"><a href="browse?type=organism&phyla=NA">Other</a></c:when>--%>
<%--                                <c:otherwise><a href="${purl}">${keyword}</a></c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>


<%--            </ul>--%>
            <div class="menu">
                <div class="menuContent">

                    <span v-for="(value,key,index) in obj" @click="changColor(index)" :class="[index===numbers ? activeMenu : defaultMenu ]">{{key}}</span>

                </div>
            </div>
<%--            <div style="height: 50px"><a href="#" class="bck">back to top</a></div>--%>
            <div v-for="(value,key,index) in obj">
              <div :id="index" class="list-title">{{key}}</div>
              <div>
                <ul v-if="type==1" class="list-item" >
                    <li v-for="item in value">
                        <%--${value.accessNum}--%>
                        <a :href="'browse'+'${pType}'+'_family?&name='+item">{{item}}</a>
                    </li>
                </ul>
                <ul v-if="type==2" class="list-item" >
                    <li v-for="item in value">
                        <a :href="'browse'+'${pType}'+'_organism?&name='+item">{{item}}</a>
                    </li>
                </ul>
                <ul v-if="type==3" class="list-item" >
                    <li v-for="item in value">
                        <a :href="'browse'+'${pType}'+'_modification?&name='+item">{{item}}</a>
                    </li>
                </ul>
              </div>

            </div>



        </div>



    </div>






</div>
<%@ include file="/neuropeptide/nav/newfooter.jsp" %>
</div>

<script type="text/javascript">


    $(document).ready(function () {
        up({
            // bottom position
            bottom: '20px',
            // right position
            right: '12vw',
            // width
            width: '60px',
            // height
            height: '60px',
            // background color
            // bg: 'green',
            // custom icon
            // src: ' neuropeptide/img/R-C.png',
            // distance from the top to show the back to top button
            whenShow: 400,
            // circular button?
            // circle: true

        });


        var query = window.location.search.substring(1);
        console.log(query)
        var taskId = query.split("&");

        taskId=taskId[1];

        taskId=taskId.split("=")
        taskId=taskId[1];
        if (taskId == 'NA') {
            taskId = 'Other'
        }
        console.log(taskId);


        console.log(document.getElementById(taskId));
        document.getElementById(taskId).style.borderRadius="15px";
        document.getElementById(taskId).style.background="#98d4ff"

    });
    var app = new Vue({
        el: '#container',
        data() {
            return {
            load:1,
            data:[],
            currentData:[],
            type:1,
            obj:{},
            //abcd
            numbers: 0,
            activeMenu: 'activeMenu',
            defaultMenu: 'defaultMenu',
            activeName: 'Annelida',
             proType: '',
             activeNameR: 'Annelida',


        }

        },
        methods:{
            clickbtn:function(e){
                var data = this.data
                console.log(e.target.innerHTML)
                let letter = e.target.innerHTML.toLowerCase()

                if(letter === "other"){
                    console.log("click other")
                    let other = []
                    var pattern = /[^a-z]/i
                    for(let i=0;i<data.length;i++){
                        if(pattern.test(data[i][0])){
                            other.push(data[i])
                        }
                    }
                    console.log("other", other)
                    this.currentData = other
                } else if(letter === "all"){
                    console.log("click All")
                    this.currentData = data
                } else{
                    let currentData = []
                    for(let i=0;i<data.length;i++){
                        if(data[i].toLowerCase().charAt(0)==letter){
                            currentData.push(data[i])
                        }
                    }
                    this.currentData = currentData
                }
            },
            changColor(val) {
                this.numbers = val
                document.getElementById(val).scrollIntoView({
                    behavior: 'smooth' // 平滑滚动
                });
            },onScroll(){
                const scrollTop = document.documentElement.scrollTop+90;

                let scrollItems = document.querySelectorAll(".scroll-item");

                for (let i = scrollItems.length - 1; i >= 0; i--) {
                    //console.log(scrollItems[i].offsetTop);
                    // 判断滚动条滚动距离是否大于当前滚动项可滚动距离
                    let judge = scrollTop >= scrollItems[i].offsetTop - scrollItems[0].offsetTop;
                    if (judge) {
                        this.numbers = i-1;
                        break;
                    }
                }

            },
            handleClick(tab, event) {
                console.log(tab, event);
                console.log(tab.name);
                const tabstype = this.proType;
                if(tabstype=='Neuropeptide'){
                    window.location.href = './browse?type=organism&phyla='+this.activeName;
                }else if(tabstype=='Receptor'){
                    window.location.href = './browseReceptor?type=organism&phyla='+this.activeName;
                }

            }
        },
        mounted(){
            console.log("mounted")
            let data1 = '<%=request.getAttribute("family")%>'
            let data2 = '<%=request.getAttribute("organism")%>'
            let data3 = '<%=request.getAttribute("modification")%>'
            let data4 = '<%=request.getAttribute("phyla")%>'
            console.log('testdata1-----------'+data1)
            console.log('test------------'+data4);
            if(!data4){
                data4 = 'Annelida'
            }
            this.activeName = data4;


            if(data1=='null'){
                if(data2=='null'){
                    data = data3
                    this.type = 3
                }else{
                    data = data2
                    this.type = 2
                }
            }else{
                data = data1
                this.type = 1
            }
            data = data.substring(1,data.length-1)
            data = data.split(", ")
            console.log(data)
            if(this.type === 3){
                data = data.map(function(item){
                    return item.split("=")[0]
                })
                console.log('type === 3')
                console.log(data)
            }
            this.data = data
            this.currentData = this.data

            // var query = window.location.search.substring(1);
            // console.log(query)
            // var taskId = query.split("&");
            // taskId=taskId[1];
            // taskId=taskId.split("=")
            // taskId=taskId[1];
            // if (taskId == 'NA') {
            //     taskId = 'Other'
            // }
            // console.log(taskId);
            //
            //
            // this.activeName = taskId;
            //
            // console.log('cinaiocnindinteste----!!!1111'+this.activeName);

            // 手风琴
            var obj = {}
            for (var i = 0; i < data.length; i++) {
            var c = data[i].toUpperCase().charAt(0);
                if (c >= 'A' && c <= 'Z') {
                    if (!obj.hasOwnProperty(c)) {
                    obj[c] = [data[i]]
                    } else {
                    obj[c].push(data[i])
                    }
                }
            }

            for (var i = 0; i < data.length; i++) {
                var c = data[i].toUpperCase().charAt(0);
                if (c < 'A' || c > 'Z') {
                    if (!obj.hasOwnProperty('Other')) {
                    obj['Other'] = [data[i]]
                    } else {
                    obj['Other'].push(data[i])
                    }
                }
            }

            this.obj = obj

            this.proType = String("${request.proType}");
            console.log("----------test-----"+this.proType);

        }


    })



</script>

</body>
</html>
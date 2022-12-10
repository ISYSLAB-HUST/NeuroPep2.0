<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>NeuroPred-PLM</title>
    <meta name="keywords"
          content="peptides, neuropeptide, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <script type="text/javascript" src="jmol/Jmol.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery-1.10.2.js"></script>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <script src="https://cdn.bootcss.com/echarts/3.7.2/echarts.min.js"></script>





    <style type="text/css">
        .neuropeptide td {
            padding-left: 10px;
            color: #666;
            border: 1px solid #ccc;
            line-height: 30px;
            word-wrap: break-word;
            word-break: break-all;
        }
        .question {
            position: relative;
            top: 3px;
            background: url("neuropeptide/img/question.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
            display: inline-block;
            height: 15px;
            margin-left: 4px;
            width: 15px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/js/jquery.form.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>
    <%--<script src="https://cdn.jsdelivr.net/npm/vue"></script>--%>
    <script type="text/javascript" src="neuropeptide/js/vue.js"></script>


</head>

<body >

<div id="wrapper">

    <%@ include file="/neuropeptide/nav/newheader.jsp" %>
    <div id="container">

        <ol class="breadcrumb" style="border-bottom: 2px solid #0C5987; color: #0C5987; background-color: rgba(0, 0, 0, 0)">
            <li>Tools</li>
            <li>NeuroPred-PLM</li>
        </ol>

        <div  id="app"  style="line-height: 35px; margin: 35px 10px 15px 10px;">
            <%--            <div   id="taskForm" method="post"   >--%>
            <%--                <div class="form-group">--%>
            <%--                    <label for="sequence">Sequence</label>--%>
            <%--                    <input v-model="sequence"  class="form-control" id="sequence">--%>
            <%--                    <small id="sequenceHelp" style="color: #3e8f3e" class="form-text text-muted">Please input the sequence you wish to analyze.</small>--%>
            <%--                </div>--%>
            <%--                <div  class="form-group">--%>
            <%--                    <label for="email">Email address</label>--%>
            <%--                    <input v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp">--%>
            <%--                    <small id="emailHelp" style="color: #3e8f3e" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
            <%--                </div>--%>


            <%--                <button @click="click" id="button" type="submit" class="btn btn-primary">Submit</button>--%>
            <%--            </div>--%>

            <div id="taskForm"  style="width:90%;margin-left:5%" >
                <div>
                    <span  style="color: black" class="form-text text-muted">
                        NeuroPred-PLM employs a combination of pre-trained language model and attention mechanism to predict neuropeptides.
                    </span>

                    <a title="help of the blast tool" href="help.jsp#neuroPredESM" target="_blank" class="question"></a>
                </div>
                <div>
<%--                    <ul class="nav nav-tabs">--%>
<%--                        <li class="active">--%>
<%--                            <a id="seq-tab" href="#seq" data-toggle="tab">Sequence</a>--%>
<%--                        </li>--%>
<%--                        <!--<li>--%>
<%--                            <a id="file-tab" href="#file" data-toggle="tab">File</a>--%>
<%--                        </li>-->--%>
<%--                    </ul>--%>
                </div>
                <div class="tab-content">
                    <div id="seq" class="tab-pane fade active in" aria-labelledby="seq-tab">
                         <label style="font-size: 18px;font-family: inherit;display: block;">
                             Enter sequence below in FASTA
                             format ('&gt;' is mandatory,<a style="color: #06F;" @click="setExample()">click for an example</a>)
<%--                            <input type="button" @click="setExample" value="Example" class="btn btn-primary btn-sm" id="example" >--%>
                        </label>
                        <textarea class="form-control" id="sequence" v-model="sequence" rows="8"></textarea>
                        <small id="sequenceHelp" style="color: black" class="form-text text-muted">Please input the sequence you wish to analyze.</small>

                        <p class="text-danger hidden" id="seqdanger1">* Please input a sequence!</p>
                        <p class="text-danger hidden" id="seqdanger2">* Characters other than letters are not allowed!</p>
                    </div>
                    <!--<div id="file" class="tab-pane fade" aria-labelledby="file-tab">
                        <h4>The file uploaded should contains only protein sequence in FASTA format.</h4>
                        <input type="file" name="seqfile" id="inputFile">
                        <p class="text-danger hidden" id="filedanger1">* Please upload a sequence file!</p>
                    </div>-->
                </div>
                <div  class="form-group">
                    <label for="email">Email address</label>
                    <input v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp">
                </div>
                <div>
                    <button  class="btn btn-default btn-primary" id="submit" @click="click" >Submit</button>
                    <button type="reset" @click="reset" class="btn btn-default btn-primary" >Reset</button>
                </div>
                <div id="submitPromptInformation" style="display: none">
                    <div>
                        <p  style="color: black" class="form-text text-muted">
                            If the analysis results come out, we will notify you by email. Please wait patiently.<br/>
                            Sequence analysis takes 2 seconds to 3 minutes and

                            you can click here to view the analysis results.
                        </p>
                    </div>
                    <div>
                        <button  class="btn btn-default btn-primary"  @click="viewResult" >View result</button>
                        <button v-if="showCollect"  class="btn btn-default btn-primary"  @click="collect" >Add to bookmark</button>

                    </div>
                </div>
                <div v-show = "showResult" style="margin-top: 30px"  class="panel panel-info">
                    <div class="panel-heading">
                        Neuropeptide Prediction Diagram
                    </div>
                    <div id="sequenceDiv" class="panel-body">
                        <table v-for="(item,index) in nameArray" style="table-layput:fixed;word-wrap:break-wrod;word-break:break-all;" class="neuropeptide table table-striped"  align="center" border="border: 1px solid #666"
                               cellpadding="0" cellspacing="0" style="vertical-align: middle;">
                            <tr >
                                <td width ="15%">Name</td>
                                <td>{{nameArray[index]}}</td>
                            </tr>
                            <tr >
                                <td width="15%">Sequence</td>
                                <td>{{attentionArray[index].sequence}}</td>
                            </tr>
                            <tr>
                                <td width="15%">Attention map</td>
                                <td>
                                    <div style="width: 100%;height: 500px" :id="'attention'+index">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td  width="15%">Type</td>
                                <td>
                                    <span v-if="attentionArray[index].prob>=0.5">neuropeptide</span>
                                    <span v-else>non-neuropeptide </span>
                                </td>

                            </tr>

                        </table>
                    </div>
                </div>

            </div>



            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div  class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">loading...</h4>
                        </div>
                        <div class="modal-body">
                            <p >The sequence is being analyzed,please wait patiently.</p>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>

                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->

            </div>


        </div>
    </div>


    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</div>


<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            sequence:"",
            email:"",
            //url:"http://bioinfo.isyslab.info/DeepNeuropePred/status-api/32787363-7343-477c-9357-3ba87011e293",
            url:"",
            showResult:false,
            data: {

            },
            resultSequence:'',
            originSequence:'',
            nameArray:[],
            attentionArray:[],
            showCollect:false,
            predict:[],
            taskId: '',
            prob: 0,
        },
        methods:{
            click(){

                console.log(this.sequence)
                let sequence=$("#sequence").val();
                let email=$("#email").val();
                if(sequence == ""||email==""){
                    alert("Please check your sequence and email！");
                    return ;
                }
                let test =/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(email)
                if(!test){
                    alert("Incorrect email format");
                    return ;
                }

                let _this=this;

                $.ajax({
                    type : 'post',
                    url : 'http://119.96.190.130/DeepNeuropePred/submit-neuropred-plm',
                    dataType : 'json',
                    contentType:'application/json;charset=UTF-8',  //设置后
                    headers: {

                        "Access-Control-Allow-Origin": "*",
                        'Content-Type': 'application/json'

                    },
                    data : JSON.stringify({
                        "sequence":this.sequence,
                        "email":this.email
                    }),
                    //data: $('#taskForm').serialize(),
                    success : function(data) {
                        console.log(data)
                        _this.url="http://119.96.190.130/DeepNeuropePred/esm-status-api/"+data.taskId
                        _this.taskId=data.taskId;
                        alert("Submit successfully!");
                        var url_p = window.location.origin+window.location.pathname+'?taskId='+data.taskId;
                        _this.showCollect=true;

                        // window.location.href = url_p //不可行，参数会循环重复
                        // 方法1：向当前url添加参数，没有历史记录
                        // window.history.replaceState({
                        // 	path: url_p
                        // }, '', url_p);
                        // 方法2
                        window.history.pushState(null,null,url_p)

                        $("#submitPromptInformation").css({"display": "block"})



                    },
                    error : function(){


                    }
                })
            },
            reset(){
                this.sequence="";
                this.email="";
                this.showResult=false;
                this.url="";
                this.predict=[];


            },
            setExample(){
                this.sequence=">A0A088MIT0\nDADSSVEKQVALLKALYGHGQISHKRHKTDSFVGLM"
            },

            collect() {
                var url = window.location;
                var title = document.title;
                var ua = navigator.userAgent.toLowerCase();
                if (ua.indexOf("360se") > -1) {
                    alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
                }
                else if (ua.indexOf("msie 8") > -1) {
                    window.external.AddToFavoritesBar(url, title); //IE8
                }
                else if (document.all) {
                    try{
                        window.external.addFavorite(url, title);
                    }catch(e){
                        alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
                    }
                }
                else if (window.sidebar) {
                    window.sidebar.addPanel(title, url, "");
                }
                else {
                    alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
                }
            },
            viewResult(){

                if(this.url==""){
                    alert("You haven't entered the correct sequence or email")
                    return
                }
                console.log(this.url)

                let _this=this;
                $.ajax({
                    type : 'get',
                    url : this.url,
                    //timeout:180000,
                    dataType : 'json',
                    contentType:'application/json;charset=UTF-8',  //设置后
                    headers: {
                        "Access-Control-Allow-Origin": "*",

                    },

                    success : function(data) {
                        //console.log(data)

                        if(data.code==200){

                            let res=data.data;
                            _this.showResult = true
                            _this.nameArray = Object.keys(res)
                            _this.attentionArray = Object.values(res)
                            let domArray=[];
                            _this.$nextTick(() => {
                                for(let i=0; i<_this.nameArray.length;i++){
                                    domArray.push(document.getElementById('attention'+i))
                                    let data = []
                                    for(let j = 0 ;j < _this.attentionArray[i].att.length;j++){
                                      for (let z = 0; z <_this.attentionArray[i].att[j].length; z++) {
                                        let temp1=[]
                                        temp1.push(j)
                                        temp1.push(z)
                                        temp1.push(_this.attentionArray[i].att[j][z].toFixed(3))
                                        data.push(temp1)
                                      }
                                    }
                                    let dataList = data.map(function (item) {
                                        return [item[1], item[0], item[2] || '-'];}
                                    );
                                    console.log(dataList)
                                    let name = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
                                    //name.push()
                                    //画图
                                    option = {
                                        tooltip: {
                                            position: 'top'
                                        },
                                        grid: {
                                            height: '50%',
                                            top: '10%'
                                        },
                                        xAxis: {

                                            type: 'category',
                                            data: _this.attentionArray[i].sequence,
                                            splitArea: {
                                                show: true
                                            }
                                        },
                                        yAxis: {
                                            interval: 1,
                                            type: 'category',
                                            data: name,
                                            splitArea: {
                                                show: true
                                            }
                                        },
                                        visualMap: {
                                            min: 0,
                                            max: 1,
                                            calculable: true,
                                            orient: 'horizontal',
                                            left: 'center',
                                            bottom: '15%'
                                        },
                                        series: [
                                            {
                                                name: 'Punch Card',
                                                type: 'heatmap',
                                                data: dataList,
                                                label: {
                                                    show: true,
                                                    fontSize: 8
                                                },
                                                emphasis: {
                                                    itemStyle: {
                                                        shadowBlur: 10,
                                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                    }
                                                }
                                            }
                                        ]
                                    };

                                    console.log(domArray[i]);
                                    console.log(document.getElementById('attention0'))
                                    let myChart = echarts.init(domArray[i]);
                                    option && myChart.setOption(option)

                                }

                            });


                            console.log(_this.nameArray)
                            console.log(_this.attentionArray)


                        }
                        else if(data.code==-1){
                            alert("The sequence you entered is not in the correct format")
                        }
                        else{
                            $('#myModal').modal()
                            this.showResult=false;
                        }






                    },
                    error : function(){

                    }
                })
            }




        },
        mounted(){
            var query = window.location.search.substring(1);

            var taskId = query.split("=");
            taskId=taskId[1];
            if(taskId!=null){
                console.log(taskId);
                this.url="http://119.96.190.130/DeepNeuropePred/status-api/"+taskId;
                this.viewResult();
            }



        }

    })
</script>
</body>

</html>


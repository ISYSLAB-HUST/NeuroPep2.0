<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DeepNeuropePred</title>
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
            <li>DeepNeuropePred</li>
        </ol>
        <div  id="app"  style="line-height: 35px; margin: 35px 10px 15px 10px;">



            <div id="taskForm"  style="width:90%;margin-left:5%" >
                <div>
                    <div>
                        <p  style="color: black" class="form-text text-muted">
                            DeepNeuropePred employs a combination of pre-trained language model and Convolutional Neural Networks for feature extraction, thereby predicting the neuropeptide cleavage sites from precursors.
                            <a title="help of the blast tool" href="help.jsp#deepNeuropePred" target="_blank" class="question"></a>
                        </p>


                    </div>

                </div>
                <div class="tab-content">
                    <div id="seq" class="tab-pane fade active in" aria-labelledby="seq-tab">

                        <label style="font-size: 18px;font-family: inherit;display: block">
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
                <div id="submitPromptInfo" style="display: none">
                    <div>
                        <p  style="color: black" class="form-text text-muted">
                            If the analysis results come out, we will notify you by email. Please wait patiently.<br/>
                            Sequence analysis takes 2 seconds to 3 minutes and

                            you can click here to view the analysis results.
                        </p>
                    </div>
                        <button  class="btn btn-default btn-primary"  @click="viewResult" >View result</button>
                        <button v-if="showCollect"  class="btn btn-default btn-primary"  @click="collect" >Add to bookmark</button>
                    </div>
                </div>
                <div v-show = "showResult" style="margin-top: 30px"  class="panel panel-info">
                    <div class="panel-heading">
                        Cleavage Prediction Diagram
                    </div>
                    <div id="sequenceDiv" class="panel-body">
                        The results will be shown here
                    </div>

                </div>
                <div v-show = "showResult">

<%--                <div id="viewResultPromptInfo" style="display: none">--%>
                    <p   class="form-text text-muted" style="color: black">
                        *For the prediction lines, a series of "s" is provided to indicate the signal sequence and sites where the cleavage probability for that model exceeded the threshold probability are denoted with the letter "C" below the site while non-cleaved sites are designated by a period ".".
                    </p>
                </div>
                <div v-show = "showResult" style="margin-top: 30px"  class="panel panel-info">
                    <div class="panel-heading">
                        Predicted Cleavage Results
                    </div>

                    <div id="cleavageDiv">
                        <table style="width: 90%;margin-left: 5%">
                            <tr >
                                <td><strong>Position</strong></td>
                                <td v-for="item in predict">{{item[0]}}</td>


                            </tr>
                            <tr >
                                <td><strong>Amino acids type</strong></td>
                                <td v-for="item in predict">{{originSequence[item[0]-1]}}</td>
                            </tr>
                            <tr >
                                <td><strong>Probability</strong></td>
                                <td v-for="item in predict">{{item[1].toFixed(3)}}</td>
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
                    <button type="button" class="btn btn-default btn-primary" data-dismiss="modal">close</button>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->

    </div>


        </div>
    </div>


    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>
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
            showCollect:false,
            predict:[],
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
                    url : 'http://119.96.190.130/DeepNeuropePred/submit',
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
                        _this.url="http://119.96.190.130/DeepNeuropePred/status-api/"+data.taskId
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
                        $("#submitPromptInfo").css({"display": "block"});
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
                this.sequence=">A0A088MIT0\nMAFLKKSLFLVLFLGVVSLSFCEEEKREEHEEEKRDEEDAESLGKRYGGLSPLRISKRVPPGFTPFRSPARSISGLTPIRLSKRVPPGFTPFRSPARRISEADPGFTPSFVVIKGLSPLRGKRRPPGFSPFRVD"
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
                            $("#viewResultPromptInfo").css({"display": "block"})

                            _this.resultSequence="";
                            let res=data.data;
                            _this.predict=res.predict;
                            _this.sequence=res.sequence;

                            res.sequence=res.sequence.split("\n");
                            res.sequence=res.sequence[1];
                            _this.originSequence=res.sequence;
                            //console.log(res.sequence)
                            _this.showResult = true
                            for(let i=0;i<res.sequence.length;i++){
                                //console.log(_this.resultSequence)
                                if(i<res.signal_pos)
                                _this.resultSequence=_this.resultSequence+'s';
                                else
                                    _this.resultSequence=_this.resultSequence+'.';


                            }
                            _this.resultSequence=_this.resultSequence.split('');

                            for(let i=0;i<res.predict.length;i++){
                                let index=res.predict[i][0];
                                //console.log(index)
                                if(res.predict[i][1]>=0.5){
                                    //index修改

                                    _this.resultSequence.splice(index-1,1,'C')


                                }
                                else
                                {
                                    //index修改

                                    //_this.resultSequence.splice(index-1,1,'r')
                                    _this.resultSequence.splice(index-1,1,'.')
                                }
                            }
                            _this.resultSequence=_this.resultSequence.join('');
                            //console.log(_this.originSequence.length)
                            //console.log(_this.resultSequence.length)
                            //添加表格
                            var sub_count = Math.floor((_this.resultSequence.length) / 10);
                            let sequenceTable="<table style='font-family:  Consolas;width:100%;font-size: 18px ' frame=void >";
                            for (var i = 0; i < sub_count; i++) {
                                if(i%5==0)
                                    sequenceTable+="<tr><td><strong>sequence</strong></td>"
                                sequenceTable+="<td style='border-style:none;'>"+res.sequence.substr(i * 10, 10);
                                var sub = "[" + (i + 1) * 10 + "]"
                                sequenceTable+=sub.sub()+"</td>";
                                if(i%5==4){
                                    sequenceTable+="</tr>"
                                    let j=i-4;
                                    sequenceTable+="<tr><td><strong>prediction</strong></td>"
                                    for( j;j<=i;j++){
                                        sequenceTable+="<td style='border-style:none;'>"+_this.resultSequence.substr(j * 10, 10);
                                        var sub = "[" + (j + 1) * 10 + "]"
                                        sequenceTable+=sub.sub()+"</td>";

                                    }
                                }

                            }
                            if(res.sequence.substr(i * 10)!=''){
                                sequenceTable+="<td style='border-style:none;'>"+res.sequence.substr(i * 10)+"</td>"
                            }



                            if(res.sequence.length%50!=0){
                                let sub_count50 = Math.floor((_this.resultSequence.length) / 50);
                                sequenceTable+="<tr><td><strong>prediction</strong></td>"
                                let i
                                for(i=sub_count50*5;i<sub_count;i++){
                                    sequenceTable+="<td>"+_this.resultSequence.substr(i*10,10);
                                    var sub = "[" + (i + 1) * 10 + "]"
                                    sequenceTable+=sub.sub()+"</td>";

                                }
                                if(_this.resultSequence.substr(i*10)!=''){
                                    sequenceTable+="<td>"+_this.resultSequence.substr(i*10)+"</td>";
                                }
                                sequenceTable+="</tr>"


                            }
                            sequenceTable+="</table>"
                            $('#sequenceDiv').html(sequenceTable);


                            //添加Predicted Cleavage Results表格
                            let cleavage="<table style='width: 90%;margin-left: 5%'>";
                            let cleCount=Math.floor((_this.predict.length) / 10);
                            for(let i=0;i<cleCount;i++){
                                cleavage+="<tr> <td><strong>Position</strong></td>";
                                for(let j=0;j<10;j++){
                                    console.log(_this.predict[j + 10 * i])
                                    console.log(_this.predict[j + 10 * i][0]);

                                    cleavage+="<td>"+_this.predict[j+10*i][0]+"</td>"

                                }
                                cleavage+="</tr>"

                                cleavage+="<tr><td><strong>Amino acids type</strong></td>";
                                for(let j=0;j<10;j++){
                                    cleavage+="<td>"+_this.originSequence[_this.predict[j+10*i][0]-1]+"</td>"
                                }
                                cleavage+="</tr>"
                                cleavage+="<tr><td><strong>Probability</strong></td>"
                                for(let j=0;j<10;j++){
                                    cleavage+="<td>"+_this.predict[j+10*i][1].toFixed(3)+"</td>"
                                }
                                cleavage+="</tr>"
                            }
                            if(_this.predict.length % 10!=0){

                                cleavage+="<tr> <td><strong>Position</strong></td>";
                                for(let j=cleCount*10;j<_this.predict.length;j++){
                                    console.log(_this.predict[j ])
                                    console.log(_this.predict[j ][0]);

                                    cleavage+="<td>"+_this.predict[j][0]+"</td>"

                                }
                                cleavage+="</tr>"

                                cleavage+="<tr><td><strong>Amino acids type</strong></td>";
                                for(let j=cleCount*10;j<_this.predict.length;j++){
                                    cleavage+="<td>"+_this.originSequence[_this.predict[j][0]]+"</td>"
                                }
                                cleavage+="</tr>"
                                cleavage+="<tr><td><strong>Probability</strong></td>"
                                for(let j=cleCount*10;j<_this.predict.length;j++){
                                    cleavage+="<td>"+_this.predict[j][1].toFixed(3)+"</td>"
                                }
                                cleavage+="</tr></table>"


                            }
                            //$('#cleavageDiv').html(cleavage);



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


<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
         language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Neuropeptide Database - Home</title>
    <meta name="keywords"
          content="peptides, HGAT, protein, precursor, motif, UniProt, database, statistics, predict"/>
    <meta name="description"
          content="Peptides Hormone, Growth factor, Antimicrobal and Toxin database"/>
    <link href="neuropeptide/css/nav.css" rel="stylesheet" type="text/css"/>
    <link href="neuropeptide/css/common.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="neuropeptide/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="neuropeptide/js/jquery.min.js"></script>
    <script type="text/javascript" src="neuropeptide/bootstrap/js/bootstrap.min.js"></script>

    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script src="https://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>
    <%--<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <style>
      /* Make the image fully responsive */
      .carousel-inner img {
        width: 100%;
        height: 100%;
      }
    </style>

    <link rel="icon" href="favicon.ico" type="mage/x-icon"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <style type="text/css">
      .introduction li {
        /*padding: 0 0 12px 0px;*/
        padding: 0 50px 20px 50px;
        list-style: none;
        line-height: 27px;
        text-align: justify;
      }

    </style>
</head>

<body id="Home" style="min-width: 1400px">
<div id="wrapper">
    <%@ include file="/neuropeptide/nav/newheader.jsp" %>


    <div id="mainbox"
         style="width: 1200px;margin: 0 auto;font-family: 'Times New Roman', Times, serif, Times-New-Roman">

        <div style="width: 100%;border-bottom:1px solid #e5e5e5;display: flex;justify-content: space-around;">
            <div style="width: 65% ;font-family: 'Times New Roman', Times, serif, Times-New-Roman">
                <h2 style="margin-left: 15px">Welcome to NeuroPep 2.0</h2>
                <p style="font-size: 18px;margin-left: 15px;text-align: justify;">
                    Neuropeptides play a variety of roles in many physiological processes and serve as potential
                    therapeutics for the treatment of a wide range of disorders such as parkinsonism, Alzheimer’s,
                    seizures and epilepsy, diabetes, cancer, high blood pressure, cardiovascular disorders, pain and
                    obstructive sleep apnea, etc. Actually, near 75% of peptide drugs which have already reached the
                    market were developed based on different neuropeptides. NeuroPep 2.0 holds 11282 non-redundant
                    neuropeptide entries originating from 924 organisms belonging to 80 neuropeptide families. We
                    collected receptor information for each
                    neuropeptide entry when available for the current version of NeuroPep. Alphafold2 and APPTEST were
                    used
                    to predict the 3D structure of neuropeptides and neuropeptide receptors without experiment
                    structure.
                    DeepNeuropePred and NeuroPred-PLM which are two different neuropeptide prediction tools developed by
                    us
                    recently were integrated into NeuroPep 2.0.
            </div>
            <div style="width: 35%; text-align: center;">
                <img src="neuropeptide/img/home/show.gif" style="height: 265px; margin-top: 30px">
                <p style="margin-top: 3px">Substance P complexed with NK1R (2KS9)</p>
            </div>

        </div>


        <div style="width: 100%;height: 150px;">
            <div style="margin-bottom: 22px"><h3
                    style="margin-left: 15px; font-family: 'Times New Roman', Times, serif, Times-New-Roman">Data
                summary</h3></div>

            <%--            <div class="row">--%>
            <%--                <div class="col-md-3">--%>
            <%--                    <span style="font-size: 18px"><strong>Neuropeptides</strong></span>--%>
            <%--                    <div>--%>
            <%--                        <img style="width: 50%;float: left" src="neuropeptide/img/home/green.png" alt=""/>--%>
            <%--                        <span style="float: left;font-size: 15px;margin-top: 15px">10165</span>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="col-md-3">--%>
            <%--                    <div style="position: absolute;left: 50%;top:50%;transform:translate(-50%,-50%);">--%>
            <%--                        <span style="font-size: 18px"><strong>Neuropeptide-receptor pairs</strong></span>--%>
            <%--                        <img style="width: 50%;float: left" src="neuropeptide/img/home/bluedeep.png" alt=""/>--%>
            <%--                        <span style="float: left;font-size: 15px;margin-top: 15px">1578</span>--%>


            <%--                    </div>--%>
            <%--                </div>--%>
            <%--                <div class="col-md-3">--%>
            <%--                    <span style="font-size: 18px"><strong>Species</strong></span>--%>
            <%--                    <img style="width: 50%;float: left" src="neuropeptide/img/home/rabbit.png" alt=""/>--%>
            <%--                    <span style="float: left;font-size: 15px;margin-top: 15px">772</span>--%>
            <%--                </div>--%>
            <%--                <div class="col-md-3">--%>
            <%--                    <span style="font-size: 18px"><strong>Neuropeptide families</strong></span>--%>
            <%--                    <img style="width: 50%;float: left" src="neuropeptide/img/home/blue.png" alt=""/>--%>
            <%--                    <span style="float: left;font-size: 15px;margin-top: 15px">80</span>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <div style="display: flex; padding-left: 15px; padding-right: 15px; justify-content: space-around">
                <div class="box-one">
                    <div style="text-align:left;">
                        <span style="font-size: 15px"><strong>Neuropeptides</strong></span>
                        <div>
                            <img style="height: 50px;vertical-align: middle;" src="neuropeptide/img/home/green.png"
                                 alt=""/>
                            <span style="font-size: 18px;vertical-align: middle;">11282</span>
                        </div>


                    </div>

                </div>
                <div class="box-one">
                    <div style="text-align:left">
                        <span style="font-size: 15px; white-space: nowrap;"><strong>Neuropeptide-receptor pairs</strong></span>
                        <div>
                            <img style="height: 50px;vertical-align: middle;" src="neuropeptide/img/home/bluedeep.png"
                                 alt=""/>
                            <span style="font-size: 18px;vertical-align: middle;">1584</span>
                        </div>


                    </div>

                </div>
                <div class="box-one">
                    <div style="text-align:left;">
                        <span style="font-size: 15px"><strong>Species</strong></span>
                        <div>
                            <img style="height: 50px;vertical-align: middle" src="neuropeptide/img/home/rabbit.png"
                                 alt=""/>
                            <span style="font-size: 18px;vertical-align: middle">924</span>
                        </div>


                    </div>

                </div>
                <div class="box-one">
                    <div style="text-align:left">
                        <span style="font-size: 15px"><strong>Neuropeptide families</strong></span>
                        <div>
                            <img style="height: 50px;vertical-align: middle" src="neuropeptide/img/home/blue.png"
                                 alt=""/>
                            <span style="font-size: 18px;vertical-align: middle">80</span>
                        </div>


                    </div>

                </div>
            </div>

        </div>

        <div style="width: 100%;height: 350px;border-bottom:1px solid #c1bfbf;">
            <div style="width: 50% ;height:100%;float: left;position:relative;">
                <%--                <strong style="margin-left: 10%;font-size: 20px;color:#3e8f3e  ">Top 10 families</strong>--%>
                <div id="topFamilyChart" style="width: 100%;height: 300px">

                </div>
            </div>
            <div style="width: 50% ;height:100%;float: left;position:relative;">
                <%--                <strong style="margin-left: 10%;font-size: 20px;color:#3e8f3e ">Top 10 species</strong>--%>
                <div id="topSpeciesChart" style="width: 100%;height: 300px;">

                </div>

            </div>

        </div>


        <div id="twotable" style="width: 100%;height: 360px;">
            <div style="margin-bottom: 22px"><h3
                    style="margin-left: 15px; font-family: 'Times New Roman', Times, serif, Times-New-Roman">What's
                new(V2.0)?</h3></div>
            <div style="display: flex; justify-content: space-around">
                <div style="width: 45% ;height:100%;">
                    <div style="width: 100%;justify-content: space-around;display: flex">
                        <div id="table1"
                             style="width: 300px;height: 360px;margin-bottom: 0px; display: inline-block"></div>
                        <div id="table2"
                             style="width: 300px;height: 360px;margin-bottom: 0px; display: inline-block"></div>
                    </div>

                    <%--                <div  style="padding-top: 50px;text-align: center">--%>


                    <%--                    --%>
                    <%--                    <p ><img src="neuropeptide/img/left4.png" alt=""/></p>--%>
                    <%--                    <p style="color: #3e8f3e">DeepNeuropePred(predict cleavage sites in neuropeptide precursors)</p>--%>
                    <%--                    <p style="color: #3e8f3e">(predict cleavage sites in neuropeptide precursors)</p>--%>
                    <%--                </div>--%>

                </div>
                <div style="width: 300px; height:100%">


                    <div style="text-align: center">
                        <p><img src="neuropeptide/img/home/newdeep.png" style="height: 264px" alt=""/></p>
                        <p style="color: black; margin-top: 15px">Neuropeptide-receptor pair</p>

                    </div>

                </div>
            </div>

        </div>


        <div id="twoimg" style="width: 100%;height: 350px;display: flex;justify-content: space-around">
            <div style="height:100%">

                <div style="padding-top: 33px;text-align: center;cursor: pointer"
                     onclick="window.open('deepNeuropePred.jsp')">
                    <p><img src="neuropeptide/img/home/cleavage.png" style="height: 295px" alt=""/></p>
                    <p style="color: #3e8f3e">DeepNeuropePred</p>
                </div>

            </div>
            <div style="height:100%">
                <div style="padding-top: 30px;text-align: center;cursor: pointer"
                     onclick="window.open('NeuroPred-ESM.jsp')">
                    <p><img src="neuropeptide/img/neuropred-esm.png" style="width: 300px" alt=""/></p>
                    <p style="color: #3e8f3e">NeuroPred-PLM</p>

                </div>
            </div>


        </div>


    </div>
    <%@ include file="/neuropeptide/nav/newfooter.jsp" %>


    <script type="text/javascript">
      $('#topFamilyChart').removeAttr('onclick');//去掉标签中的onclick事件
      $('#topSpeciesChart').removeAttr('onclick');//去掉标签中的onclick事件

      //第一个矩形图
      var fchartDom = document.getElementById('topFamilyChart');
      var fChart = echarts.init(fchartDom);
      var optionf;
      optionf = {

        title: {
          text: 'Top 10 neuropeptide families',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        //图表样式颜色
        color: [
          '#c9e6fa',
          '#daedfb',
          '#d1e4f2',
          '#e2eff9',
          '#d3e1ec',

          '#e0e7ec',

          '#e9f3fa',

        ],


        series: [
          {
            name: 'Families Form',

            type: 'treemap',
            visibleMin: 300,
            data: [

              {
                value: 1153,
                name: 'FMRFamide related peptide',
                link: 'browse_family?&name=FMRFamide%20related%20peptide',
                target: 'blank'
              },
              {
                value: 645,
                name: 'Neuropeptide-like peptide',
                link: 'browse_family?&name=Neuropeptide-like%20peptide',
                target: 'blank'
              },
              {value: 604, name: 'Allatostatin', link: 'browse_family?&name=Allatostatin', target: 'blank'},
              {
                value: 520,
                name: 'AKH/HRTH/RPCH',
                link: 'browse_family?&name=AKH/HRTH/RPCH',
                target: 'blank'
              },
              {value: 515, name: 'Pyrokinin', link: 'browse_family?&name=Pyrokinin', target: 'blank'},
              {value: 516, name: 'Insulin', link: 'browse_family?&name=Insulin', target: 'blank'},
              {
                value: 403,
                name: 'Tachykinin',
                link: 'browse_family?&name=Tachykinin',
                target: 'blank'
              },
              {value: 393, name: 'Gastrin/CCK', link: 'browse_family?&name=Gastrin/CCK', target: 'blank'},
              {value: 383, name: 'Periviscerokinin', link: 'browse_family?&name=Periviscerokinin', target: 'blank'},
              {
                value: 373,
                name: 'Natriuretic peptide',
                link: 'browse_family?&name=Natriuretic%20peptide',
                target: 'blank'
              },
            ],
            itemStyle: {
              borderColor: '#fff'
            },
            //修改图表上的数据字体颜色
            label: {
              textStyle: {
                color: '#5a5454'
              },
            },
            breadcrumb: {
              show: false
            },

            //clickable: false,
            nodeClick: 'link',
            roam: false,

            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]

      }

      optionf && fChart.setOption(optionf)

      //第二个矩形图
      var schartDom = document.getElementById('topSpeciesChart');
      var sChart = echarts.init(schartDom);
      var option_s;
      option_s = {

        title: {
          text: 'Top 10 neuropeptide species',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        //图表样式颜色
        color: [
          '#c9e6fa',
          '#daedfb',
          '#d1e4f2',
          '#e2eff9',
          '#d3e1ec',

          '#e0e7ec',

          '#e9f3fa',

        ],
        series: [
          {
            name: 'Species Form',
            type: 'treemap',
            visibleMin: 300,
            data: [
              {
                value: 688,
                name: 'Rattus norvegicus',
                link: 'browse_organism?&name=Rattus%20norvegicus',
                target: 'blank'
              },
              {
                value: 571,
                name: 'Caenorhabditis elegans',
                link: 'browse_organism?&name=Caenorhabditis%20elegans',
                target: 'blank'
              },
              {value: 482, name: 'Mus musculus', link: 'browse_organism?&name=Mus%20musculus', target: 'blank'},
              {value: 402, name: 'Homo sapiens', link: 'browse_organism?&name=Homo%20sapiens', target: 'blank'},
              {
                value: 334,
                name: 'Callinectes sapidus',
                link: 'browse_organism?&name=Callinectes%20sapidus',
                target: 'blank'
              },
              {value: 281, name: 'Bos taurus', link: 'browse_organism?&name=Bos%20taurus', target: 'blank'},
              {
                value: 209,
                name: 'Schistocerca gregaria',
                link: 'browse_organism?&name=Schistocerca%20gregaria',
                target: 'blank'
              },
              {value: 186, name: 'Sus scrofa', link: 'browse_organism?&name=Sus%20scrofa', target: 'blank'},
              {
                value: 179,
                name: 'Drosophila melanogaster',
                link: 'browse_organism?&name=Drosophila%20melanogaster',
                target: 'blank'
              },
              {
                value: 154,
                name: 'Aplysia californica',
                link: 'browse_organism?&name=Aplysia%20californica',
                target: 'blank'
              },
            ],
            //修改图表上的数据字体颜色
            label: {
              textStyle: {
                color: '#5a5454'
              },
            },
            breadcrumb: {
              show: false
            },
            clickable: false,
            nodeClick: 'link',
            roam: false,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }

      option_s && sChart.setOption(option_s)


      //第三个表格
      var chartDom = document.getElementById('table1');
      var myChart = echarts.init(chartDom);
      var option;

      option = {
        title: {
          text: 'Neuropeptide families',
          left: 'center',
          textStyle: {
            fontFamily: 'Times-New-Roman',
          }
        },
        xAxis: {
          type: 'category',
          data: ['V1', 'V2']
        },
        yAxis: {
          type: 'value'
        },
        grid: {
          containLabel: true,
        },
        series: [
          {
            data: [65, 80],
            type: 'bar',
            barWidth: 25,//柱图宽度
            itemStyle: {
              normal: {
                label: {
                  show: true, //开启显示
                  position: 'top', //在上方显示
                  textStyle: { //数值样式
                    color: 'black',
                    fontSize: 16
                  }
                },
              }
            },
            showBackground: true,
            backgroundStyle: {
              color: 'rgba(180, 180, 180, 0.2)'
            },
            color: '#188DF0'
          }
        ]
      };

      option && myChart.setOption(option);


      //第4个表格
      var chartDom2 = document.getElementById('table2');
      var myChart2 = echarts.init(chartDom2);
      var option2;

      option2 = {
        title: {
          text: 'Neuropeptide species',
          left: 'center',
          textStyle: {
            fontFamily: 'Times-New-Roman',
          }
        },
        xAxis: {
          type: 'category',
          data: ['V1', 'V2']
        },
        yAxis: {
          type: 'value'
        },
        grid: {
          containLabel: true,
        },
        series: [
          {
            data: [443, 924],
            type: 'bar',
            barWidth: 25,//柱图宽度
            itemStyle: {
              normal: {
                //这里是重点
                //color: function (params) {
                //  //注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
                //  var colorList = ['#844af2', '#f42bf9'];
                //  return colorList[params.dataIndex]
                //},
                label: {
                  show: true, //开启显示
                  position: 'top', //在上方显示
                  textStyle: { //数值样式
                    color: 'black',
                    fontSize: 16
                  }
                }


              }
            },
            showBackground: true,
            backgroundStyle: {
              color: 'rgba(180, 180, 180, 0.2)'
            },
            color: '#188DF0'
          }
        ]
      };

      option2 && myChart2.setOption(option2);


      window.onresize = function () {
        fChart.resize();
        sChart.resize();
        tableChar1.resize();
      }
    </script>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2019/10/29
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>

<nav class="navbar navbar-default text-center" style="font-family:'宋体';height:60px;background:#3F96C3;color: #fff;">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
<%--        <div class="navbar-header">--%>
<%--            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"--%>
<%--                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">--%>
<%--                <span class="sr-only">Toggle navigation</span>--%>
<%--                <span class="icon-bar"></span>--%>
<%--                <span class="icon-bar"></span>--%>
<%--                <span class="icon-bar"></span>--%>
<%--            </button>--%>

<%--            <!-- <div class="web-title""><h2>NeuroPep<h4>a Comprehensive Resoruce of Neuropeptides</h4></h2></div> -->--%>
<%--            &lt;%&ndash;<a href="https://academic.oup.com/database/article/doi/10.1093/database/bav038/2433170" target="_blank"><span class="navbar-brand" style="margin-right: 100px;font-size: 24px;color:#fff;">NeuroPep<span&ndash;%&gt;--%>
<%--            &lt;%&ndash;style="font-size: 16px;margin-left: 20px;color:#fff">a Comprehensive Resoruce of Neuropeptides</span></span></a>&ndash;%&gt;--%>
<%--        </div>--%>
        <%--<a href="" class="navbar-brand" style="margin-right: 100px;font-size: 24px;color:#fff;">--%>
        <%--<img alt="Brand" style="width: 120px;height: 33px;position: absolute;top: 8px" src="neuropeptide/img/brand2.png">--%>
        <%--</a>--%>


        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1 text-center">
            <ul class="nav navbar-nav nav-main" style="display: inline-block;float: none;">
                <li><a class="navbar-brand" href="#"><img alt="Brand" style="width: 110px;height: 55px;position: relative;top: -15px;" src="neuropeptide/img/brand.png"></a></li>
                <li class=""><a href="home.jsp" style="color:#fff;font-size: 16px;">Home <span
                        class="sr-only">(current)</span></a></li>
                <!-- <li><a href="#">Link</a></li> -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#fff;font-size: 16px;">
                        Browse <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a><strong>Neuropeptide</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browse?type=family">By Family</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browse?type=organism">Organism</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browse?type=modification">Modifaction</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a><strong>Receptor</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browseReceptor?type=family">By Family</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browseReceptor?type=organism">Organism</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent:2em"><a href="browseReceptor?type=modification">Modifaction</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#fff;font-size: 16px;">
                        Search <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a><strong>Neuropeptide</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="basic_search.jsp">Quick Search</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="advanced_search.jsp">Advanced Search</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a><strong>Receptor</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="basic_receptorSearch.jsp">Quick Search</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="advancedR_search.jsp">Advanced Search</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="newAdvanced_search.jsp"><strong>New Advanced Search</strong></a></li>
                        <%--                    <li role="separator" class="divider"></li>
                                            <li><a href="advanced_receptorsearch.jsp"><strong>New Advanced Search(R)</strong></a></li>--%>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#fff;font-size: 16px;">
                        Tools <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="blast.jsp">Blast</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="map.jsp">Map</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="deepNeuropePred.jsp">DeepNeuropePred</a></li>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="clustalw.jsp">ClustalW</a></li>--%>
                    </ul>
                </li>

                <li><a href="statistics.jsp" style="color:#fff;font-size: 16px;">Statistics</a></li>

                <li><a href="submission" style="color:#fff;font-size: 16px;">Submission</a></li>

                <li><a href="help.jsp" style="color:#fff;font-size: 16px;">Help</a></li>

                <li><a href="contact.jsp" style="color:#fff;font-size: 16px;">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>


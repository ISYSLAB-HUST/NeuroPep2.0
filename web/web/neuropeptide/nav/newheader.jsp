<div id="header">

    <div id="sitename"
         style="height: 120px;margin: 0 auto;background: linear-gradient(to left, rgb(132 189 233), rgba(132,189,233,0.14), rgb(132 189 233));">
        <div style=" width: 1150px; margin: 0 auto;">
            <span style="font-size: 57px;text-shadow: 1px 1px 2px #777;color: #0C5987;font-family: Arial;font-style: italic;vertical-align: middle;display: inline-block;font-weight: bold;line-height: 120px;">NeuroPep 2.0</span>
            <span style="text-shadow: 1px 1px 2px #777;font-size: 32px;margin-top: 20px;font-family: Arial;font-style: italic;padding-left: 42px;display: inline-block;vertical-align: middle;color: rgb(255 190 0);">a Comprehensive Resource of Neuropeptides</span>
        </div>
    </div>

    <div class="collapse navbar-collapse" style="background-color: #e5e5e5; box-shadow: 1px 1px 3px #777;">
        <div style="width: 1200px;margin: 0 auto;">
            <ul class="nav navbar-nav nav-main"
                style="display: inline-block;float: none;color:#0C5987;width:  100%;font-weight: bold;">
                <li class=""><a href="home.jsp" style="color:#0C5987;font-size: 16px;">Home <span
                        class="sr-only">(current)</span></a></li>
                <!-- <li><a href="#">Link</a></li> -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#0C5987;font-size: 16px;">
                        Browse <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a><strong>Neuropeptide</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent: 1.5em;"><a href="browse?type=family">By Family</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent: 1.5em;"><a href="browse?type=organism">Organism</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent: 1.5em;"><a href="browse?type=modification">Modifaction</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a><strong>Receptor</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <%--                    <li><a href="browseReceptor?type=family">By Family</a></li>--%>
                        <%--                    <li role="separator" class="divider"></li>--%>
                        <li style="text-indent: 1.5em;"><a href="browseReceptor?type=organism">Organism</a></li>
                        <li role="separator" class="divider"></li>
                        <li style="text-indent: 1.5em;"><a href="browseReceptor?type=modification">Modifaction</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#0C5987;font-size: 16px;">
                        Search <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="basic_search.jsp">Quick Search</a></li>
                        <%--                    <li role="separator" class="divider"></li>--%>
                        <%--                    <li><a><strong>Neuropeptide</strong></a></li>--%>
                        <%--                    <li role="separator" class="divider"></li>--%>
                        <%--                    <li><a href="advanced_search.jsp">Advanced Search</a></li>--%>
                        <%--                    <li role="separator" class="divider"></li>--%>
                        <%--                    <li><a><strong>Receptor</strong></a></li>--%>
                        <%--                    <li role="separator" class="divider"></li>--%>
                        <%--                    <li><a href="advancedR_search.jsp">Advanced Search</a></li>--%>
                        <li role="separator" class="divider"></li>
                        <li><a href="newAdvanced_search.jsp">Advanced Search</a></li>
                        <%--                    <li role="separator" class="divider"></li>
                                            <li><a href="advanced_receptorsearch.jsp"><strong>New Advanced Search(R)</strong></a></li>--%>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="color:#0C5987;font-size: 16px;">
                        Tools <span class="caret" style="padding: 0"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="blast.jsp">Blast</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="map.jsp">Map</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="deepNeuropePred.jsp">DeepNeuropePred</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="NeuroPred-ESM.jsp">NeuroPred-PLM</a></li>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="clustalw.jsp">ClustalW</a></li>--%>
                    </ul>
                </li>

                <li><a href="statistics.jsp" style="color:#0C5987;font-size: 16px;">Statistics</a></li>

                <li><a href="submission" style="color:#0C5987;font-size: 16px;">Submission</a></li>

                <li><a href="help.jsp" style="color:#0C5987;font-size: 16px;">Help</a></li>
                <li><a href="download.jsp" style="color:#0C5987;font-size: 16px;">Download</a></li>

                <li style="float: right"><a href="contact.jsp" style="color:#0C5987;font-size: 16px;">Contact Us</a>
                </li>
            </ul>
        </div>
    </div>


</div>
<!-- close div#header -->
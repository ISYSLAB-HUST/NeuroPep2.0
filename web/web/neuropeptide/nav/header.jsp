<!--
<script type="text/javascript">
function caption() {
var nav_cap = document.getElementById("nav_cap").value;
var nav_content = document.getElementById("nav_content");
var obj_span = nav_content.getElementsByTagName("span");
for ( var i=0; i<obj_span.length; i++) {
if ( obj_span.item(i).textContent == nav_cap ) {
obj_span.item(i).parentNode.parentNode.className = "current";
}
}

}
</script>
-->
<div id="header">

    <div id="sitename" style="padding-top:0px;">
        <img alt="" src="neuropeptide/img/brand.jpg"/>
    </div>

    <div class="menu_nav">
        <ul class="nav_content" id="nav_content">
            <li class="top_li"><a href="home.jsp" title="Home" class="top_link"><span>Home</span> </a></li>
            <li class="top_li"><a href="#" title="Browse" class="top_link">
                <span class="down">Browse</span> </a>
                <ul>
                    <li class="sec_li"><a href="browse?type=family" class="sec_link"><span>By family</span></a></li>
                    <li class="sec_li"><a href="browse?type=organism" class="sec_link"><span>Organism</span></a></li>
                    <li class="sec_li"><a href="browse?type=modification" class="sec_link"><span>Modification</span></a>
                    </li>
                </ul>
            </li>
            <li class="top_li"><a href="javascript:void(0)" title="Search" class="top_link">
                <span class="down">Search</span></a>
                <ul>
                    <li class="sec_li"><a href="basic_search.jsp" class="sec_link"><span>Quick Search</span></a></li>
                    <li class="sec_li"><a href="advanced_search.jsp" class="sec_link"><span>Advanced Search</span></a>
                    </li>
                    <!-- <li><a href="blast.jsp"><span>Smith-Waterman</span></a></li> -->
                </ul>
            </li>
            <li class="top_li"><a href="javascript:void(0)" title="Search" class="top_link">
                <span class="down">Tools</span></a>
                <ul>
                    <li class="sec_li"><a href="blast.jsp" class="sec_link"><span>Blast</span></a></li>
                    <li class="sec_li"><a href="map.jsp" class="sec_link"><span>Map</span></a></li>
                    <li class="sec_li"><a href="clustalw.jsp" class="sec_link"><span>ClustalW</span></a></li>
                    <!-- <li><a href="blast.jsp"><span>Smith-Waterman</span></a></li> -->
                </ul>
            </li>
            <li class="top_li"><a href="statistics.jsp" title="Statistics" class="top_link"><span>Statistics</span></a>
            </li>
            <li class="top_li"><a href="submission" title="Submission" class="top_link"><span>Submission</span></a></li>
            <li class="top_li"><a href="help.jsp" title="Help" class="top_link"><span>Help</span> </a></li>
            <li class="top_li"><a href="contact.jsp" title="Contact" class="top_link"><span>Contact</span> </a></li>
            <!-- <li class="top_li"><a href="web_service.jsp" title="Web_Service" class="top_link"><span>Web Service</span> </a></li>
             -->
        </ul>
        <!--<div class="menu_nav_right"></div>-->
    </div>

</div>
<!-- close div#header -->
<div id="footer" style="clear: both; display: none;">Last update: <span id="update_time"></span></div>
<!-- close div#footer -->
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type='text/javascript' src='dwr/interface/NeuropeptideDWR.js'></script>
<script type="text/javascript">
    window.onload = function () {
        footer();
    };

    function footer() {
        var mycall = function callBack(data) {
            document.getElementById("update_time").innerHTML = "&nbsp;&nbsp;" + data;
        };
        NeuropeptideDWR.get_updateTime(mycall);
    }
</script>
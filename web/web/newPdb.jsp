<%--
  Created by IntelliJ IDEA.
  User: Nan
  Date: 2021/7/26
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>
    <style>
        .mol-container {
            width:    75%;
            height:   400px;
            position: relative;
        }
    </style>
    <script>
        $(function() {
            let element = $('#container-01');
            let config = { backgroundColor : 'white' };
            let viewer = $3Dmol.createViewer( element, config );
            let pdbUri = './jmol/pdb/1A7FA.pdb';
            jQuery.ajax( pdbUri, {
                success: function(data) {
                    let v = viewer;
                    v.addModel( data, "pdb" );                       /* load data */
                    v.setStyle({}, {cartoon: {color: 'spectrum'}});  /* style all atoms */
                    v.zoomTo();                                      /* set camera */
                    v.render();                                      /* render scene */
                    v.zoom(1.2, 1000);                               /* slight zoom */
                },
                error: function(hdr, status, err) {
                    console.error( "Failed to load PDB " + pdbUri + ": " + err );
                },
            });
            //viewer.addModel("3\n\nC 0 0 0\nO 1.16 0 0\nO -1.16 0 0", "xyz");
            viewer.addUnitCell();
            //viewer.setStyle({}, {sphere : {}});
            //viewer.zoomTo();
            //viewer.render();
        });
    </script>
</head>
<body>
<div id="container-01" class="mol-container"></div>
</body>
</html>

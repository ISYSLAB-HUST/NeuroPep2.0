function changeXML(selectedVal) {
    if (selectedVal == "id") {
        $.get("/NeuropeptideDB/neuropeptide/txt/idQuery.txt", function (txt) {
            $("#xmlText").text(txt);
        });
    } else if (selectedVal == "accessionNum") {
        $.get("/NeuropeptideDB/neuropeptide/txt/accessNumQuery.txt", function (txt) {
            $("#xmlText").text(txt);
        });
    } else if (selectedVal == "name") {
        $.get("/NeuropeptideDB/neuropeptide/txt/nameQuery.txt", function (txt) {
            $("#xmlText").text(txt);
        });
    } else if (selectedVal == "sequence") {
        $.get("/NeuropeptideDB/neuropeptide/txt/sequenceQuery.txt", function (txt) {
            $("#xmlText").text(txt);
        });
    } else if (selectedVal == "organism") {
        $.get("/NeuropeptideDB/neuropeptide/txt/predictions.txt", function (txt) {
            var x = txt.replace(/\n/g, " ");
            alert(x);
            $("#xmlText").text(x);
        });
    }

}


function submitForm() {
    var xmlText = document.getElementById("xmlText").value;
    var xmlTextTrim = xmlText.replace(/\s{2,}/g, "");

    if (xmlTextTrim.search(/<queryType>org\.pdb.neuropeptide\.simple\.AccessionNumQuery<\/queryType>/) != -1) {
        var queryXml = xmlTextTrim.match(/<accessionNum>NP\d{5}<\/accessionNum>/);
        if (queryXml.length == 1) {
            var accessNum = queryXml[0].match(/NP\d{5}/);
            var accessNumUrl = "/NeuropeptideDB/CXFService/infos/accessNum/" + accessNum;
            alert(accessNum);
            $.ajax({
                type: "get",
                url: accessNumUrl,
                dataType: "json",
                contentType: "application/json",
                success: function (data, textStatus) {
                    if (data.length >= 1) {
                        var resulLink = "<a href='search_info?pepNum=" + data.accessNum + "' target='_blank'>" + data.accessNum + "</a>";
                        $("#xmlResult").html(resulLink);
                    } else {
                        alert("no result !");
                    }
                },
                error: function () {
                    alert("error, please try again !");//请求出错处理
                }
            });
        } else {
            alert("please check xml again !");
            return;
        }
    } else if (xmlTextTrim.search(/<queryType>org\.pdb.neuropeptide\.simple\.IdQuery<\/queryType>/) != -1) {
        var queryXml = xmlTextTrim.match(/<id>\d{1,5}<\/id>/);
        if (queryXml.length == 1) {
            var id = queryXml[0].match(/\d{1,5}/);
            var idurl = "/NeuropeptideDB/CXFService/infos/id/" + id;
            $.ajax({
                type: "get",
                url: idurl,
                dataType: "json",
                contentType: "application/json",
                success: function (data, textStatus) {
                    if (data.length >= 1) {
                        var resulLink = "<a href='search_info?pepNum=" + data.accessNum + "' target='_blank'>" + data.accessNum + "</a>";
                        $("#xmlResult").html(resulLink);
                    } else {
                        alert("no result !");
                    }
                },
                error: function () {
                    alert("error, please try again !");//请求出错处理
                }
            });
        } else {
            alert("please check xml again !");
            return;
        }
    } else if (xmlTextTrim.search(/<queryType>org\.pdb.neuropeptide\.simple\.NameQuery<\/queryType>/) != -1) {
        var queryXml = xmlTextTrim.match(/<name>.*<\/name>/g);
        if (queryXml.length == 1) {
            var nameTempArr = queryXml[0].split(/<name>/);
            var nameArr = nameTempArr[1].split(/<\/name>/);
            var nameUrl = "/NeuropeptideDB/CXFService/get/name/" + nameArr[0];
            ;
            $.ajax({
                type: "get",
                url: nameUrl,
                dataType: "json",
                contentType: "application/json",
                success: function (data, textStatus) {
                    if (data.length >= 1) {
                        var resulLink = "";
                        for (var i = 0; i < data.length; i++) {
                            resulLink += "<a href='search_info?pepNum=" + data[i] + "' target='_blank'>" + data[i] + "</a>&nbsp;&nbsp;&nbsp;";
                        }
                        $("#xmlResult").html(resulLink);
                    } else {
                        alert("no result !");
                    }
                },
                error: function () {
                    alert("error, please try again !");//请求出错处理
                }
            });
        } else {
            alert("please check xml again !");
            return;
        }
    } else if (xmlTextTrim.search(/<queryType>org\.pdb.neuropeptide\.simple\.SequenceQuery<\/queryType>/) != -1) {
        var queryXml = xmlTextTrim.match(/<sequence>.*<\/sequence>/g);
        if (queryXml.length == 1) {
            var sequenceTempArr = queryXml[0].split(/<sequence>/);
            var sequenceArr = sequenceTempArr[1].split(/<\/sequence>/);
            var regSequence = /^[A-Za-z]+$/;
            if (regSequence.test(sequenceArr[0])) {
                var nameUrl = "/NeuropeptideDB/CXFService/get/sequence/" + sequenceArr[0];
                ;
                $.ajax({
                    type: "get",
                    url: nameUrl,
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data, textStatus) {
                        if (data.length >= 1) {
                            var resulLink = "";
                            for (var i = 0; i < data.length; i++) {
                                resulLink += "<a href='search_info?pepNum=" + data[i] + "' target='_blank'>" + data[i] + "</a>&nbsp;&nbsp;&nbsp;";
                            }
                            $("#xmlResult").html(resulLink);
                        } else {
                            alert("no result !");
                        }
                    },
                    error: function () {
                        alert("error, please try again !");//请求出错处理
                    }
                });
            } else {
                alert("please check xml again !");
                return;
            }
        }
    } else {
        alert("sequence error !");
        return;
    }


}
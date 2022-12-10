/*family饼图分布option*/
var familyPie = {
  chart: {
    renderTo: 'family_graph_container',
    //margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
  },
  title: {
    text: 'Family distribution of Neuropeptide '
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
      },
      showInLegend: false
    }
  },
  series: [{
    type: 'pie',
    name: 'family share',
    innerSize: '50%',
    data: []
  }],
  legend: {
    align: "center",
  },
};

/*phyla饼图分布option*/
var phylaPie = {
  chart: {
    renderTo: 'phyla_graph_container',
    //margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
  },
  title: {
    text: 'Phyla distribution of Neuropeptide'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.y}</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.y}'
      },
      showInLegend: false
    }
  },
  series: [{
    type: 'pie',
    name: 'phyla share',
    data: []
  }],
  legend: {
    align: "center",
  }
};

// 受体phyla饼图分布option
var phylaPieReceptor = {
  chart: {
    renderTo: 'phyla_graph_container_receptor',
    //margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
  },
  title: {
    text: 'Phyla distribution of Receptor interacting with neuropeptide'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.y}</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.y}'
      },
      showInLegend: false
    }
  },
  series: [{
    type: 'pie',
    name: 'phyla share',
    data: []
  }],
  legend: {
    align: "center",
  }
};


/*family饼图分布option*/
var familyPieNandR = {
  chart: {
    renderTo: 'family_graph_container_NandR',
    //margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
  },
  title: {
    text: 'Family distribution of Neuropeptide-receptor Pair'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      },
      showInLegend: false
    }
  },
  series: [{
    type: 'pie',
    name: 'family share',
    data: []
  }],
  legend: {
    align: "center",
  }
};

var organismVertebratePie = {
  chart: {
    renderTo: 'orgnism_vertebrate_container',
    //margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
  },
  title: {
    text: 'Top 10 Vertebrate Organisms'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.y}</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.y}'
      },
      showInLegend: false
    }
  },
  series: [{
    type: 'pie',
    name: 'orgnism share',
    data: []
  }],
  legend: {
    align: "center",
  }
};

/*organism饼图分布option*/
var organismInvertebratePie = {
  chart: {
    renderTo: 'orgnism_invertebrate_container',
//			margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false
  },
  title: {
    text: 'Top 10 Invertebrate Organisms'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.y}</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.y}'
      }
    }
  },
  series: [{
    type: 'pie',
    name: 'orgnism share',
    data: []
  }]
};

/*length柱状分布option*/
var lenHistogram = {
  chart: {
    renderTo: 'seq_graph_container',
    type: 'column',
//            margin: [ 50, 50, 100, 80],
    zoomType: 'x'
  },
  title: {
    text: 'Sequence length distribution of Neuropeptide'
  },
  subtitle: {
    text: ''
  },
  xAxis: {
    categories: []
  },
  yAxis: {
    min: 0,
    labels: {
      formatter: function () {
        return this.value * 100;
      }
    },
    title: {
      text: 'Length % Composition'
    }
  },
  tooltip: {
    pointFormat: 'Percent: <b>{point.y}</b>',
    formatter: function () {
      return 'frequency: <b>' + (this.y * 100).toFixed(2) + '%</b>';
    }
  },
  legend: {
    enabled: false
  },
  series: [{
    name: 'Length',
    data: [],
  }],
  plotOptions: {
    column: {
      pointPadding: 0.2,
      borderWidth: 0,
      pointWidth: 20
    }
  }
};

/*amin_oacids柱状分布option*/
var amin_oacids_column = {
  chart: {
    renderTo: 'amino_acids_distribution_container',
    type: 'column',
//            margin: [ 50, 50, 100, 80],
    zoomType: 'x'
  },
  title: {
    text: 'Amino acids distribution of Neuropeptide'
  },
  subtitle: {
    text: ''
  },
  legend: {
    enabled: false
  },
  xAxis: {
    categories: ['A',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'K',
      'L',
      'M',
      'N',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'V',
      'W',
      'Y',
    ]
  },
  yAxis: {
    min: 0,
    labels: {
      formatter: function () {
        return this.value * 100;
      }
    },
    title: {
      text: 'Amino Acid % Composition'
    }
  },
  plotOptions: {
    series: {
      dataLabels: {
//        			enabled:true,
        formatter: function () {
          return Highcharts.numberFormat(this.y * 100) + '%';
        }
      }
    }
  },
  tooltip: {
    pointFormat: 'frequency: <b>{point.y}%</b>',
    formatter: function () {
      return 'frequency: <b>' + (this.y * 100).toFixed(2) + '%</b>';
    }
  },
  series: [{
    name: '',
    data: [],
  }]
};


/*source饼图分布option*/
var sourcePie = {
  chart: {
    renderTo: 'source_graph_container',
//			margin: [ 50, 50, 100, 80],
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false
  },
  title: {
    text: 'source distribution'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        useHTML: true,
        color: '#000000',
        connectorColor: '#000000',
        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      }
    }
  },
  series: [{
    type: 'pie',
    name: 'source share',
    data: []
  }]
};


/*amin_oacids柱状分布option*/
var familyNandR_column = {
  chart: {
    renderTo: 'family_graph_container_NandR',
    type: 'column',
//            margin: [ 50, 50, 100, 80],
    zoomType: 'x'
  },
  title: {
    text: 'Family distribution of Neuropeptide-receptor Pair'
  },
  subtitle: {
    text: ''
  },
  legend: {
    align: 'center',
    verticalAlign: 'top',
    borderWidth: 0,
    x: 0,
    y: 20
  },
  xAxis: {
    categories: [
      'Adrenomedullin',
      'AKH/HRTH/RPCH',
      'Apelin',
      'Arthropod PDH',
      'AVIT (prokineticin)',
      'Bombesin/neuromedin-B/ranatensin',
      'Bradykinin-related peptide',
      'Calcitonin',
      'CCHamide',
      'Endothelin/sarafotoxin',
      'FMRFamide related peptide',
      'Galanin',
      'Gastrin/cholecystokinin',
      'Glucagon',
      'GnRH',
      'Insulin',
      'KISS1',
      'Leptin',
      'Melanin-concentrating hormone',
      'Motilin',
      'Natriuretic peptide',
      'Neurexophilin',
      'Neuromedins',
      'Neuropeptide B/W',
      'Neurotensin',
      'NPY',
      'Opioid',
      'Orexin',
      'Parathyroid hormone',
      'POMC',
      'Pyrokinin',
      'RFamide neuropeptide',
      'Sauvagine/corticotropin-releasing factor/urotensin I',
      'Serpin',
      'Somatostatin',
      'Somatotropin/prolactin',
      'Spexin',
      'Tachykinin',
      'TRH',
      'Urotensin-2',
      'Vasopressin/oxytocin'
    ],
    crosshair: true,
    labels: {
      rotation: -55
    }

  },
  yAxis: {
    min: 0,
    // labels: {
    //     formatter: function () {
    //         return this.value * 100;
    //     }
    // },
    title: {
      text: ''
    },
    max: 1200,
    tickInterval: 400
  }
  ,
  tooltip: {
    // head + 每个 point + footer 拼接成完整的 table
    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        '<td style="padding:0"><b>{point.y}</b></td></tr>',
    footerFormat: '</table>',
    shared: true,
    useHTML: true
  },
  plotOptions: {
//         series: {
//             dataLabels: {
// //        			enabled:true,
//                 formatter: function () {
//                     return Highcharts.numberFormat(this.y * 100) + '%';
//                 }
//             }
//         }
    column: {
      borderWidth: 0
    }
  },
  // tooltip: {
  //     pointFormat: 'frequency: <b>{point.y}%</b>',
  //     formatter: function () {
  //         return 'frequency: <b>' + (this.y * 100).toFixed(2) + '%</b>';
  //     }
  // },
  series: [
    {
      name: 'neuropeptide',
      data: [
        21,
        520,
        17,
        73,
        33,
        60,
        157,
        61,
        27,
        55,
        1153,
        39,
        393,
        293,
        209,
        516,
        18,
        25,
        56,
        57,
        373,
        16,
        30,
        12,
        44,
        369,
        288,
        13,
        34,
        206,
        515,
        44,
        89,
        327,
        106,
        217,
        20,
        403,
        44,
        24,
        135
      ],
      color: '#2f7ed8'

    }, {
      name: 'paired neuropeptide-receptor',
      data: [
        33,
        5,
        14,
        2,
        9,
        16,
        26,
        37,
        3,
        45,
        76,
        27,
        147,
        59,
        44,
        117,
        12,
        6,
        21,
        13,
        166,
        7,
        25,
        18,
        16,
        135,
        104,
        23,
        20,
        98,
        4,
        3,
        32,
        19,
        50,
        57,
        10,
        24,
        7,
        7,
        28],
      color: '#f1bf09'

    }
  ]
};

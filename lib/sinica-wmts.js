// Generated by LiveScript 1.2.0
var SinicaLayers, i;
L.SINICA = {};
L.SINICA.WMTS = L.TileLayer.WMTS.extend({
  _url: 'http://gis.sinica.edu.tw/tileserver/wmts?',
  defaultWmtsParams: {
    tilematrixset: 'GoogleMapsCompatible',
    service: 'WMTS',
    request: 'GetTile',
    version: '1.0.0',
    layer: '',
    style: '',
    tilematrixSet: '',
    format: 'image/jpeg'
  },
  initialize: function(options){
    var wmtsParams, tileSize, i;
    this.defaultWmtsParams['layer'] = this.layer;
    wmtsParams = L.extend({}, this.defaultWmtsParams);
    tileSize = 256;
    for (i in options) {
      if (this.options[i] == null && i !== 'matrixIds') {
        wmtsParams[i] = options[i];
      }
    }
    wmtsParams.width = wmtsParams.height = tileSize * (L.Browser.retina ? 2 : 1);
    this.wmtsParams = wmtsParams;
    this.matrixIds = this.getDefaultMatrix();
    return L.setOptions(this, options);
  },
  options: {
    attribution: '© <a target="_target" href="http://gis.sinica.edu.tw/">中央研究院地理資訊科技研發與應用</a>'
  }
});
SinicaLayers = {
  "1956-臺灣土地利用及林型圖": "1956_Landuse",
  "1944-美軍地形圖-1:50,000": "AM50K_1944",
  "1945-美軍繪製臺灣城市地圖": "AMCityPlan_1945",
  "1901-日治行政區_廳(1900年代)": "Admin_1901a",
  "1901-日治行政區_堡里(1900年代)": "Admin_1901b",
  "1901-日治行政區_街庄(1900年代)": "Admin_1901c",
  "1930-日治行政區_州廳(1930年代)": "Admin_1930a",
  "1930-日治行政區_郡市(1930年代)": "Admin_1930b",
  "1930-日治行政區_街庄(1930年代)": "Admin_1930c",
  "1905-日治臺灣圖-1:100,000": "JM100K_1905",
  "1897-日治臺灣假製二十萬分一圖-1:200,000": "JM200K_1897",
  "1932-二十萬分一帝國圖(臺灣部分)": "JM200K_1932",
  "1904-日治臺灣堡圖(明治版)-1:20,000": "JM20K_1904",
  "1904-日治臺灣堡圖(重繪版)-1:20,000": "JM20K_1904_Redraw",
  "1921-日治臺灣堡圖(大正版)-1:20,000": "JM20K_1921",
  "1921-日治地形圖-1:25,000": "JM25K_1921",
  "1944-日治地形圖(航照修正版)-1:25,000": "JM25K_1944",
  "1924-日治臺灣全圖(第三版)-1:300,000": "JM300K_1924",
  "1939-日治臺灣全圖(第五版)-1:300,000": "JM300K_1939",
  "1899-日治臺灣全圖-1:400,000": "JM400K_1899",
  "1936-五十萬分一輿地圖(臺灣部分)-1:500,000": "JM500K_1936",
  "1916-日治蕃地地形圖-1:50,000": "JM50K_1916",
  "1920-日治地形圖(總督府土木局)-1:50,000": "JM50K_1920",
  "1924-日治地形圖(陸地測量部)-1:50,000": "JM50K_1924",
  "1987-臺灣地形圖-1:100,000": "TM100K_1987",
  "1989-臺灣經建1版地形圖-1:25,000": "TM25K_1989",
  "1993-臺灣經建2版地形圖-1:25,000": "TM25K_1993",
  "2001-臺灣經建3版地形圖-1:25,000": "TM25K_2001",
  "2003-臺灣經建4版地形圖-1:25,000": "TM25K_2003",
  "1956-臺灣地形圖-1:50,000": "TM50K_1956",
  "1990-臺灣經建1版地形圖-1:50,000": "TM50K_1990",
  "1996-臺灣經建2版地形圖-1:50,000": "TM50K_1996",
  "2002-臺灣經建3版地形圖-1:50,000": "TM50K_2002",
  "美軍航照影像(1945/6/17攝)": "Taipei_aerialphoto_1945"
};
for (i in SinicaLayers) {
  L.SINICA[SinicaLayers[i]] = L.SINICA.WMTS.extend({
    name: [i],
    layer: SinicaLayers[i]
  });
}
exports.layers = SinicaLayers;
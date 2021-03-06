L.RCHSS = {}

L.RCHSS.TileLayer = L.TileLayer.extend do
  options: {attribution: '© <a target="_target" href="http://gis.rchss.sinica.edu.tw/">GIS_RCHSS_AS</a>'}
  initialize: (options) ->
    options = L.Util.setOptions @, options
    L.TileLayer::initialize.call @, options.url
  getTileUrl: (tilePoint) ->
    L.Util.template @_url, L.extend {
      s: @_getSubdomain tilePoint
      z: 17 - tilePoint.z
      tilePoint.x
      tilePoint.y
    }, @options

L.RCHSS.Chiayi1900 = L.RCHSS.TileLayer.extend do
  name: '嘉義市街圖(1935)'
  options: do
    url: 'http://gis.sinica.edu.tw/googlemap/chiayi_1900/{z}/{x}/IMG_{x}_{y}_{z}.png'
    minZoom: 11
    maxZoom: 18

L.RCHSS.Chiayi1909 = L.RCHSS.TileLayer.extend do
  name: '嘉義市區改正圖(1909)'
  options: do
    url: 'http://gis.sinica.edu.tw/googlemap/chiayi_1909/{z}/{x}/IMG_{x}_{y}_{z}.png'
    minZoom: 11
    maxZoom: 18

L.RCHSS.Chiayi1931 = L.RCHSS.TileLayer.extend do
  name: '嘉義市街實測圖(1931)'
  options: do
    url: 'http://gis.sinica.edu.tw/googlemap/chiayi_1931/{z}/{x}/IMG_{x}_{y}_{z}.png'
    minZoom: 11
    maxZoom: 18

L.RCHSS.Chiayi1932 = L.RCHSS.TileLayer.extend do
  name: '嘉義市區計畫平面圖(1932)'
  options: do
    url: 'http://gis.sinica.edu.tw/googlemap/chiayi_1932/{z}/{x}/IMG_{x}_{y}_{z}.png'
    minZoom: 11
    maxZoom: 18

L.RCHSS.Chiayi1936 = L.RCHSS.TileLayer.extend do
  name: '嘉義市職業別明細圖(1936)'
  options: do
    url: 'http://gis.sinica.edu.tw/googlemap/chiayi_1936/{z}/{x}/IMG_{x}_{y}_{z}.png'
    minZoom: 12
    maxZoom: 17

L.RCHSS.Chiayi_12K_1926 = L.RCHSS.TileLayer.extend do
  name: '嘉義市內地圖(1940)'
  options: {url: 'http://gis.sinica.edu.tw/googlemap/Chiayi_12K_1926/{z}/{x}/IMG_{x}_{y}_{z}.png'}

layers = do
    'Tainan_1875': do 
      name: '臺灣府城街道圖(1875)'
    'Tainan_1875B': do 
      name: '臺灣府城並安平海口圖(1875)'
    'Tainan_1895': do 
      name: '日治五萬分之一地形圖_臺南地區(1875)'
    'Tainan_1895c': do 
      name: '日治五萬分之一地形圖_臺南地區(1895)'
    'Tainan_1896': do 
      name: '臺南城圖(1896)'
    'Tainan_1900': do 
      name: '臺南城圖(1900)'
    'JM20K_1904': do 
      name: '日治臺灣堡圖(明治版)-1:20,000(1904)'
      ext: \jpg
    'Tainan_1907B': do 
      name: '市區改正臺南市街全圖(1907)'
    'Tainan_1911': do 
      name: '臺南市區改正計畫圖(1911)'
    'Tainan_1915': do 
      name: '臺南市全圖(1915)' 
    'Tainan_1918': do 
      name: '臺南市全圖(1918)'
    'Tainan_1920': do 
      name: '臺南市全圖(1920)'
    'Tainan_1924': do 
      name: '臺南市全圖(1924)'
    'Tainan_1935': do 
      name: '臺南市街圖(1935)'
    'Tainan_1936': do 
      name: '臺南職業別明細圖(1936)'
      ext: \jpg
    'Tainan_1939': do 
      name: '臺南市街略圖(1939)'
    'Tainan_1945': do 
      name: '臺南市新舊街路名圖(1945)'
    'AMCityPlan_1945': do
      name: '美軍繪製臺灣城市地圖(1945)'
    'Tainan_1946': do 
      name: '臺南市全圖(1946)'
    'Tainan_1951': do 
      name: '安平港海圖(1951)'
    'Tainan_1959': do 
      name: '臺南市街圖(1959)'
    'Tainan_1971': do
      name: '臺南市街詳細圖(1971)'
    'Tainan_1974': do 
      name: '臺南市全圖(1974)'
    'Tainan_1982': do 
      name: '臺南市圖(1982)'
    'Tainan_1984': do 
      name: '臺南市街圖(1984'
    'Tainan_1986': do 
      name: '臺南市都市計畫圖(藍曬)(1986)'

for id, opts of layers
  ext = opts.ext? and opts.ext or 'png'
  L.RCHSS[id] = L.RCHSS.TileLayer.extend do
    name: opts.name
    options: {url: "http://gis.sinica.edu.tw/googlemap/#{id}/{z}/{x}/IMG_{x}_{y}_{z}.#{ext}"}

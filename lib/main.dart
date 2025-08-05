import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Main(),
    theme: ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.black,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final _codeController = TextEditingController();
  final _doorController = TextEditingController();

  // Lista Portainer
  final List<int> _portainerList = [
    2338, 2360, 2127, 2377, 2379, 2319, 2342, 2341, 1390, 1171, 1658, 461, 1436, 1674, 1886, 1642, 855, 1168, 800, 1951, 1705, 1877, 1952, 1194, 1337,
    1408, 1402, 2340, 1487, 1660, 3200, 393, 1746, 1880, 1188, 1278, 793, 408, 2110, 1444, 822, 1201, 804, 1253, 811, 1983, 2228, 2170, 808, 395,
    1681, 1854, 1172, 1343, 1154, 887, 1406, 1332, 840, 2304, 2180, 1255, 1493, 1499, 2369, 1435, 1301, 1044, 1474, 3059, 1035, 1053, 1123, 1126, 342,
    1355, 3079, 859, 1640, 1149, 1009, 1164, 785, 857, 842, 1177, 1902, 2245, 1140, 2209, 2247, 1184, 1034, 1411, 1392, 1407, 1372, 1352, 1501, 2133,
    1431, 1290, 2408, 1513, 1398, 1463, 2332, 1107, 1113, 1483, 1131, 1691, 1252, 1285, 1387, 1654, 1685, 1799, 1853, 1842, 1847, 1318, 1207, 1774, 1138,
    1145, 1146, 1147, 1876, 1783, 1804, 1823, 1663, 1675, 1733, 1404, 1619, 1669, 1641, 1133, 1622, 1684, 1866, 1609, 1339, 1621, 1661, 1739, 1906, 1639,
    3072, 1938, 1144, 2384, 2163, 2121, 2239, 2088, 2196, 2115, 2357, 2231, 3037, 3084, 3081, 3097, 2426, 2427
  ];

  // Lista alternativa (Polivalente)
  final List<int> _polivalenteList = [
    3338, 3327, 3029, 2197, 1271, 1350, 1482, 3329, 3317, 1376, 3318, 354, 324, 1077, 357, 460, 418, 318, 3339, 358, 865, 860, 339, 3179, 310, 351, 412, 419, 343, 313, 414, 278, 2311, 421, 336, 420, 784, 1921, 805, 807, 809, 815, 816, 825, 845, 853, 856, 867, 873, 835, 884, 894, 1017, 1071, 3263, 1924, 881, 890, 895, 1001, 1002, 1020, 1024, 2411, 1029, 1871, 1048, 1033, 1025, 1040, 1074, 1051, 1045, 1063, 1091, 870, 1067, 1070, 1079, 1081, 1082, 1984, 1089, 2218, 1092, 1094, 1098, 1764, 1101, 1110, 1112, 1127, 1129, 1926, 1132, 1135, 1136, 1143, 1148, 1150, 1260, 1224, 1155, 1157, 1011, 1167, 1274, 1186, 1187, 1192, 1193, 1195, 1163, 1202, 1207, 1209, 1007, 1279, 1210, 1212, 1231, 1218, 1219, 1223, 1226, 1904, 3004, 1248, 1238, 1235, 1371, 1241, 1242, 1617, 1243, 1340, 1334, 1269, 1249, 1302, 2415, 1283, 1373, 1369, 1322, 1349, 1289, 1267, 1328, 1365, 1457, 1422, 1286, 1488, 1403, 1433, 1310, 1251, 1385, 1362, 1304, 1386, 1292, 1415, 1364, 1500, 1265, 1377, 1479, 1325, 1441, 1227, 1277, 1492, 1481, 1429, 1464, 1480, 1424, 1405, 1240, 1383, 1498, 1348, 1118, 1230, 1351, 1344, 1461, 1497, 1442, 1459, 1382, 2439, 1296, 1447, 1331, 1445, 1443, 1473, 1160, 1189, 1428, 1276, 1367, 1363, 1401, 1347, 1379, 1394, 1478, 1452, 1256, 1470, 1516, 1299, 1254, 1437, 1389, 1075, 1291, 1413, 1378, 1368, 1791, 1456, 1517, 1966, 1453, 1320, 1297, 1395, 1317, 1308, 1307, 1503, 1430, 1426, 1332, 1466, 1321, 1491, 1338, 1467, 1496, 383, 1505, 1506, 1512, 422, 814, 1041, 1620, 1843, 1719, 1813, 1818, 1601, 1680, 1923, 1881, 1689, 1646, 1919, 1652, 1827, 1894, 1979, 1849, 1939, 1897, 1875, 1625, 1945, 1780, 2505, 1698, 1648, 1108, 1914, 1667, 1840, 1841, 1717, 1802, 1765, 1941, 1772, 1686, 1715, 1852, 1861, 1651, 1647, 1883, 1837, 1100, 1688, 1798, 1607, 1940, 1615, 1814, 1958, 1670, 1870, 1790, 2263, 1699, 1701, 1960, 1655, 1263, 1933, 1626, 1650, 1713, 1731, 1604, 1962, 1909, 1779, 1632, 1707, 1900, 1807, 1922, 1610, 1932, 1759, 1893, 1738, 1826, 1845, 1693, 1775, 1835, 1970, 3299, 1612, 1935, 1817, 1682, 1859, 1857, 1766, 1762, 1711, 1191, 1672, 1891, 1690, 2376, 1937, 1750, 1754, 1630, 1901, 1943, 1676, 1903, 1673, 1816, 1752, 1124, 1669, 1828, 1851, 1797, 1917, 1949, 3247, 1988, 1911, 1829, 1702, 1834, 1836, 1696, 1776, 1787, 1957, 2256, 1974, 1605, 1611, 1868, 1729, 1695, 1863, 1968, 1233, 1950, 1892, 1820, 1850, 1740, 1832, 1716, 1298, 1890, 1710, 1856, 1825, 1963, 1895, 1618, 1666, 1809, 1653, 1725, 1916, 1451, 1683, 1705, 1720, 1882, 1844, 1741, 1631, 1848, 1839, 1884, 1742, 1058, 1723, 1788, 1860, 1657, 1915, 1636, 1714, 1637, 1060, 1704, 1805, 1855, 1947, 1726, 1747, 1760, 1671, 1931, 1771, 1745, 1794, 1758, 1786, 1824, 1708, 1736, 1993, 1623, 1992, 1986, 1989, 1985, 1996, 249, 3330, 338, 2288, 2289, 2291, 2251, 2290, 2293, 2307, 2057, 2153, 2254, 2116, 2304, 2183, 2250, 1712, 2231, 2210, 2158, 2221, 2129, 2092, 2211, 2452, 2212, 2292, 2374, 2157, 1114, 3120, 2171, 1064, 2213, 2252, 2296, 2301, 2209, 2215, 2430, 2118, 2386, 2297, 2238, 2155, 2217, 2241, 2137, 2069, 2257, 2455, 2243, 2253, 2244, 2246, 2248, 2435, 2298, 2299, 2119, 2300, 2305, 2182, 2460, 2165, 2126, 2071, 2168, 2468, 2070, 1767, 1781, 2219, 1319, 2259, 2216, 2055, 2220, 2306, 2072, 2308, 2461, 2314, 2205, 2295, 1266, 2309, 2131, 2223, 2176, 2073, 2312, 2138, 2164, 2187, 2160, 2331, 2333, 2049, 2450, 2313, 2339, 2204, 2225, 2334, 2226, 2336, 2258, 2431, 2142, 2076, 2471, 2202, 2127, 2379, 2342, 2274, 2378, 2317, 2324, 2316, 2159, 2227, 2344, 2335, 2052, 2078, 1789, 2483, 2064, 2276, 2148, 2345, 2346, 2229, 1093, 2359, 2319, 2080, 2173, 2260, 2230, 2261, 2320, 2140, 2321, 2322, 2271, 2154, 2323, 2083, 2109, 1115, 2198, 2264, 2232, 2398, 1103, 2175, 2084, 2400, 875, 2265, 2401, 2048, 2350, 2325, 2233, 2403, 2404, 2087, 2166, 2090, 2266, 2156, 2268, 2355, 2326, 2387, 2406, 2407, 2085, 2348, 2408, 2409, 2410, 2089, 2351, 2267, 2414, 2327, 2412, 2200, 2328, 2329, 2428, 2094, 2091, 2086, 2093, 2417, 2136, 2143, 2349, 2354, 2235, 2214, 2363, 2391, 862, 2234, 2113, 2056, 2144, 2269, 2364, 2236, 2272, 1606, 2433, 2392, 2365, 2352, 2393, 2101, 2145, 2053, 2203, 2357, 2098, 2479, 406, 2448, 2103, 2394, 2422, 3207, 1735, 2395, 2074, 2146, 2481, 2284, 2368, 2240, 2396, 2222, 2478, 2465, 2058, 2440, 2356, 2114, 2066, 2397, 2332, 2120, 2132, 2399, 2099, 2106, 2476, 2186, 2413, 2382, 2347, 2463, 2454, 2199, 2427, 2275, 2482, 2134, 2277, 2488, 1633, 2438, 2453, 2150, 2122, 2388, 2100, 2135, 2188, 2418, 2375, 2447, 861, 2380, 2162, 2371, 2181, 2372, 2170, 2389, 2169, 2172, 2151, 2466, 2370, 2190, 2104, 2117, 2445, 2421, 2149, 2280, 2467, 2281, 2474, 2358, 2152, 2377, 2434, 2163, 2075, 2506, 2054, 2096, 2201, 2147, 2469, 2472, 2385, 2283, 2464, 2441, 2424, 2425, 326, 2381, 2443, 2429, 2477, 2185, 2286, 2130, 2178, 2278, 2102, 2473, 2195, 2194, 2423, 2446, 2486, 2426, 2437, 2285, 2282, 1930, 2458, 2287, 2456, 2139, 2141, 2416, 2419, 2436, 2487, 2079, 2457, 2315, 1258, 1300, 1261, 1397, 1454, 1946, 1446, 2508, 2511, 2504, 3132, 2501, 2442, 2509, 2507, 1918, 3304, 2502, 2513, 2515, 2514, 3009, 3342, 3001, 3002, 3003, 3011, 3341, 3006, 3007, 3005, 3008, 3033, 3034, 3032, 3021, 3014, 3010, 3012, 3015, 3016, 3017, 3018, 3019, 3020, 3023, 3024, 3025, 3013, 3027, 3028, 3030, 3031, 3035, 3040, 3037, 3039, 3043, 3045, 3046, 3044, 3038, 3042, 3048, 3036, 3049, 3050, 3047, 3051, 1399, 3052, 3053, 3054, 3055, 3069, 3056, 3057, 3323, 3059, 3208, 3060, 3062, 3058, 3061, 3063, 3064, 3065, 3066, 3067, 3068, 3070, 3071, 3072, 3073, 3074, 3075, 3076, 3077, 3078, 3079, 3081, 3082, 3083, 3084, 3085, 3086, 3087, 3092, 3088, 3089, 3090, 3091, 3094, 3098, 3114, 3099, 3100, 3101, 3097, 3102, 3095, 3108, 3103, 3104, 3105, 3106, 3115, 3107, 3109, 3110, 3128, 3111, 3112, 3113, 3116, 3145, 3117, 3119, 3122, 3123, 3125, 3126, 3129, 3130, 3133, 3134, 3260, 3135, 3121, 3219, 3139, 3096, 268, 3140, 3189, 3136, 3137, 3138, 3131, 3261, 3141, 3143, 3144, 3127, 3147, 3148, 3150, 3151, 3152, 3154, 3157, 3158, 3159, 3160, 3155, 3156, 3161, 3162, 3163, 3164, 3165, 3166, 3169, 3167, 3177, 3170, 3168, 3171, 3172, 3180, 3173, 3175, 3178, 3174, 3181, 3182, 3183, 3184, 1954, 3186, 3187, 3188, 3215, 3185, 3191, 3192, 3193, 3194, 3196, 3204, 3176, 3195, 3197, 3199, 3200, 3201, 3203, 3206, 3209, 3210, 3211, 3212, 3213, 3214, 3216, 3217, 3218, 3220, 3221, 3222, 3223, 3224, 3225, 3226, 3227, 3228, 3229, 3233, 3230, 3234, 3235, 3236, 3238, 3239, 3240, 3241, 3242, 3243, 3244, 3245, 3246, 3248, 3249, 3250, 3251, 3252, 3253, 3254, 3255, 3256, 3257, 3258, 3264, 1981, 3265, 3259, 3266, 3080, 3026, 3269, 3270, 3041, 3271, 3272, 3205, 3273, 3268, 3274, 3276, 3277, 3278, 3288, 3289, 3280, 3281, 3275, 3279, 3282, 3283, 3284, 3285, 3287, 3291, 3292, 3296, 3297, 3302, 3298, 3301, 3308, 3309, 3310, 3311, 3312, 3314, 3307, 3315, 3319, 3320, 3322, 3324, 3328, 3331, 3332, 3325, 3326, 3294, 3295, 3305, 3333, 3316, 3344, 3334, 3335, 3337, 3340, 3190
  ];

  bool _isPortainerSelected = true;

  List<int> get _activeList =>
      _isPortainerSelected ? _portainerList : _polivalenteList;

  int get _personasPorFila => _isPortainerSelected ? 3 : 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/2.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: TextField(
                        controller: _codeController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          label: Text("Código",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: TextField(
                        controller: _doorController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          showResult();
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          label: Text("Puerta",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                // Switch para seleccionar entre listas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Polivalente",
                        style: TextStyle(color: Colors.white)),
                    Switch(
                      value: _isPortainerSelected,
                      onChanged: (value) {
                        setState(() {
                          _isPortainerSelected = value;
                        });
                      },
                    ),
                    const Text("Portainer",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: TextButton(
                      onPressed: () {
                        showResult();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(150, 50),
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Calcular",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showResult() {
    String resultado;
    final list = _activeList;

    if (_codeController.text.isNotEmpty && _doorController.text.isNotEmpty) {
      int? code = int.tryParse(_codeController.text);
      int? door = int.tryParse(_doorController.text);

      if (code == null || door == null) {
        resultado = "Códigos inválidos";
      } else {
        var puertaIndex = list.indexOf(door);
        var codigoIndex = list.indexOf(code);

        if (list.contains(code) && list.contains(door)) {
          int diferencia = codigoIndex - puertaIndex;
          if (diferencia < 0) {
            int restantes = list.length - (puertaIndex - codigoIndex);
            resultado =
            "Quedan $restantes personas - ${((restantes / _personasPorFila * (_isPortainerSelected ? 2 : 1))).ceil()} ${_isPortainerSelected ? "manos" : "filas"}";
          } else {
            resultado =
            "Quedan $diferencia personas - ${((diferencia / _personasPorFila * (_isPortainerSelected ? 2 : 1))).ceil()} ${_isPortainerSelected ? "manos" : "filas"}";
          }
        } else if (!list.contains(code) && list.contains(door)) {
          resultado = "No existe el código";
        } else if (list.contains(code) && !list.contains(door)) {
          resultado = "No existe el código puerta";
        } else {
          resultado = "No existen los códigos introducidos";
        }
      }
    } else {
      resultado = "Rellene los campos";
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(resultado, textAlign: TextAlign.center),
    ));
  }
}

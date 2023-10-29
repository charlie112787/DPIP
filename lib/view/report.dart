import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  static Map<String, dynamic> data = {};

  @override
  _ReportPage createState() => _ReportPage();
}

var data;

class _ReportPage extends State<ReportPage> {

  @override
  void initState() {
    data = ReportPage.data;
    print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "地震報告",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 450,
                  child: FlutterMap(
                    // key: ValueKey(_page),
                    // mapController: mapController,
                    options: MapOptions(
                      center: const LatLng(23.4, 120.1),
                      zoom: 7,
                      minZoom: 7,
                      maxZoom: 9,
                      interactiveFlags:
                          InteractiveFlag.all - InteractiveFlag.rotate,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/whes1015/clne7f5m500jd01re1psi1cd2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoid2hlczEwMTUiLCJhIjoiY2xuZTRhbmhxMGIzczJtazN5Mzg0M2JscCJ9.BHkuZTYbP7Bg1U9SfLE-Cg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.2,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(overscroll: false),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "顯著有感地震",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                Text(
                                  "${data["earthquakeNo"].toStringAsFixed(0)}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFF4C31C)),
                                ),
                                Text(
                                  "最大震度",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFBABABA)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff333439),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "發生時間: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          data["originTime"].toString().substring(0, 16),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "震央位置: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          data["location"]
                                            .substring(data["location"].indexOf("(") + 1,
                                                data["location"].indexOf(")"))
                                            .replaceAll("位於", ""),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "規模: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "M ${data["magnitudeValue"].toStringAsFixed(1)}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "深度: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${data["depth"].toStringAsFixed(1)} KM",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

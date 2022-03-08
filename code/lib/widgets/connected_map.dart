import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:syncfusion_flutter_maps/maps.dart';

class ConnectedMap extends StatefulWidget {
  // You can also pass the translation in here if you want to
  ConnectedMap({Key key}) : super(key: key);
  @override
  _ConnectedMapState createState() => _ConnectedMapState();
}

class _ConnectedMapState extends State<ConnectedMap> {
  MapShapeSource _dataSource;

  var stateData = <_StateDets>[
    _StateDets("New York", 1, "RIT"),
  ];

  @override
  void initState() {
    _dataSource = MapShapeSource.asset(
      'text/us2.json',
      shapeDataField: 'NAME',
      dataCount: stateData.length,
      primaryValueMapper: (int index) => stateData[index].state,
      shapeColorValueMapper: (int index) => stateData[index].count,
      shapeColorMappers: <MapColorMapper>[
        const MapColorMapper(
            from: 0, to: 1, color: Color.fromRGBO(144, 202, 249, 1), text: '1'),
        const MapColorMapper(
            from: 1, to: 3, color: Color.fromRGBO(66, 165, 245, 1), text: '2'),
        const MapColorMapper(
            from: 1, to: 3, color: Color.fromRGBO(21, 101, 192, 1), text: '3'),
        const MapColorMapper(
            from: 4,
            to: 1000,
            color: Color.fromRGBO(13, 71, 161, 1),
            text: '4+'),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SfMaps(
          layers: [
            MapShapeLayer(
              loadingBuilder: (BuildContext context) {
                return const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                );
              },
              source: _dataSource,
              legend: MapLegend.bar(MapElement.shape,
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              shapeTooltipBuilder: (BuildContext context, int index) {
                return Container(
                  width: (50.0 + stateData[index].count * 50),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Text(
                              stateData[index].state,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          const Icon(
                            FontAwesomeIcons.building,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 10,
                        thickness: 1.2,
                      ),
                      Text(
                        stateData[index].dets,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
              tooltipSettings: const MapTooltipSettings(
                  color: Colors.blue,
                  strokeColor: Color.fromRGBO(252, 187, 15, 1),
                  strokeWidth: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _StateDets {
  _StateDets(this.state, this.count, this.dets);

  final String state;
  final int count;
  final String dets;
}

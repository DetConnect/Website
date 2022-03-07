import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    _StateDets("New York", 2),
    _StateDets("Virginia", 1),
    _StateDets("West Virginia", 3),
    _StateDets("Pennsylvania", 1),
    _StateDets("Maryland", 5),
  ];

  @override
  void initState() {
    _dataSource = MapShapeSource.asset(
      'text/us2.json',
      shapeDataField: 'NAME',
      dataCount: stateData.length,
      primaryValueMapper: (int index) => stateData[index].state,
      shapeColorValueMapper: (int index) => stateData[index].dets,
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
            ),
          ],
        ),
      ),
    );
  }
}

class _StateDets {
  _StateDets(this.state, this.dets);

  final String state;
  final int dets;
}

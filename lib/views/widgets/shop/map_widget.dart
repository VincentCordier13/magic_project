import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  var _zoom = 13.0;
  var _center = LatLng(45.51, -73.59);
  var _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    print("mapController -> zoom = " + _zoom.toString() + " center = " + _center.toString());
    return Stack(
      children: [ 
        Container(
          margin: const EdgeInsets.all(10),
          height: 500, 
          color: Colors.amber,
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              onPositionChanged: (position, _) {
                  _center = position.center;
              },
              center: _center,
              zoom: _zoom,
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 50.0,
                    height: 50.0,
                    point: new LatLng(45.504555, -73.565270),
                    builder: (context) => Image.asset("assets/map-marker.png"),
                  ),
                  new Marker(
                    width: 50.0,
                    height: 50.0,
                    point: new LatLng(45.514180, -73.573146),
                    builder: (context) => Image.asset("assets/map-marker.png"),
                  ),
                  new Marker(
                    width: 50.0,
                    height: 50.0,
                    point: new LatLng(45.522564, -73.579770),
                    builder: (context) => Image.asset("assets/map-marker.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Image.asset("assets/zoom-out.png"),
                onTap: () {
                  setState(() {
                    _zoom > 4.0 ? _zoom -= .5 : null;
                    _mapController.move(_center, _zoom);
                  });
                },
              ),
              SizedBox(width: 20,),
              GestureDetector(
                child: Image.asset("assets/zoom-in.png"),
                onTap: () {
                  setState(() {
                    _zoom < 18.0 ? _zoom += .5 : null;
                    _mapController.move(_center, _zoom);
                  });
                },
              )
            ]
          ),
        )
      ]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ShopMapWidget extends StatefulWidget {
  @override
  _ShopMapWidgetState createState() => _ShopMapWidgetState();
}

class _ShopMapWidgetState extends State<ShopMapWidget> {
  var _zoom = 13.0;
  var _center = LatLng(45.51, -73.59);
  var _mapController = MapController();

  var _markers = List<Marker>();
  var _markerIsSelected = false; 

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShopsViewModel>.reactive(
      viewModelBuilder: () => locator<ShopsViewModel>(),
      disposeViewModel: false,
      builder: (context, viewmodel, child) {

        viewmodel.shops.forEach((shop) { 
          _markers.add(
            new Marker(
              width: 50.0,
              height: 50.0,
              point: shop.latlng,
              builder: (context) => GestureDetector(
                child: Image.asset("assets/map-marker.png"),
                onTap: () {
                  print(shop.id);
                  viewmodel.shopSelection(shop);
                  setState(() {
                    _markerIsSelected = true;
                  });
                },
              ),
            )
          );
        });        

        return Container(
          margin: const EdgeInsets.all(10),
          height: 500,
          child: Stack(
            children: [ 

              Container(
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
                      markers: _markers,
                    ),
                  ],
                ),
              ),

              _markerIsSelected ? Container(
                margin: const EdgeInsets.all(50),
                alignment: Alignment.centerRight,
                child: Card(
                  color: Colors.transparent,
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 300,
                    width: 200,
                    color: Color(0xA04B0082),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Image.asset(viewmodel.shopSelected.photo)),
                            Text(viewmodel.shopSelected.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            Text(viewmodel.shopSelected.address, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                          ]
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 15, width: 15,
                            child: GestureDetector(
                              child: Image.asset("assets/close-cross.png"),
                              onTap: () {
                                print("close");
                                setState(() {
                                  _markerIsSelected = false;
                                });
                              },
                            )
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ) : Container(),
              
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
                          _zoom = _zoom > 4.0 ? _zoom - .5 : _zoom;
                          _mapController.move(_center, _zoom);
                        });
                      },
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      child: Image.asset("assets/zoom-in.png"),
                      onTap: () {
                        setState(() {
                          _zoom = _zoom < 18.0 ? _zoom + .5 : _zoom;
                          _mapController.move(_center, _zoom);
                        });
                      },
                    )
                  ]
                ),
              ),

            ]
          ),
        );
      }
    );
  }
}


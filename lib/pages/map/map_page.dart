import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
// import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(11.598760, 37.372890),
          zoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/oli-mac/clinhtu1u002701qy77wc4g7q/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xpLW1hYyIsImEiOiJjbDMzNHllZW8wNG52M2Nxc2pkajVtaHphIn0.DM-n34-7ehU8aKuCX-JSdw',
            // userAgentPackageName: 'com.example.app',
            additionalOptions: {
              "accessToken":"pk.eyJ1Ijoib2xpLW1hYyIsImEiOiJjbDMzNHllZW8wNG52M2Nxc2pkajVtaHphIn0.DM-n34-7ehU8aKuCX-JSdw",
              "id":"mapbox.satellite"
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                  point: latLng.LatLng(11.596856, 37.396170),
                  builder: (context)=>
                  Container(
                    child: IconButton(onPressed: () {  },
                      icon: Icon(
                          Icons.push_pin,
                          size: 50, // Set the size of the icon
                          color: Colors.red
                      ),),
                  )
              )
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                  width: 80,
                  height: 80,
                  point: latLng.LatLng(11.594596, 37.303098),
                  builder: (context)=>
                      Container(
                        child: IconButton(onPressed: () {  },
                          icon: Icon(
                              Icons.push_pin,
                              size: 50, // Set the size of the icon
                              color: Colors.red
                          ),),
                      )
              )
            ],
          )
        ],
      )
    );
  }
}

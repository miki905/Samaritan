import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_directions/src/latlng.dart'hide LatLng;
import 'package:flutter_map_directions/src/latlng.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:page_transition/page_transition.dart';
import 'package:project_samaritan/services/directions_service.dart';
import 'package:project_samaritan/services/get_catagory.dart';

import '../medicine_Description.dart';

class MapPage extends StatefulWidget {
  final Map<String, dynamic> locationResult;
  final String medName;

  const MapPage({Key? key, required this.locationResult, required this.medName})
      : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mapController = MapController();
  late double latitude;
  late double longitude;
  bool showDirections = false;
  List<latLng.LatLng> polylinePoints = [];
  DirectionsService directionsService = DirectionsService();

  @override
  void initState() {
    super.initState();
    latitude = double.parse((widget.locationResult["users_locations"][0]
    as Map<String, dynamic>)['latitude']);
    longitude = double.parse((widget.locationResult["users_locations"][0]
    as Map<String, dynamic>)['longitude']);
  }

  void traceRoute() async {
    // Obtain the current position
    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Use the current position as the origin
    latLng.LatLng origin = latLng.LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );
     // Set your desired origin coordinates here
    latLng.LatLng destination = latLng.LatLng(latitude, longitude); // Use the location coordinates obtained from the API

    DirectionsData directionsData =
    await directionsService.getDirections(origin, destination);

    setState(() {
      polylinePoints = directionsData.routeCoordinates.cast<latLng.LatLng>();
      showDirections = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(CategoryService.price_query),
        variables: {
          "id": widget.locationResult["id"],
          "medName": widget.medName,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text('Error occurred: ${result.exception.toString()}');
        }
        if (result.isLoading) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        final data = result.data;
        if (data == null || data['medicine'] == null) {
          return Text('No data available');
        }
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                title: Text('Nearby pharmacy'),
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 20,
                ),
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              body: FlutterMap(
                options: MapOptions(

                  center: latLng.LatLng(latitude, longitude),
                  zoom: 18,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    'https://api.mapbox.com/styles/v1/oli-mac/clinhtu1u002701qy77wc4g7q/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xpLW1hYyIsImEiOiJjbDMzNHllZW8wNG52M2Nxc2pkajVtaHphIn0.DM-n34-7ehU8aKuCX-JSdw',
                    additionalOptions: {
                      "accessToken":
                      "pk.eyJ1Ijoib2xpLW1hYyIsImEiOiJjbDMzNHllZW8wNG52M2Nxc2pkajVtaHphIn0.DM-n34-7ehU8aKuCX-JSdw",
                      "id": "mapbox.satellite"
                    },
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 50,
                        height: 50,
                        point: latLng.LatLng(latitude, longitude),
                        builder: (context) => Container(
                          child: SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  if (showDirections)
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: polylinePoints
                              .map((point) => latLng.LatLng(
                              point.latitude, point.longitude))
                              .toList(),
                          color: Colors.blue,
                          strokeWidth: 10.0,
                        ),
                      ],
                    ),



                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 0,
                      left: 12,
                      right: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            size: 40,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8,
                            ),
                            child: Text(
                              widget.locationResult["pharmacy_name"],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            widget.medName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(
                              top: 14.0,
                              bottom: 8,
                            ),
                            child: Text(
                              "${result.data!["medicine"][0]["price"].toString()} ETB",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Handle onTap event
                          },
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(45),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    onPressed: () async {
                                      traceRoute();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Directions',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(45),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    onPressed: () async {
                                      Navigator.of(context).push(
                                        PageTransition(
                                          child: MedicineDescription(
                                            medName: widget.medName,
                                          ),
                                          type: PageTransitionType.fade,
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

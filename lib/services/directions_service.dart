import 'package:flutter_map_directions/flutter_map_directions.dart'hide LatLng;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:http/http.dart' as http;
import 'dart:convert';

class DirectionsService {
  static const String baseURL = 'https://api.mapbox.com/directions/v5/mapbox/driving'; // Adjust the profile according to your needs
  static const String accessToken = 'pk.eyJ1Ijoib2xpLW1hYyIsImEiOiJjbDMzNHllZW8wNG52M2Nxc2pkajVtaHphIn0.DM-n34-7ehU8aKuCX-JSdw';

  Future<DirectionsData> getDirections(latLng.LatLng origin, latLng.LatLng destination) async {
    Uri uri = Uri.parse('$baseURL/${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}?access_token=$accessToken');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');

      try {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Extract distance and duration from the directions data
        double distance = data['routes'][0]['distance'];
        double duration = data['routes'][0]['duration'];

        // Decode the polyline string into coordinates
        String encodedPolyline = data['routes'][0]['geometry'];
        List<latLng.LatLng> polylinePoints = PolylinePoints().decodePolyline(encodedPolyline)
            .map((PointLatLng point) => latLng.LatLng(point.latitude, point.longitude))
            .toList();

        // Process the directions data as per your requirement
        DirectionsData directionsData = DirectionsData(
          distance: distance,
          duration: duration,
          routeCoordinates: polylinePoints,
        );

        // Return the directions data or perform any other desired action
        return directionsData;
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse directions response');
      }
    } else {
      throw Exception('Failed to get directions. Status code: ${response.statusCode}');
    }
  }




}

class DirectionsData {
  final double distance;
  final double duration;
  final List<latLng.LatLng> routeCoordinates;

  DirectionsData({required this.distance, required this.duration, required this.routeCoordinates});
}

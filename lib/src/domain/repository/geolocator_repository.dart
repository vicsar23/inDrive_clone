import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GeolocatorRepository {
  Future<Position> findPosition();
  Future<BitmapDescriptor> createMarkerFromAsset(String path);
  Marker getMarker(
    String markerId,
    double lat,
    double lng,
    String title,
    String content,
    BitmapDescriptor imageMarker,
  );
}

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart';

class GetMarkerUseCase {
  GeolocatorRepository geolocatorRepository;

  GetMarkerUseCase(this.geolocatorRepository);

  run(String markerId, double lat, double lng, String title, String content,
          BitmapDescriptor imageMarker) =>
      geolocatorRepository.getMarker(
          markerId, lat, lng, title, content, imageMarker);
}

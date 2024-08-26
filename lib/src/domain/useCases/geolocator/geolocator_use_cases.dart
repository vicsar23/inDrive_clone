import 'package:indrive_clone/src/domain/useCases/geolocator/create_marker_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/find_position_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/get_marker_use_case.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  GetMarkerUseCase getMarker;
  CreateMarkerUseCase createMarker;

  GeolocatorUseCases(
      {required this.findPosition,
      required this.getMarker,
      required this.createMarker});
}

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart';

class GeolocatorRepositoryImpl implements GeolocatorRepository {
  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (kDebugMode) {
        print('La ubicación no está activa.');
      }
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (kDebugMode) {
          print('No se ha concedido el permiso de ubicación.');
        }
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (kDebugMode) {
        print('Permisos de ubicación permanentes denegados. No podemos solicitar');
      }
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}

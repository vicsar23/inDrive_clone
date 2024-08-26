import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indrive_clone/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_state.dart';

class ClientMapSeekerBloc
    extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    on<ClienteMapSeekerInitEvent>((event, emit) {
      emit(state.copyWith(controller: controller));
    });
    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();

      //emit(state.copyWith(position: position, controller: controller));
      if (kDebugMode) {
        print('Position latitude: ${position.latitude}');
        print('Position longitude: ${position.longitude}');
      }
      add(ChangeCameraPosition(
          lat: position.latitude, lng: position.longitude));

      // BitmapDescriptor imageMarker = await geolocatorUseCases.createMarker
      //     .run('assets/img/location_blue.png');
      // Marker marker = geolocatorUseCases.getMarker.run(
      //     'MyLocation',
      //     position.latitude,
      //     position.longitude,
      //     'Mi posición',
      //     '',
      //     imageMarker);

      emit(state.copyWith(
          position: position,
        // markers: {marker.markerId: marker},
          controller: controller));
    });

    on<ChangeCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await  googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0)));
    });

    on<OnAutoCompletedPickUpSelected>((event, emit) {
      print("lat: ${event.lat}");
      print("lng: ${event.lng}");
    });

    on<OnAutoCompletedDestinationSelected>((event, emit) {
      print("lat: ${event.lat}");
      print("lng: ${event.lng}");
    });
  }
}

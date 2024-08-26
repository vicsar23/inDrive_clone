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
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<ClienteMapSeekerInitEvent>((event, emit) {
      emit(state.copyWith(controller: controller));
    });
    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();

      emit(state.copyWith(position: position, controller: controller));
      if (kDebugMode) {
        print('Position latitude: ${position.latitude}');
        print('Position longitude: ${position.longitude}');
      }
      add(ChangeCameraPosition(
          lat: state.position!.latitude, lng: state.position!.longitude));
    });

    on<ChangeCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0)));
    });
  }
}

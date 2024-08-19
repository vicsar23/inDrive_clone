import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indrive_clone/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/mapSeeker/bloc/client_map_seeker_state.dart';

class ClientMapSeekerBloc
    extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();

      emit(state.copyWith(position: position));
      if (kDebugMode) {
        print('Position latitude: ${position.latitude}');
        print('Position longitude: ${position.longitude}');
      }
    });
  }
}

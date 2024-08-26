import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapSeekerState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Map<MarkerId, Marker> markers;
  final Position? position;

  const ClientMapSeekerState(
      {this.position,
      this.controller,
      this.markers = const <MarkerId, Marker>{}});

  ClientMapSeekerState copyWith(
      {Position? position,
      Completer<GoogleMapController>? controller,
      Map<MarkerId, Marker>? markers}) {
    return ClientMapSeekerState(
        markers: markers ?? this.markers,
        position: position ?? this.position,
        controller: controller);
  }

  @override
  List<Object?> get props => [position];
}

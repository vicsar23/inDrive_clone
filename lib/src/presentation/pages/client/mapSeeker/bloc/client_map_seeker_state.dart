import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class ClientMapSeekerState extends Equatable {
  final Position? position;

  const ClientMapSeekerState({this.position});

  ClientMapSeekerState copyWith({Position? position}) {
    return ClientMapSeekerState(position: position?? position);
  }
  @override
  List<Object?> get props => [position];
}

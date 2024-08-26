abstract class ClientMapSeekerEvent {}

class ClienteMapSeekerInitEvent extends ClientMapSeekerEvent {}

class FindPosition extends ClientMapSeekerEvent {}

class ChangeCameraPosition extends ClientMapSeekerEvent {
  final double lat;
  final double lng;

  ChangeCameraPosition({
    required this.lat,
    required this.lng,
  });
}

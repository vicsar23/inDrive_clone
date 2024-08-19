import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart';

class FindPositionUseCase {
  GeolocatorRepository geolocatorRepository;

  FindPositionUseCase(this.geolocatorRepository);

  run()=> geolocatorRepository.findPosition();
}
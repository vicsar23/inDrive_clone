import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart';

class CreateMarkerUseCase {
  GeolocatorRepository geolocatorRepository;

  CreateMarkerUseCase(this.geolocatorRepository);

  run(String path) => geolocatorRepository.createMarkerFromAsset(path);
}

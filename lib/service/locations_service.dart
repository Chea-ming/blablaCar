import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/location_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static LocationsService? _instance;

  final LocationsRepository repository;

  LocationsService._internal(this.repository);
  
  List<Location> getLocations() {
    return repository.getLocations();
  }

  static void initialize(LocationsRepository repository) {
    _instance ??= LocationsService._internal(repository);
  }

  static LocationsService get instance {
    if (_instance == null) {
      throw Exception(
          "You should initialize your service first. Please call the initialize");
    }
    return _instance!;
  }
}

import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_repository.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  static RidesService? _instance;

  final RidesRepositories repository;

  RidesService._internal(this.repository);

  static void initialize(RidesRepositories repository) {
    _instance ??= RidesService._internal(repository);
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "You should initialize your service first. Please call the initialize");
    }
    return _instance!;
  }

  List<Ride> getRides (RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }
 
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
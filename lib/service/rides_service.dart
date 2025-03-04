import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  static final RidesService _instance = RidesService._internal();

  late List<Ride> _ridesRepository;

  RidesService._internal();

  factory RidesService() {
    return _instance;
  }

  static void initialize(List<Ride> ridesRepository) {
    _instance._ridesRepository = ridesRepository;
  }

  List<Ride> getRides(RidePreference preferences, RidesFilter? filter) {
    var filteredRides = _ridesRepository.where((ride) =>
        ride.departureLocation == preferences.departure &&
        ride.arrivalLocation == preferences.arrival);

    if (filter != null && filter.acceptPets) {
      filteredRides = filteredRides.where((ride) => ride.acceptsPets);
    }

    return filteredRides.toList();
    
  }
 
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
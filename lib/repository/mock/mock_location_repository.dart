import '../location_repository.dart';
import '../../model/ride/locations.dart';

class MockLocationsRepository extends LocationsRepository {

  final Location l1 = Location(name: "PhnomPenh", country: Country.cam);
  final Location l2 = Location(name: "SiemReap", country: Country.cam);
  final Location l3 = Location(name: "Sihanoukville", country: Country.cam);
  final Location l4 = Location(name: "Kampot", country: Country.cam);
  final Location l5 = Location(name: "Kep", country: Country.cam);
  final Location l6 = Location(name: "Battambang", country: Country.cam);
  final Location l7 = Location(name: "KohKong", country: Country.cam);
  final Location l8 = Location(name: "KampongCham", country: Country.cam);
  final Location l9 = Location(name: "KampongThom", country: Country.cam); 

  late final List<Location> _locations;

  MockLocationsRepository() {
    _locations = [l1, l2, l3, l4, l5, l6, l7, l8, l9];
  }
  
  @override
  List<Location> getLocations() {
    return _locations;
  }
}
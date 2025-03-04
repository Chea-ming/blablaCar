import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/model/user/user.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import '../ride_repository.dart';

class MockRideRepository extends RidesRepositories {
  DateTime now = DateTime.now();
  late Ride r1, r2, r3, r4, r5;

  MockRideRepository() {
    r1 = Ride(
      departureLocation: Location(name: "Battambang", country: Country.cam),
      arrivalLocation: Location(name: "SiemReap", country: Country.cam),
      departureDate: DateTime(now.year, now.month, now.day, 17, 30),
      arrivalDateTime: DateTime(now.year, now.month, now.day, 19, 30),
      driver: User(firstName: 'Kannika', lastName: '', email: 'example@gmail.com', phone: '0123456789', profilePicture: '', verifiedProfile: true),
      availableSeats: 2,
      pricePerSeat: 5.0,
      filter: RidesFilter(acceptPets: false),
    );
    
    r2 = Ride(
      departureLocation: Location(name: "Battambang", country: Country.cam),
      arrivalLocation: Location(name: "SiemReap", country: Country.cam),
      departureDate: DateTime(now.year, now.month, now.day, 20, 0),
      arrivalDateTime: DateTime(now.year, now.month, now.day, 22, 0),
      driver: User(firstName: 'Chaylim', lastName: '', email: 'example@gmail.com', phone: '0123456789', profilePicture: '', verifiedProfile: true),
      availableSeats: 0,
      pricePerSeat: 5.0,
      filter: RidesFilter(acceptPets: false),
    );

    r3 = Ride(
      departureLocation: Location(name: "Battambang", country: Country.cam),
      arrivalLocation: Location(name: "SiemReap", country: Country.cam),
      departureDate: DateTime(now.year, now.month, now.day, 5, 0),
      arrivalDateTime: DateTime(now.year, now.month, now.day, 8, 0),
      driver: User(
          firstName: 'MengTech',
          lastName: '',
          email: 'example@gmail.com',
          phone: '0123456789',
          profilePicture: '',
          verifiedProfile: true),
      availableSeats: 1,
      pricePerSeat: 5.0,
      filter: RidesFilter(acceptPets: false),
    );

    r4 = Ride(
      departureLocation: Location(name: "Battambang", country: Country.cam),
      arrivalLocation: Location(name: "SiemReap", country: Country.cam),
      departureDate: DateTime(now.year, now.month, now.day, 20, 0),
      arrivalDateTime: DateTime(now.year, now.month, now.day, 22, 0),
      driver: User(
          firstName: 'Limhao',
          lastName: '',
          email: 'example@gmail.com',
          phone: '0123456789',
          profilePicture: '',
          verifiedProfile: true),
      availableSeats: 0,
      pricePerSeat: 5.0,
      filter: RidesFilter(acceptPets: true),
    );

    r2 = Ride(
      departureLocation: Location(name: "Battambang", country: Country.cam),
      arrivalLocation: Location(name: "SiemReap", country: Country.cam),
      departureDate: DateTime(now.year, now.month, now.day, 5, 0),
      arrivalDateTime: DateTime(now.year, now.month, now.day, 8, 0),
      driver: User(
          firstName: 'Sovanda',
          lastName: '',
          email: 'example@gmail.com',
          phone: '0123456789',
          profilePicture: '',
          verifiedProfile: true),
      availableSeats: 0,
      pricePerSeat: 5.0,
      filter: RidesFilter(acceptPets: false),
    );
    

  }
  
  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return [r1, r2, r3, r4, r5];
  }
}
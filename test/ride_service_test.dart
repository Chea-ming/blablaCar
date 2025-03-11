import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/mock/mock_ride_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:intl/intl.dart';

void main() {
  group('RidesService Tests', () {
    RidesService.initialize(MockRideRepository());
    final ridesService = RidesService.instance;
    DateTime now = DateTime.now();

    test('T1: Create a ride preference - from Battambang - to SiemReap - today - 1 passenger', () async {
      // Arrange
      final ridePreference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cam),
        arrival: Location(name: 'SiemReap', country: Country.cam),
        departureDate: DateTime(now.year, now.month, now.day, 0, 0),
        requestedSeats: 1,
      );

      // Act
      final results = ridesService.getRides(ridePreference, null);

      // Assert
      expect(results.length, 4);

      print('T1: Create a ride preference - from Battambang - to SiemReap - today - 1 passenger');
      for (var element in results) {
        print('Ride: ${element.departureLocation.name} - ${element.arrivalLocation.name} - ${DateFormat('HH:mm').format(element.departureDate)} - ${DateFormat('HH:mm').format(element.arrivalDateTime)} - ${element.driver.firstName}');
      }
    });

    test('T2: Create a ride preference - from Battambang - to SiemReap - today - 1 passenger - Pet Allowed', () async {
      // Arrange
      final ridePreference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cam),
        arrival: Location(name: 'SiemReap', country: Country.cam),
        departureDate: DateTime(now.year, now.month, now.day, 0, 0),
        requestedSeats: 1,
      );

      RidesFilter rideFilter = RidesFilter(acceptPets: true);

      // Act
      final results = ridesService.getRides(ridePreference, rideFilter);

      // Assert
      expect(results.length, 1);

      print('T2: Create a ride preference - from Battambang - to SiemReap - today - 1 passenger - Pet Allowed');
      for (var element in results) {
        print('Ride: ${element.departureLocation.name} - ${element.arrivalLocation.name} - ${DateFormat('HH:mm').format(element.departureDate)} - ${DateFormat('HH:mm').format(element.arrivalDateTime)} - ${element.driver.firstName}');
      }
    });

    
  });
}




import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/console_logger.dart';
import 'package:week_3_blabla_project/repository/mock/mock_ride_preferences_repository.dart';
import 'package:week_3_blabla_project/service/ride_prefs_service.dart';

void main() {

  RidePrefService.initialize(MockRidePreferencesRepository());

  ConsoleLogger consoleLogger = ConsoleLogger();
  RidePrefService.instance.addListener(consoleLogger);

  RidePrefService.instance.onRidePreferenceSelcted(
    RidePreference(
    departure: Location(name: 'TK', country: Country.cam),
    arrival: Location(name: 'BKK', country: Country.cam),
    departureDate: DateTime.now(),
    requestedSeats: 2,
    ));
  
  RidePrefService.instance.setCurrentPreference(RidePreference(
    departure: Location(name: 'TK', country: Country.cam),
    arrival: Location(name: 'BKK', country: Country.cam),
    departureDate: DateTime.now(),
    requestedSeats: 2,
  ));

  RidePrefService.instance.notifyListeners();
  
  test('ConsoleLogger should print the selected preference', () {
    expect(consoleLogger, isNotNull);
  });
}
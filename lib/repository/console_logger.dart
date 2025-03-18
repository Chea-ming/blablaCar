import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_preference_listener.dart';

class ConsoleLogger implements RidePreferenceListener{
  @override
  void onRidePreferenceSelcted(RidePreference selectedPreference) {
    print('Selected preference - Console Logger: $selectedPreference');
  }

}
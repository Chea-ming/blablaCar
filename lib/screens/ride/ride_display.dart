import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

class RideDisplayScreen extends StatelessWidget { 
  final RidePref preference;

  const RideDisplayScreen({super.key, required this.preference});

  @override
  Widget build(BuildContext context) {
    List<Ride> filteredRides = fakeRidesSample.where((ride) {
      return ride.departure == preference.departure &&
          ride.arrival == preference.arrival &&
          ride.departureDate.isAfter(preference.departureDate) &&
          ride.availableSeats >= preference.requestedSeats;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Rides Display'),
      ),
      body: ListView.builder(
        itemCount: filteredRides.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${filteredRides[index].departure} to ${filteredRides[index].arrival}'),
            subtitle: Text('Time: ${filteredRides[index].departureDate} - Seats: ${filteredRides[index].availableSeats}'),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'theme/theme.dart';
import 'model/ride/ride.dart';
import 'dummy_data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RidesScreen(),
    );
  }
}

/// This screen displays the available rides

class RidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Ride> rides = fakeRides;

    return Scaffold(
      appBar: AppBar(
        title: Text('Available Rides'),
      ),
      body: ListView.builder(
        itemCount: rides.length,
        itemBuilder: (context, index) {
          final ride = rides[index];
          return ListTile(
            title: Text(
                'From ${ride.departureLocation.name} to ${ride.arrivalLocation.name}'),
            subtitle: Text('Driver: ${ride.driver.firstName}\n'
                'Departure: ${ride.departureDate}\n'
                'Price: €${ride.pricePerSeat}'),
            trailing: Text('${ride.availableSeats} seats available'),
          );
        },
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/ride_pref_input_tile.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import 'package:week_3_blabla_project/widgets/actions/blabutton.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_date_picker.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_seat_spinner.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/inputs/bla_location_picker.dart';
 

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  final _formKey = GlobalKey<FormState>();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now(); // Default to today
    arrival = widget.initRidePref?.arrival; 
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1; // Default to 1 seat
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  
  void onDeparturePressed() async {
    // 1- Select a location
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute<Location>(
          BlaLocationPicker()),
    );

    // 2- Update the from if needed
    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  void onArrivalPressed() async {
    // 1- Select a location
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute<Location>(BlaLocationPicker()),
    );

    // 2- Update the from if needed
    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  void onDatePressed() async {
    // 1- Select a date
    DateTime? selectedDate = await Navigator.of(context).push<DateTime>(
        MaterialPageRoute(builder: (ctx) => DatePickerScreen()));

    // 2- Update the from if needed
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  }

  void onSeatsPressed() async {
    // 1- Select a number of seats
    int? selectedSeats = await Navigator.of(context).push<int>(
        MaterialPageRoute(builder: (ctx) => SeatCounterScreen()));

    // 2- Update the from if needed
    if (selectedSeats != null) {
      setState(() {
        requestedSeats = selectedSeats;
      });
    }
  }

  void onSubmit() {}

  void onSwappingLocationPressed() {
    setState(() {
      // We switch only if both departure and arrivate are defined
      if (departure != null && arrival != null) {
        Location temp = departure!;
        departure = Location.copy(arrival!);
        arrival = Location.copy(temp);
      }
    });
  }

  // ----------------------------------
  // Helper methods
  // ----------------------------------

  bool get switchVisible => arrival != null && departure != null;

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.m, vertical: BlaSpacings.s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // Departure
            RidePrefInputTile(
              title: departure?.name ?? "Leaving from",
              onTap: onDeparturePressed,
              leftIcon: Icons.circle_outlined,
              rightIcon: switchVisible ? Icons.swap_vert : null,
              onRightIconPressed: onSwappingLocationPressed,
              isSelcted: departure != null,
            ),
            BlaDivider(),

            // Arrival 
            RidePrefInputTile(
              title: arrival?.name ?? "Going to",
              onTap: onArrivalPressed,
              leftIcon: Icons.circle_outlined,
              isSelcted: arrival != null,
            ),
            BlaDivider(),

            // Date
            RidePrefInputTile(
              title: DateTimeUtils.formatDateTime(departureDate),
              onTap: onDatePressed,
              leftIcon: Icons.calendar_today,
              isSelcted: true,
            ),
            BlaDivider(),

            // Seats
            RidePrefInputTile(
              title: "$requestedSeats",
              onTap: onSeatsPressed,
              leftIcon: Icons.person,
              isSelcted: true,
            ),

            // Search button
            BlaButton(
              buttonType: ButtonType.primary,
              text: "Search",
              onPressed: onSubmit,
            ),

          ],
        ), 
      ),
    );
  }
}

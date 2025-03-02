import '../model/ride/locations.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../model/user/user.dart';
import 'dart:math';

final Random random = Random();

///
/// FACE DATA FOR TEST PURPOSE
///

// Fake Cities
const List<Location> fakeLocations = [
  // UK Cities
  Location(name: "London", country: Country.uk),
  Location(name: "Manchester", country: Country.uk),
  Location(name: "Birmingham", country: Country.uk),
  Location(name: "Liverpool", country: Country.uk),
  Location(name: "Leeds", country: Country.uk),
  Location(name: "Glasgow", country: Country.uk),
  Location(name: "Sheffield", country: Country.uk),
  Location(name: "Bristol", country: Country.uk),
  Location(name: "Edinburgh", country: Country.uk),
  Location(name: "Leicester", country: Country.uk),
  Location(name: "Coventry", country: Country.uk),
  Location(name: "Nottingham", country: Country.uk),
  Location(name: "Newcastle", country: Country.uk),
  Location(name: "Southampton", country: Country.uk),
  Location(name: "Portsmouth", country: Country.uk),
  Location(name: "Aberdeen", country: Country.uk),
  Location(name: "Swansea", country: Country.uk),
  Location(name: "Oxford", country: Country.uk),
  Location(name: "Cambridge", country: Country.uk),

  // France Cities
  Location(name: "Paris", country: Country.france),
  Location(name: "Lyon", country: Country.france),
  Location(name: "Marseille", country: Country.france),
  Location(name: "Toulouse", country: Country.france),
  Location(name: "Nice", country: Country.france),
  Location(name: "Nantes", country: Country.france),
  Location(name: "Strasbourg", country: Country.france),
  Location(name: "Montpellier", country: Country.france),
  Location(name: "Bordeaux", country: Country.france),
  Location(name: "Lille", country: Country.france),
  Location(name: "Rennes", country: Country.france),
  Location(name: "Reims", country: Country.france),
  Location(name: "Saint-Étienne", country: Country.france),
  Location(name: "Toulon", country: Country.france),
  Location(name: "Angers", country: Country.france),
  Location(name: "Grenoble", country: Country.france),
  Location(name: "Dijon", country: Country.france),
  Location(name: "Le Havre", country: Country.france),
  Location(name: "Brest", country: Country.france),
];

// Fake Streets

const List<Street> fakeStreets = [
  // Streets in UK Cities
  Street(name: "Baker Street", city: Location(name: "London", country: Country.uk)),
  Street(name: "Oxford Street", city: Location(name: "London", country: Country.uk)),
  Street(name: "Deansgate", city: Location(name: "Manchester", country: Country.uk)),
  Street(name: "Bold Street", city: Location(name: "Liverpool", country: Country.uk)),
  Street(name: "Broad Street", city: Location(name: "Birmingham", country: Country.uk)),
  Street(name: "Buchanan Street", city: Location(name: "Glasgow", country: Country.uk)),
  Street(name: "Ecclesall Road", city: Location(name: "Sheffield", country: Country.uk)),
  Street(name: "Park Street", city: Location(name: "Bristol", country: Country.uk)),
  Street(name: "Royal Mile", city: Location(name: "Edinburgh", country: Country.uk)),
  Street(name: "High Street", city: Location(name: "Oxford", country: Country.uk)),

  // Streets in France Cities
  Street(name: "Champs-Élysées", city: Location(name: "Paris", country: Country.france)),
  Street(name: "Rue de Rivoli", city: Location(name: "Paris", country: Country.france)),
  Street(name: "Rue Saint-Jean", city: Location(name: "Lyon", country: Country.france)),
  Street(name: "La Canebière", city: Location(name: "Marseille", country: Country.france)),
  Street(name: "Rue d'Alsace-Lorraine", city: Location(name: "Toulouse", country: Country.france)),
  Street(name: "Avenue Jean Médecin", city: Location(name: "Nice", country: Country.france)),
  Street(name: "Cours des 50 Otages", city: Location(name: "Nantes", country: Country.france)),
  Street(name: "Grand'Rue", city: Location(name: "Strasbourg", country: Country.france)),
  Street(name: "Rue Foch", city: Location(name: "Montpellier", country: Country.france)),
  Street(name: "Rue Sainte-Catherine", city: Location(name: "Bordeaux", country: Country.france)),
];

// Fake Ride Preferences
List<RidePref> fakeRidePrefs = [
  RidePref(
    departure: fakeLocations[0], // London
    departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
    arrival: fakeLocations[3], // Paris
    requestedSeats: 2,
  ),
  RidePref(
    departure: fakeLocations[1], // Manchester
    departureDate: DateTime.now().add(Duration(days: 7)), // Next week
    arrival: fakeLocations[4], // Lyon
    requestedSeats: 3,
  ),
  RidePref(
    departure: fakeLocations[2], // Birmingham
    departureDate: DateTime.now(), // Today
    arrival: fakeLocations[5], // Marseille
    requestedSeats: 1,
  ),
  RidePref(
    departure: fakeLocations[0], // London
    departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
    arrival: fakeLocations[3], // Paris
    requestedSeats: 2,
  ),
  RidePref(
    departure: fakeLocations[4], // Manchester
    departureDate: DateTime.now().add(Duration(days: 7)), // Next week
    arrival: fakeLocations[0], // Lyon
    requestedSeats: 3,
  ),
  RidePref(
    departure: fakeLocations[5], // Birmingham
    departureDate: DateTime.now(), // Today
    arrival: fakeLocations[1], // Marseille
    requestedSeats: 1,
  ),
];

// Fake  Users
List<User> fakeUsers = [
  User(
    firstName: "Alice",
    lastName: "Dupont",
    email: "alice.dupont@example.com",
    phone: "+33 612345678",
    profilePicture: "https://randomuser.me/api/portraits/women/1.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Bob",
    lastName: "Smith",
    email: "bob.smith@example.com",
    phone: "+44 789456123",
    profilePicture: "https://randomuser.me/api/portraits/men/2.jpg",
    verifiedProfile: false,
  ),
  User(
    firstName: "Charlie",
    lastName: "Martin",
    email: "charlie.martin@example.com",
    phone: "+33 674839201",
    profilePicture: "https://randomuser.me/api/portraits/men/3.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Diane",
    lastName: "Lemoine",
    email: "diane.lemoine@example.com",
    phone: "+44 741258963",
    profilePicture: "https://randomuser.me/api/portraits/women/4.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Ethan",
    lastName: "Brown",
    email: "ethan.brown@example.com",
    phone: "+44 785412369",
    profilePicture: "https://randomuser.me/api/portraits/men/5.jpg",
    verifiedProfile: false,
  ),
  User(
    firstName: "Fanny",
    lastName: "Durand",
    email: "fanny.durand@example.com",
    phone: "+33 675839201",
    profilePicture: "https://randomuser.me/api/portraits/women/6.jpg",
    verifiedProfile: true,
  ),
];

// Fake  Rides

List<Ride> fakeRides = List.generate(50, (index) {
  // Select random locations for departure & arrival (ensuring they are different)
  Location departureLocation =
      fakeLocations[random.nextInt(fakeLocations.length)];
  Location arrivalLocation;
  do {
    arrivalLocation = fakeLocations[random.nextInt(fakeLocations.length)];
  } while (departureLocation == arrivalLocation);

  // Select a random driver
  User driver = fakeUsers[random.nextInt(fakeUsers.length)];

  // Random ride details
  DateTime departureTime = DateTime.now()
      .add(Duration(days: random.nextInt(10), hours: random.nextInt(24)));
  DateTime arrivalTime = departureTime
      .add(Duration(hours: random.nextInt(5) + 2)); // Rides take 2-6 hours
  int availableSeats = random.nextInt(4) + 1; // Between 1 and 4 seats
  double pricePerSeat = (random.nextDouble() * 20 + 5)
      .roundToDouble(); // Price between 5€ and 25€

  return Ride(
    departureLocation: departureLocation,
    departureDate: departureTime,
    arrivalLocation: arrivalLocation,
    arrivalDateTime: arrivalTime,
    driver: driver,
    availableSeats: availableSeats,
    pricePerSeat: pricePerSeat,
  );
});


// Fake  Rides


List<Ride> fakeRidesSample =
[
  Ride(
    departureLocation: fakeLocations[0], // London
    departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
    arrivalLocation: fakeLocations[1], // Manchester
    arrivalDateTime: DateTime.now().add(Duration(days: 1, hours: 3)), // 3 hours ride
    driver: fakeUsers[0], // Alice
    availableSeats: 3,
    pricePerSeat: 15.0,
  ),
  Ride(
    departureLocation: fakeLocations[2], // Birmingham
    departureDate: DateTime.now().add(Duration(days: 2)), // In 2 days
    arrivalLocation: fakeLocations[3], // Liverpool
    arrivalDateTime: DateTime.now().add(Duration(days: 2, hours: 2)), // 2 hours ride
    driver: fakeUsers[1], // Bob
    availableSeats: 2,
    pricePerSeat: 10.0,
  ),
  Ride(
    departureLocation: fakeLocations[4], // Leeds
    departureDate: DateTime.now().add(Duration(days: 3)), // In 3 days
    arrivalLocation: fakeLocations[5], // Glasgow
    arrivalDateTime: DateTime.now().add(Duration(days: 3, hours: 4)), // 4 hours ride
    driver: fakeUsers[2], // Charlie
    availableSeats: 4,
    pricePerSeat: 20.0,
  ),
  Ride(
    departureLocation: fakeLocations[6], // Sheffield
    departureDate: DateTime.now().add(Duration(days: 4)), // In 4 days
    arrivalLocation: fakeLocations[7], // Bristol
    arrivalDateTime: DateTime.now().add(Duration(days: 4, hours: 5)), // 5 hours ride
    driver: fakeUsers[3], // Diane
    availableSeats: 1,
    pricePerSeat: 25.0,
  ),
  Ride(
    departureLocation: fakeLocations[8], // Edinburgh
    departureDate: DateTime.now().add(Duration(days: 5)), // In 5 days
    arrivalLocation: fakeLocations[9], // Leicester
    arrivalDateTime: DateTime.now().add(Duration(days: 5, hours: 3)), // 3 hours ride
    driver: fakeUsers[4], // Ethan
    availableSeats: 2,
    pricePerSeat: 12.0,
  ),
];
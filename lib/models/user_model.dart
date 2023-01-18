import 'package:calling_api/models/user_dob.dart';
import 'package:calling_api/models/user_location.dart';
import 'package:calling_api/models/user_name_model.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
  });

  factory User.fromMap(Map<String, dynamic> e){
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']
    );
    final date = e['dob']['date'];
    final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'].toString()
    );

    final coordinate = LocationCoordinate(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']
    );

    final street = LocationStreet(
        number: e['location']['street']['number'],
        name: e['location']['street']['name']
    );

    final timezone = LocationTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description']
    );

    final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        street: street,
        coordinates: coordinate,
        timezone: timezone
    );

    return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location
    );
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}


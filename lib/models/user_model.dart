class User {
  String age;
  String gender;
  String weight;
  String bloodType;
  String height;
  User({
    required this.age,
    required this.gender,
    required this.weight,
    required this.bloodType,
    required this.height,
  });
}

class EmergencyContact {
  String name;
  String phone;
  String email;
  EmergencyContact({
    required this.name,
    required this.phone,
    this.email = '',
  });
}

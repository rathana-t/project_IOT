// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  String parent;
  String phone;
  EmergencyContact({
    required this.parent,
    required this.phone,
  });
}

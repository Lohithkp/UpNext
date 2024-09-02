import 'dart:convert';

class Users {
  final String? id;
  final String fullName;
  final String email;
  final String mobileNumber;
  final String password;

  // Constructor
  Users({
    this.id,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
    };
  }

  // Convert a JSON map to a Users instance
  factory Users.fromJson(Map<String, dynamic> json, String id) {
    return Users(
      id: id,
      fullName: json['fullName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      password: json['password'],
    );
  }
}

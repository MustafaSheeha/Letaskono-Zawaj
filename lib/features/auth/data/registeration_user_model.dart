import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterationUserModel {
  String? gender;
  String? name;
  String? email;
  String? phone;
  String? password;

  RegisterationUserModel({
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory RegisterationUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return RegisterationUserModel(
      gender: data?['gender'] as String?,
      name: data?['name'] as String?,
      email: data?['email'] as String?,
      phone: data?['phone'] as String?,
      password: data?['password'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (gender != null) 'gender': gender,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (password != null) 'password': password,
      };
}

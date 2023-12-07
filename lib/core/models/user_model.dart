import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? gender;
  String? name;
  String? email;
  String? phone;
  String? password;
  bool? isCreateProfile;
  // General Info
  String? maritalStatus;
  String? currentResidenceCountry;
  String? currentResidenceCity;
  String? nationality;
  String? educationalDegree;
  String? job;
  // Personal Info
  String? age;
  String? height;
  String? weight;
  String? skinColor;
  // Religious Info
  String? prayerCommitment;
  String? quranMemorizing;
  // Marriage Info
  String? tellAboutYou;
  String? tellAboutPartner;

  UserModel({
    this.userId,
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.isCreateProfile,
    // General Info
    this.maritalStatus,
    this.currentResidenceCountry,
    this.currentResidenceCity,
    this.nationality,
    this.educationalDegree,
    this.job,
    // Personal Info
    this.age,
    this.height,
    this.weight,
    this.skinColor,
    // Religious Info
    this.prayerCommitment,
    this.quranMemorizing,
    // Marriage Info
    this.tellAboutYou,
    this.tellAboutPartner,
  });

  // Map<String, dynamic> toFirestore();
  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      userId: data?['userId'] as String?,
      gender: data?['gender'] as String?,
      name: data?['name'] as String?,
      email: data?['email'] as String?,
      phone: data?['phone'] as String?,
      password: data?['password'] as String?,
      isCreateProfile: data?['isCreateProfile'] as bool?,
      // General Info
      maritalStatus: data?['maritalStatus'] as String?,
      currentResidenceCountry: data?['currentResidenceCountry'] as String?,
      currentResidenceCity: data?['currentResidenceCity'] as String?,
      nationality: data?['nationality'] as String?,
      educationalDegree: data?['educationalDegree'] as String?,
      job: data?['job'] as String?,
      // Personal Info
      age: data?['age'] as String?,
      height: data?['height'] as String?,
      weight: data?['weight'] as String?,
      skinColor: data?['skinColor'] as String?,
      // Religious Info
      prayerCommitment: data?['prayerCommitment'] as String?,
      quranMemorizing: data?['quranMemorizing'] as String?,
      // Marriage Info
      tellAboutYou: data?['tellAboutYou'] as String?,
      tellAboutPartner: data?['tellAboutPartner'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (userId != null) 'userId': userId,
        if (gender != null) 'gender': gender,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (password != null) 'password': password,
        if (isCreateProfile != null) 'isCreateProfile': isCreateProfile,
        // General Info
        if (maritalStatus != null) 'maritalStatus': maritalStatus,
        if (currentResidenceCountry != null)
          'currentResidenceCountry': currentResidenceCountry,
        if (currentResidenceCity != null)
          'currentResidenceCity': currentResidenceCity,
        if (nationality != null) 'nationality': nationality,
        if (educationalDegree != null) 'educationalDegree': educationalDegree,
        if (job != null) 'job': job,
        // Personal Info
        if (age != null) 'age': age,
        if (height != null) 'height': height,
        if (weight != null) 'weight': weight,
        if (skinColor != null) 'skinColor': skinColor,
        // Religious Info
        if (prayerCommitment != null) 'prayerCommitment': prayerCommitment,
        if (quranMemorizing != null) 'quranMemorizing': quranMemorizing,
        // Marriage Info
        if (tellAboutYou != null) 'tellAboutYou': tellAboutYou,
        if (tellAboutPartner != null) 'tellAboutPartner': tellAboutPartner,
        // Parent Info
      };
}

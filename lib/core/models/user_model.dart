
abstract class UserModel {
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

  Map<String, dynamic> toFirestore();
}

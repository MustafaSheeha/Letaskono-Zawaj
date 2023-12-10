import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';

class CreateMaleProfileModel extends UserModel {
  // General Info

  // Religious Info
  String? faceStyle;

  // Identity Confirmation
  Image? idFrontSide;
  String? idFrontSideUrl;
  Image? idBackSide;
  String? idBackSideUrl;
  String? idNumber;

  CreateMaleProfileModel({
    super.userId,
    super.isCreateProfile,
    super.gender,
    super.name,
    super.email,
    super.phone,
    super.maritalStatus,
    super.currentResidenceCountry,
    super.currentResidenceCity,
    super.nationality,
    super.educationalDegree,
    super.job,
    // Personal Info
    super.age,
    super.height,
    super.weight,
    super.skinColor,
    // Religious Info
    super.prayerCommitment,
    this.faceStyle,
    super.quranMemorizing,
    // Marriage Info
    super.tellAboutYou,
    super.tellAboutPartner,
    // Identity Confirmation
    this.idFrontSide,
    this.idFrontSideUrl,
    this.idBackSide,
    this.idBackSideUrl,
    this.idNumber,
  });

  factory CreateMaleProfileModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CreateMaleProfileModel(
      // General Info
      userId: data?['userId'] as String?,
      gender: data?['gender'] as String?,
      name: data?['name'] as String?,
      email: data?['email'] as String?,
      phone: data?['phone'] as String?,
      isCreateProfile: data?['isCreateProfile'] as bool?,
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
      faceStyle: data?['faceStyle'] as String?,
      quranMemorizing: data?['quranMemorizing'] as String?,
      // Marriage Info
      tellAboutYou: data?['tellAboutYou'] as String?,
      tellAboutPartner: data?['tellAboutPartner'] as String?,
      // Identity Confirmation
      idFrontSide: data?['idFrontSide'] as Image?,
      idFrontSideUrl: data?['idFrontSideUrl'] as String?,
      idBackSide: data?['idBackSide'] as Image?,
      idBackSideUrl: data?['idFrontSideUrl'] as String?,
      idNumber: data?['idNumber'] as String?,
    );
  }

  @override
  Map<String, dynamic> toFirestore() => {
        // General Info
        if (userId != null) 'userId': userId,
        if (gender != null) 'gender': gender,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (isCreateProfile != null) 'isCreateProfile': isCreateProfile,
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
        if (faceStyle != null) 'faceStyle': faceStyle,
        if (quranMemorizing != null) 'quranMemorizing': quranMemorizing,
        // Marriage Info
        if (tellAboutYou != null) 'tellAboutYou': tellAboutYou,
        if (tellAboutPartner != null) 'tellAboutPartner': tellAboutPartner,
        // Identity Confirmation
        if (idFrontSide != null) 'idFrontSide': idFrontSide,
        if (idFrontSideUrl != null) 'idFrontSideUrl': idFrontSideUrl,
        if (idBackSide != null) 'idBackSide': idBackSide,
        if (idBackSideUrl != null) 'idBackSideUrl': idBackSideUrl,
        if (idNumber != null) 'idNumber': idNumber,
      };
}

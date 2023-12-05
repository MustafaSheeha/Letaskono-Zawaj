
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';

class CreateMaleProfileModel extends UserModel{
  // General Info
  
  // Religious Info
  String? faceStyle;
 
  // Identity Confirmation
  Image? idFrontSide;
  Image? idBackSide;
  String? idNumber;

  CreateMaleProfileModel({
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
    this.idBackSide,
    this.idNumber,
  });

  factory CreateMaleProfileModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CreateMaleProfileModel(
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
      faceStyle: data?['faceStyle'] as String?,
      quranMemorizing: data?['quranMemorizing'] as String?,
      // Marriage Info
      tellAboutYou: data?['tellAboutYou'] as String?,
      tellAboutPartner: data?['tellAboutPartner'] as String?,
      // Identity Confirmation
      idFrontSide: data?['idFrontSide'] as Image?,
      idBackSide: data?['idBackSide'] as Image?,
      idNumber: data?['idNumber'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
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
        if (faceStyle != null) 'faceStyle': faceStyle,
        if (quranMemorizing != null) 'quranMemorizing': quranMemorizing,
        // Marriage Info
        if (tellAboutYou != null) 'tellAboutYou': tellAboutYou,
        if (tellAboutPartner != null) 'tellAboutPartner': tellAboutPartner,
        // Identity Confirmation
        if (idFrontSide != null) 'idFrontSide': idFrontSide,
        if (idBackSide != null) 'idBackSide': idBackSide,
        if (idNumber != null) 'idNumber': idNumber,
      };
}

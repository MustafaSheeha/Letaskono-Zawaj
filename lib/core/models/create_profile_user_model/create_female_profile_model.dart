import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';

class CreateFemaleProfileModel extends UserModel {
  // Religious Info
  String? clothStyle;
  String? acceptToWearNiqab;

  // Parent Info
  String? isParentKnowAboutLetaskono;
  String? youAcceptToMarryWithoutQaamah;
  String? parentAcceptToMarryWithoutQaamah;
  String? parentPhone;

  CreateFemaleProfileModel({
    super.userId,
    // General Info
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
    this.clothStyle,
    super.quranMemorizing,
    this.acceptToWearNiqab,
    // Marriage Info
    super.tellAboutYou,
    super.tellAboutPartner,
    // Parent Info
    this.isParentKnowAboutLetaskono,
    this.youAcceptToMarryWithoutQaamah,
    this.parentAcceptToMarryWithoutQaamah,
    this.parentPhone,
  });

  factory CreateFemaleProfileModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CreateFemaleProfileModel(
      // General Info
      userId: data?['userId'] as String?,
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
      clothStyle: data?['clothStyle'] as String?,
      quranMemorizing: data?['quranMemorizing'] as String?,
      acceptToWearNiqab: data?['acceptToWearNiqab'] as String?,
      // Marriage Info
      tellAboutYou: data?['tellAboutYou'] as String?,
      tellAboutPartner: data?['tellAboutPartner'] as String?,
      // Parent Info
      isParentKnowAboutLetaskono:
          data?['isParentKnowAboutLetaskono'] as String?,
      youAcceptToMarryWithoutQaamah:
          data?['youAcceptToMarryWithoutQaamah'] as String?,
      parentAcceptToMarryWithoutQaamah:
          data?['parentAcceptToMarryWithoutQaamah'] as String?,
      parentPhone: data?['parentPhone'] as String?,
    );
  }

  @override
  Map<String, dynamic> toFirestore() => {
        // General Info
        if (userId != null) 'userId': userId,
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
        if (clothStyle != null) 'clothStyle': clothStyle,
        if (quranMemorizing != null) 'quranMemorizing': quranMemorizing,
        if (acceptToWearNiqab != null) 'acceptToWearNiqab': acceptToWearNiqab,
        // Marriage Info
        if (tellAboutYou != null) 'tellAboutYou': tellAboutYou,
        if (tellAboutPartner != null) 'tellAboutPartner': tellAboutPartner,
        // Parent Info
        if (isParentKnowAboutLetaskono != null)
          'isParentKnowAboutLetaskono': isParentKnowAboutLetaskono,
        if (youAcceptToMarryWithoutQaamah != null)
          'youAcceptToMarryWithoutQaamah': youAcceptToMarryWithoutQaamah,
        if (parentAcceptToMarryWithoutQaamah != null)
          'parentAcceptToMarryWithoutQaamah': parentAcceptToMarryWithoutQaamah,
        if (parentPhone != null) 'parentPhone': parentPhone,
      };
}

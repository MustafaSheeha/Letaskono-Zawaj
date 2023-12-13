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
  String? faceStyle;
  String? clothStyle;
  String? quranMemorizing;
  String? acceptToWearNiqab;
  String? yourSheikhs;
  String? morningEveningAzkar;
  // Marriage Info
  String? tellAboutYou;
  String? tellAboutPartner;
  // Family Info
  String? boysNumber;
  String? girlsNumber;
  String? howOldYourChildren;
  String? fatherJob;
  String? motherJob;
  String? yourRelationWithFamily;
  String? isParentKnowAboutLetaskono;
  String? youAcceptToMarryWithoutQaamah;
  String? parentAcceptToMarryWithoutQaamah;
  String? parentPhone;
  // additional  Info
  String? yourThoughtAboutGuardianship;
  String? jobDetails;
  String? phobia;
  String? isYourJobHalal;
  String? engagementEthics;
  String? yourLifeGoals;
  String? learningReligiousKnowledge;
  String? yourThoughtAboutLifeSuccess;
  String? diseasesAndDisability;
  String? isSmoking;
  String? detailedAddress;
  String? listenMusicWatchMovies;
  String? broomParty;
  String? howSpendSparetime;
  String? canCook;
  String? yourThoughtsAlmostTime;
  String? travelingAbroad;

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
    this.faceStyle,
    this.clothStyle,
    this.quranMemorizing,
    this.acceptToWearNiqab,
    this.yourSheikhs,
    // Marriage Info
    this.tellAboutYou,
    this.tellAboutPartner,
    // Family Info
    this.boysNumber,
    this.girlsNumber,
    this.howOldYourChildren,
    this.fatherJob,
    this.motherJob,
    this.isParentKnowAboutLetaskono,
    this.youAcceptToMarryWithoutQaamah,
    this.parentAcceptToMarryWithoutQaamah,
    this.parentPhone,
    // additional  Info
    this.yourThoughtAboutGuardianship,
    this.jobDetails,
    this.phobia,
    this.isYourJobHalal,
    this.engagementEthics,
    this.yourLifeGoals,
    this.learningReligiousKnowledge,
    this.morningEveningAzkar,
    this.yourThoughtAboutLifeSuccess,
    this.diseasesAndDisability,
    this.isSmoking,
    this.detailedAddress,
    this.listenMusicWatchMovies,
    this.broomParty,
    this.yourRelationWithFamily,
    this.howSpendSparetime,
    this.canCook,
    this.yourThoughtsAlmostTime,
    this.travelingAbroad ,
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
      faceStyle: data?['faceStyle'] as String?,
      clothStyle: data?['clothStyle'] as String?,
      acceptToWearNiqab: data?['acceptToWearNiqab'] as String?,
      quranMemorizing: data?['quranMemorizing'] as String?,
      yourSheikhs: data?['yourSheikhs'] as String?,
      // Marriage Info
      tellAboutYou: data?['tellAboutYou'] as String?,
      tellAboutPartner: data?['tellAboutPartner'] as String?,
      // Family Info
      boysNumber: data?['boysNumber'] as String?,
      girlsNumber: data?['girlsNumber'] as String?,
      howOldYourChildren: data?['howOldYourChildren'] as String?,
      fatherJob: data?['fatherJob'] as String?,
      motherJob: data?['motherJob'] as String?,
      isParentKnowAboutLetaskono:
          data?['isParentKnowAboutLetaskono'] as String?,
      youAcceptToMarryWithoutQaamah:
          data?['youAcceptToMarryWithoutQaamah'] as String?,
      parentAcceptToMarryWithoutQaamah:
          data?['parentAcceptToMarryWithoutQaamah'] as String?,
      parentPhone: data?['parentPhone'] as String?,
      // additional  Info
      yourThoughtAboutGuardianship:
          data?['yourThoughtAboutGuardianship'] as String?,
      jobDetails: data?['jobDetails'] as String?,
      phobia: data?['phobia'] as String?,
      isYourJobHalal: data?['isYourJobHalal'] as String?,
      engagementEthics: data?['engagementEthics'] as String?,
      yourLifeGoals: data?['yourLifeGoals'] as String?,
      learningReligiousKnowledge:
          data?['learningReligiousKnowledge'] as String?,
      morningEveningAzkar: data?['morningEveningAzkar'] as String?,
      yourThoughtAboutLifeSuccess:
          data?['yourThoughtAboutLifeSuccess'] as String?,
      diseasesAndDisability: data?['diseasesAndDisability'] as String?,
      isSmoking: data?['isSmoking'] as String?,
      detailedAddress: data?['detailedAddress'] as String?,
      listenMusicWatchMovies: data?['listenMusicWatchMovies'] as String?,
      broomParty: data?['broomParty'] as String?,
      yourRelationWithFamily: data?['yourRelationWithFamily'] as String?,
      howSpendSparetime: data?['howSpendSparetime'] as String?,
      canCook: data?['canCook'] as String?,
      yourThoughtsAlmostTime: data?['yourThoughtsAlmostTime'] as String?,
      travelingAbroad: data?['travelingAbroad'] as String?,
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
        if (faceStyle != null) 'faceStyle': faceStyle,
        if (clothStyle != null) 'clothStyle': clothStyle,
        if (quranMemorizing != null) 'quranMemorizing': quranMemorizing,
        if (acceptToWearNiqab != null) 'acceptToWearNiqab': acceptToWearNiqab,
        if (yourSheikhs != null) 'yourSheikhs': yourSheikhs,
        // Marriage Info
        if (tellAboutYou != null) 'tellAboutYou': tellAboutYou,
        if (tellAboutPartner != null) 'tellAboutPartner': tellAboutPartner,
        // Family Info
        if (boysNumber != null) 'boysNumber': boysNumber,
        if (girlsNumber != null) 'girlsNumber': girlsNumber,
        if (howOldYourChildren != null)
          'howOldYourChildren': howOldYourChildren,
        if (fatherJob != null) 'fatherJob': fatherJob,
        if (motherJob != null) 'motherJob': motherJob,
        if (isParentKnowAboutLetaskono != null)
          'isParentKnowAboutLetaskono': isParentKnowAboutLetaskono,
        if (youAcceptToMarryWithoutQaamah != null)
          'youAcceptToMarryWithoutQaamah': youAcceptToMarryWithoutQaamah,
        if (parentAcceptToMarryWithoutQaamah != null)
          'parentAcceptToMarryWithoutQaamah': parentAcceptToMarryWithoutQaamah,
        if (parentPhone != null) 'parentPhone': parentPhone,
        // additional  Info
        if (yourThoughtAboutGuardianship != null)
          'yourThoughtAboutGuardianship': yourThoughtAboutGuardianship,
        if (jobDetails != null) 'jobDetails': jobDetails,
        if (phobia != null) 'phobia': phobia,
        if (isYourJobHalal != null) 'isYourJobHalal': isYourJobHalal,
        if (engagementEthics != null) 'engagementEthics': engagementEthics,
        if (yourLifeGoals != null) 'yourLifeGoals': yourLifeGoals,
        if (learningReligiousKnowledge != null)
          'learningReligiousKnowledge': learningReligiousKnowledge,
        if (morningEveningAzkar != null)
          'morningEveningAzkar': morningEveningAzkar,
        if (yourThoughtAboutLifeSuccess != null)
          'yourThoughtAboutLifeSuccess': yourThoughtAboutLifeSuccess,
        if (diseasesAndDisability != null)
          'diseasesAndDisability': diseasesAndDisability,
        if (isSmoking != null) 'isSmoking': isSmoking,
        if (detailedAddress != null) 'detailedAddress': detailedAddress,
        if (listenMusicWatchMovies != null)
          'listenMusicWatchMovies': listenMusicWatchMovies,
        if (broomParty != null) 'broomParty': broomParty,
        if (yourRelationWithFamily != null)
          'yourRelationWithFamily': yourRelationWithFamily,
        if (howSpendSparetime != null) 'howSpendSparetime': howSpendSparetime,
        if (canCook != null) 'canCook': canCook,
        if (yourThoughtsAlmostTime != null)
          'yourThoughtsAlmostTime': yourThoughtsAlmostTime,
        if (travelingAbroad != null) 'travelingAbroad': travelingAbroad,
      };
}

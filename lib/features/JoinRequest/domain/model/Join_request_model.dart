class JoinRequestModel {
  JoinRequestModel({
    required this.arabicName,
    required this.englishName,
    required this.fatherName,
    required this.BirthDate,
    required this.City,
    required this.nationality,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.academicLevel,
    required this.academicSpecialization,
    required this.workSpecialization,
    required this.astronomyLevel,
    required this.activityType,
    required this.target,
    required this.otherInterests,
    required this.languageMembers,
    required this.domainMembers,
  });
  late final String arabicName;
  late final String englishName;
  late final String fatherName;
  late final String BirthDate;
  late final String City;
  late final String nationality;
  late final String phoneNumber;
  late final String whatsappNumber;
  late final String academicLevel;
  late final String academicSpecialization;
  late final String workSpecialization;
  late final String astronomyLevel;
  late final String activityType;
  late final String target;
  late final String otherInterests;
  late final List<String> languageMembers;
  late final List<String> domainMembers;

  JoinRequestModel.fromJson(Map<String, dynamic> json) {
    arabicName = json['arabic_name'];
    englishName = json['english_name'];
    fatherName = json['father_name'];
    BirthDate = json['BirthDate'];
    City = json['City'];
    nationality = json['nationality'];
    phoneNumber = json['phone_number'];
    whatsappNumber = json['whatsapp_number'];
    academicLevel = json['academic_level'];
    academicSpecialization = json['academic_specialization'];
    workSpecialization = json['work_specialization'];
    astronomyLevel = json['astronomy_level'];
    activityType = json['activity_type'];
    target = json['target'];
    otherInterests = json['other_interests'];
    languageMembers = json['language_members'] != null
        ? List<String>.from(json['language_members'])
        : [];
    domainMembers = json['domain_members'] != null
        ? List<String>.from(json['domain_members'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['arabic_name'] = arabicName;

    map['english_name'] = englishName;
    map['father_name'] = fatherName;
    map['BirthDate'] = BirthDate;
    map['City'] = City;
    map['nationality'] = nationality;
    map['phone_number'] = phoneNumber;
    map['whatsapp_number'] = whatsappNumber;
    map['academic_level'] = academicLevel;
    map['academic_specialization'] = academicSpecialization;
    map['work_specialization'] = workSpecialization;
    map['astronomy_level'] = astronomyLevel;
    map['activity_type'] = activityType;
    map['target'] = target;
    map['other_interests'] = otherInterests;
    map['language_members'] = languageMembers;
    map['domain_members'] = domainMembers;
    return map;
  }
}

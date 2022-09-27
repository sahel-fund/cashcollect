import 'dart:convert';

class UserModel {
  final String uid;
  final String names;
  final String email;
  final String phoneNumber;
  final String? avatarURL;
  final String profession;
  UserModel({
    required this.uid,
    required this.names,
    required this.email,
    required this.phoneNumber,
    this.avatarURL,
    required this.profession,
  });

  UserModel copyWith({
    String? uid,
    String? names,
    String? email,
    String? phoneNumber,
    String? avatarURL,
    String? profession,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      names: names ?? this.names,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarURL: avatarURL ?? this.avatarURL,
      profession: profession ?? this.profession,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'names': names});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    if (avatarURL != null) {
      result.addAll({'avatarURL': avatarURL});
    }
    result.addAll({'profession': profession});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      names: map['names'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      avatarURL: map['avatarURL'],
      profession: map['profession'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, names: $names, email: $email, phoneNumber: $phoneNumber, avatarURL: $avatarURL, profession: $profession)';
  }
}

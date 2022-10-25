import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String profile;
  final String token;
  final String uid;
  UserModel({
    required this.name,
    required this.email,
    required this.profile,
    required this.token,
    required this.uid
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "profile": profile,
      "token": token,
      "uid": uid
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '', 
      profile: map['profile'] ?? '', 
      token: map['token'] ?? '', 
      uid: map['uid'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? name,
    String? email,
    String? profile,
    String? token,
    String? uid
  }) {
    return UserModel(
      name: name ?? this.name, 
      email: email ?? this.email, 
      profile: profile ?? this.profile, 
      token: token ?? this.token, 
      uid: uid ?? this.uid
      );
  }
}
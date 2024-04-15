// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Profile {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? avatar;
  String? role;
  bool? status;
  String? createAt;
  Profile({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.avatar,
    this.role,
    this.status,
    this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'password': password,
      'avatar': avatar,
      'role': role,
      'status': status,
      'createAt': createAt,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      firstname: map['first_name'] != null ? map['first_name'] as String : null,
      lastname: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      createAt: map['createAt'] != null ? map['createAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:flutter_study/generated/json/base/json_convert_content.dart';
import 'package:flutter_study/day11/user.dart';

User $UserFromJson(Map<String, dynamic> json) {
  final User user = User();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    user.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    user.email = email;
  }
  return user;
}

Map<String, dynamic> $UserToJson(User entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['email'] = entity.email;
  return data;
}

extension UserExtension on User {
  User copyWith({
    String? name,
    String? email,
  }) {
    return User()
      ..name = name ?? this.name
      ..email = email ?? this.email;
  }
}
import 'package:flutter_study/generated/json/base/json_convert_content.dart';
import 'package:flutter_study/day11/user_bean.dart';

UserBean $UserBeanFromJson(Map<String, dynamic> json) {
  final UserBean userBean = UserBean();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userBean.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userBean.email = email;
  }
  final UserBeanMother? mother = jsonConvert.convert<UserBeanMother>(
      json['mother']);
  if (mother != null) {
    userBean.mother = mother;
  }
  final List<UserBeanFriends>? friends = (json['friends'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<UserBeanFriends>(e) as UserBeanFriends)
      .toList();
  if (friends != null) {
    userBean.friends = friends;
  }
  return userBean;
}

Map<String, dynamic> $UserBeanToJson(UserBean entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['email'] = entity.email;
  data['mother'] = entity.mother.toJson();
  data['friends'] = entity.friends.map((v) => v.toJson()).toList();
  return data;
}

extension UserBeanExtension on UserBean {
  UserBean copyWith({
    String? name,
    String? email,
    UserBeanMother? mother,
    List<UserBeanFriends>? friends,
  }) {
    return UserBean()
      ..name = name ?? this.name
      ..email = email ?? this.email
      ..mother = mother ?? this.mother
      ..friends = friends ?? this.friends;
  }
}

UserBeanMother $UserBeanMotherFromJson(Map<String, dynamic> json) {
  final UserBeanMother userBeanMother = UserBeanMother();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userBeanMother.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userBeanMother.email = email;
  }
  return userBeanMother;
}

Map<String, dynamic> $UserBeanMotherToJson(UserBeanMother entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['email'] = entity.email;
  return data;
}

extension UserBeanMotherExtension on UserBeanMother {
  UserBeanMother copyWith({
    String? name,
    String? email,
  }) {
    return UserBeanMother()
      ..name = name ?? this.name
      ..email = email ?? this.email;
  }
}

UserBeanFriends $UserBeanFriendsFromJson(Map<String, dynamic> json) {
  final UserBeanFriends userBeanFriends = UserBeanFriends();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userBeanFriends.name = name;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userBeanFriends.email = email;
  }
  return userBeanFriends;
}

Map<String, dynamic> $UserBeanFriendsToJson(UserBeanFriends entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['email'] = entity.email;
  return data;
}

extension UserBeanFriendsExtension on UserBeanFriends {
  UserBeanFriends copyWith({
    String? name,
    String? email,
  }) {
    return UserBeanFriends()
      ..name = name ?? this.name
      ..email = email ?? this.email;
  }
}
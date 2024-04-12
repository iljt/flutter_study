import 'package:flutter_study/generated/json/base/json_field.dart';
import 'package:flutter_study/generated/json/user_bean.g.dart';
import 'dart:convert';
export 'package:flutter_study/generated/json/user_bean.g.dart';
/*{
"name": "John Smith",
"email": "john@example.com",
"mother":{
"name": "Alice",
"email":"alice@example.com"
},
"friends":[
{
"name": "Jack",
"email":"Jack@example.com"
},
{
"name": "Nancy",
"email":"Nancy@example.com"
}
]
}嵌套json通过FlutterJsonBeanFactory插件生成dart实体类*/
@JsonSerializable()
class UserBean {
	late String name = '';
	late String email = '';
	late UserBeanMother mother;
	late List<UserBeanFriends> friends = [];

	UserBean();

	factory UserBean.fromJson(Map<String, dynamic> json) => $UserBeanFromJson(json);

	Map<String, dynamic> toJson() => $UserBeanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserBeanMother {
	late String name = '';
	late String email = '';

	UserBeanMother();

	factory UserBeanMother.fromJson(Map<String, dynamic> json) => $UserBeanMotherFromJson(json);

	Map<String, dynamic> toJson() => $UserBeanMotherToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserBeanFriends {
	late String name = '';
	late String email = '';

	UserBeanFriends();

	factory UserBeanFriends.fromJson(Map<String, dynamic> json) => $UserBeanFriendsFromJson(json);

	Map<String, dynamic> toJson() => $UserBeanFriendsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
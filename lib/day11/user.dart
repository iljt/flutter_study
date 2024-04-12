import 'package:flutter_study/generated/json/base/json_field.dart';
import 'package:flutter_study/generated/json/user.g.dart';
import 'dart:convert';
export 'package:flutter_study/generated/json/user.g.dart';

/*{
"name": "John Smith",
"email": "john@example.com"
}一般json通过FlutterJsonBeanFactory插件生成dart实体类*/
@JsonSerializable()
class User {
	late String name = '';
	late String email = '';

	User();

	factory User.fromJson(Map<String, dynamic> json) => $UserFromJson(json);

	Map<String, dynamic> toJson() => $UserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
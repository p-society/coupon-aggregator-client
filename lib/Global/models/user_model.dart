import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String mobileNumber;

  User({
    required this.fName,
    required this.lName,
    required this.email,
    required this.mobileNumber,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

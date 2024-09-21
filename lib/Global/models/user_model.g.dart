// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fName': instance.fName,
      'lName': instance.lName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
    };

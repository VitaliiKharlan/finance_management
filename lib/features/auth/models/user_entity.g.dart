// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  mobileNumber: json['mobileNumber'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  displayId: json['displayId'] as String,
);

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'dateOfBirth': instance.dateOfBirth,
      'displayId': instance.displayId,
    };

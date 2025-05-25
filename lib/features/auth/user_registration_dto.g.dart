// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistrationDto _$UserRegistrationDtoFromJson(Map<String, dynamic> json) =>
    UserRegistrationDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$UserRegistrationDtoToJson(
  UserRegistrationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'mobileNumber': instance.mobileNumber,
  'dateOfBirth': instance.dateOfBirth,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};

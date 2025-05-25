import 'package:json_annotation/json_annotation.dart';

part 'user_registration_dto.g.dart';

@JsonSerializable()
class UserRegistrationDto {
  UserRegistrationDto({
    required this.id,
    required this.name,
    required this.email,
    this.mobileNumber,
    this.dateOfBirth,
    this.password,
    this.confirmPassword,
  });

  final String id;
  final String name;
  final String email;
  String? mobileNumber;
  String? dateOfBirth;
  String? password;
  String? confirmPassword;

  factory UserRegistrationDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationDtoToJson(this);

  UserRegistrationDto copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? dateOfBirth,
    String? password,
    String? confirmPassword,
  }) => UserRegistrationDto(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    mobileNumber: mobileNumber ?? this.mobileNumber,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
  );

  @override
  String toString() {
    return 'UserRegistrationDto{'
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'mobileNumber: $mobileNumber, '
        'dateOfBirth: $dateOfBirth, '
        'password: $password, '
        'confirmPassword: $confirmPassword, '
        '}';
  }
}

import 'i_customer_profile_dto.dart';

class UserRegistrationDto implements ICustomerProfileDto {
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

  factory UserRegistrationDto.fromJson(Map<String, dynamic> json) {
    return UserRegistrationDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      dateOfBirth: json['dateOfBirth'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,

      'email': email,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

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
    return 'CustomerProfileDto{'
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'mobileNumber: $mobileNumber, '
        'dateOfBirth: $dateOfBirth, '
        'password: $password, '
        'confirmPassword: $confirmPassword,}';
  }
}

import 'i_customer_profile_dto.dart';

class CustomerProfileDto implements ICustomerProfileDto {
  CustomerProfileDto({
    required this.id,
    required this.name,
    required this.email,
    this.mobileNumber,
    this.dateOfBirth,
    this.password,
    this.confirmPassword,
  });

  String? id;
  String? name;

  String? email;
  String? mobileNumber;
  String? dateOfBirth;
  String? password;
  String? confirmPassword;

  factory CustomerProfileDto.fromJson(Map<String, dynamic> json) {
    return CustomerProfileDto(
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

  CustomerProfileDto copyWith({
    String? id,
    String? name,

    String? email,
    String? mobileNumber,
    String? dateOfBirth,

    String? password,
    String? confirmPassword,
  }) => CustomerProfileDto(
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

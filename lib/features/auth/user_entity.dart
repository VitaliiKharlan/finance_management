import 'i_entity.dart';

class UserEntity implements IEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.password,
    required this.confirmPassword,
  });

  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final String password;
  final String confirmPassword;

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      mobileNumber: map['mobileNumber'],
      dateOfBirth: map['dateOfBirth'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
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

  @override
  String toString() {
    return 'UserEntity{'
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'mobileNumber: $mobileNumber, '
        'dateOfBirth: $dateOfBirth, '
        'password: $password, '
        'confirmPassword: $confirmPassword}';
  }
}

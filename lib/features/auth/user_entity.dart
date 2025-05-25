import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
  });

  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? dateOfBirth,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  String toString() {
    return 'UserEntity{'
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'mobileNumber: $mobileNumber, '
        'dateOfBirth: $dateOfBirth, '
        '}';
  }
}

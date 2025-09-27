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
    required this.displayId,
  });

  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final String displayId;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? dateOfBirth,
    String? displayId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      displayId: displayId ?? this.displayId,
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
        'displayId: $displayId, '
        '}';
  }
}

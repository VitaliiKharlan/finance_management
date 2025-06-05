part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileFailureState extends ProfileState {
  final String message;

  const ProfileFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileViewState extends ProfileState {}

class ProfileEditState extends ProfileState {}

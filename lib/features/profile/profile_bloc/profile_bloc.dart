import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<EditProfileEvent>(_onEditProfile);
    on<ProfileViewEvent>(_onProfileView);
  }

  FutureOr<void> _onEditProfile(
    EditProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileState.edit());
  }

  FutureOr<void> _onProfileView(
    ProfileViewEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileState.view());
  }
}

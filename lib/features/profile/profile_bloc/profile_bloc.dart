import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<EditProfileEvent>((event, emit) => emit(ProfileEditState()));
    on<ProfileViewEvent>((event, emit) => emit(ProfileViewState()));
  }
}

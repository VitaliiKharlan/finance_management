import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitialState;

  const factory ProfileState.failure(String message) = ProfileFailureState;

  const factory ProfileState.view() = ProfileViewState;

  const factory ProfileState.edit() = ProfileEditState;
}

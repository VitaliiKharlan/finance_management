import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({required Brightness brightness}) = _ThemeState;

  const ThemeState._();

  bool get isLight => brightness == Brightness.light;
}

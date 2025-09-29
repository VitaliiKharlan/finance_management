import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(brightness: Brightness.light));

  void setThemeBrightness(Brightness brightness) {
    emit(ThemeState(brightness: brightness));
  }
}
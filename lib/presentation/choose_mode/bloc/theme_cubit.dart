import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Deserialize the JSON to a ThemeMode
    String? themeString = json['themeMode'] as String?;
    if (themeString == null) {
      return null; // or return a default value
    }
    return ThemeMode.values.firstWhere(
      (mode) => mode.toString() == themeString,
      orElse: () => ThemeMode.system, // Default value if not found
    );
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Serialize the ThemeMode to JSON
    return {
      'themeMode': state.toString(),
    };
  }
}

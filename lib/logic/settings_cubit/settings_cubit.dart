import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  setThemeMode(ThemeMode mode) => emit(state.copyWith(themeMode: mode));
}

class ThemeModeBuilder extends BlocBuilder<SettingsCubit, SettingsState> {
  ThemeModeBuilder({super.key, required super.builder})
      : super(
          buildWhen: (prev, current) => prev.themeMode != current.themeMode,
        );
}

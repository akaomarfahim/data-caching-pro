import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default('en') String languageCode,
    @Default(true) bool notificationsEnabled,
    @Default(false) bool biometricLockEnabled,
    @Default(false) bool hasCompletedOnboarding,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}

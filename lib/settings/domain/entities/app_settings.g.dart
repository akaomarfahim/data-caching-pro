// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  languageCode: json['languageCode'] as String? ?? 'en',
  notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
  biometricLockEnabled: json['biometricLockEnabled'] as bool? ?? false,
  hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'languageCode': instance.languageCode,
      'notificationsEnabled': instance.notificationsEnabled,
      'biometricLockEnabled': instance.biometricLockEnabled,
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/state/persisted.dart';
import '../domain/entities/app_settings.dart';
import '../domain/repositories/settings_repo.dart';
import 'settings_providers.dart';

final appSettingsProvider = NotifierProvider<AppSettingsNotifier, AppSettings>(AppSettingsNotifier.new);

class AppSettingsNotifier extends Notifier<AppSettings> with Persisted<AppSettings> {
  SettingsRepository get _repository => ref.read(settingsRepositoryProvider);

  @override
  AppSettings build() => ref.watch(settingsRepositoryProvider).load();

  @override
  Future<void> save(AppSettings value) => _repository.save(value);

  Future<void> setThemeMode(ThemeMode mode) => update((s) => s.copyWith(themeMode: mode));

  Future<void> setLanguage(String code) => update((s) => s.copyWith(languageCode: code));

  Future<void> setNotificationsEnabled({required bool enabled}) =>
      update((s) => s.copyWith(notificationsEnabled: enabled));

  Future<void> setBiometricLockEnabled({required bool enabled}) =>
      update((s) => s.copyWith(biometricLockEnabled: enabled));

  Future<void> completeOnboarding() => update((s) => s.copyWith(hasCompletedOnboarding: true));

  Future<void> reset() => update((_) => const AppSettings());
}

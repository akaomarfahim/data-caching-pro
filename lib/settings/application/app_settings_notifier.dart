import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/app_settings.dart';
import 'settings_providers.dart';

final appSettingsProvider = NotifierProvider<AppSettingsNotifier, AppSettings>(AppSettingsNotifier.new);

class AppSettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() => ref.watch(settingsRepositoryProvider).load();

  Future<void> setThemeMode(ThemeMode mode) => _update((s) => s.copyWith(themeMode: mode));

  Future<void> setLanguage(String languageCode) => _update((s) => s.copyWith(languageCode: languageCode));

  Future<void> setNotificationsEnabled(bool enabled) => _update((s) => s.copyWith(notificationsEnabled: enabled));

  Future<void> setBiometricLockEnabled(bool enabled) => _update((s) => s.copyWith(biometricLockEnabled: enabled));

  Future<void> completeOnboarding() => _update((s) => s.copyWith(hasCompletedOnboarding: true));

  Future<void> reset() async {
    state = const AppSettings();
    await ref.read(settingsRepositoryProvider).clear();
  }

  /// Optimistic update: the UI reacts instantly, then the value is persisted.
  /// On persistence failure the in-memory state is kept (the app stays usable)
  /// and the error is logged.
  Future<void> _update(AppSettings Function(AppSettings current) transform) async {
    final next = transform(state);
    if (next == state) return;

    state = next;

    try {
      await ref.read(settingsRepositoryProvider).save(next);
    } catch (e, st) {
      debugPrint('AppSettingsNotifier: failed to persist settings. $e\n$st');
    }
  }
}

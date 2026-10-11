import 'package:flutter/foundation.dart';

import '../../domain/repositories/settings_repo.dart';
import '../datasource/settings_local_datasource.dart';
import '../../domain/entities/app_settings.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._local);

  final SettingsLocalDataSource _local;

  @override
  AppSettings load() {
    final json = _local.read();
    if (json == null) return const AppSettings();

    try {
      return AppSettings.fromJson(json);
    } catch (e, st) {
      // Schema drift or bad data: fall back to defaults instead of crashing at startup.
      debugPrint('SettingsRepositoryImpl: failed to parse settings. $e\n$st');
      return const AppSettings();
    }
  }

  @override
  Future<void> save(AppSettings settings) => _local.write(settings.toJson());

  @override
  Future<void> clear() => _local.remove();
}

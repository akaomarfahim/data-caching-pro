import '../entities/app_settings.dart';

abstract interface class SettingsRepository {
  /// Synchronous: the underlying store is pre-loaded during bootstrap.
  /// Returns defaults when nothing is stored or stored data is corrupt.
  AppSettings load();

  Future<void> save(AppSettings settings);

  Future<void> clear();
}

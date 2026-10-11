import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/storage_providers.dart';
import '../data/datasource/settings_local_datasource.dart';
import '../data/repositories/settings_repository_impl.dart';
import '../domain/repositories/settings_repo.dart';

final settingsLocalDataSourceProvider = Provider<SettingsLocalDataSource>(
  (ref) => SettingsLocalDataSource(ref.watch(sharedPreferencesProvider)),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepositoryImpl(ref.watch(settingsLocalDataSourceProvider)),
);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/storage_keys.dart';
import 'app_settings_notifier.dart';
import 'settings_providers.dart';

/// Read-only view of how settings are persisted on the device.
///
/// Intended for diagnostics UIs (developer menu, support tools, demos).
/// Features consume this through the `settings.dart` barrel, so they never
/// touch the datasource directly.
@immutable
class SettingsStorageSnapshot {
  const SettingsStorageSnapshot({
    required this.storageKey,
    required this.backend,
    required this.isPersisted,
    this.schemaVersion,
    this.sizeInBytes = 0,
    this.prettyJson = '',
  });

  final String storageKey;
  final String backend;

  /// False until the first successful write; defaults are in use before that.
  final bool isPersisted;
  final int? schemaVersion;
  final int sizeInBytes;
  final String prettyJson;
}

const _backendName = 'SharedPreferencesWithCache';

final settingsStorageSnapshotProvider = Provider<SettingsStorageSnapshot>((ref) {
  ref.watch(appSettingsProvider);
  final json = ref.watch(settingsLocalDataSourceProvider).read();

  if (json == null) {
    return const SettingsStorageSnapshot(
      storageKey: StorageKeys.appSettings,
      backend: _backendName,
      isPersisted: false,
    );
  }

  final candidate = json['version'];

  return SettingsStorageSnapshot(
    storageKey: StorageKeys.appSettings,
    backend: _backendName,
    isPersisted: true,
    schemaVersion: candidate is int ? candidate : null,
    sizeInBytes: utf8.encode(jsonEncode(json)).length,
    prettyJson: const JsonEncoder.withIndent('  ').convert(json),
  );
});

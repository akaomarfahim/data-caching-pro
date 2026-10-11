import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  final SharedPreferences _prefs;
  const SettingsLocalDataSource(this._prefs);

  // Versioned key: lets you migrate the schema later without crashing old installs.
  static const _key = 'app_settings_v1';

  Map<String, dynamic>? read() {
    final raw = _prefs.getString(_key);
    if (raw == null) return null;

    try {
      final decoded = jsonDecode(raw);
      return decoded is Map<String, dynamic> ? decoded : null;
    } on FormatException catch (e, st) {
      debugPrint('SettingsLocalDataSource: corrupt payload, ignoring. $e\n$st');
      return null;
    }
  }

  Future<void> write(Map<String, dynamic> json) async {
    await _prefs.setString(_key, jsonEncode(json));
  }

  Future<void> remove() async {
    await _prefs.remove(_key);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Must be overridden in `bootstrap()` with a pre-initialized instance.
/// This lets every consumer read synchronously, with no loading flash.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider must be overridden in bootstrap().'),
);

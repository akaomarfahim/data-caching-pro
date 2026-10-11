import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../errors/failures.dart';

// import '../logging/logger_providers.dart';

/// Optimistic update + persistence + rollback for any [Notifier].
///
/// Usage: `with Persisted<MyEntity>`, implement [save], and mutate through
/// [update]. Callers may `await` a mutator and catch [StorageFailure].
mixin Persisted<T> on Notifier<T> {
  /// Persist [value]. Throw [StorageFailure] on failure.
  @protected
  Future<void> save(T value);

  @protected
  Future<void> update(T Function(T current) transform) async {
    final previous = state;
    final next = transform(previous);
    if (next == previous) return;

    state = next; // optimistic: UI reacts immediately

    try {
      await save(next);
    } on StorageFailure catch (failure) {
      // ref.read(appLoggerProvider).error(failure.message, error: failure.cause, stackTrace: failure.stackTrace);
      // Roll back only if no newer update has superseded this one.
      if (state == next) state = previous;
      rethrow;
    }
  }
}

/// Base type for all expected, domain-level errors.
///
/// Sealed so a `switch` over failures is exhaustive. Subtypes must live in
/// this same file, so add NetworkFailure, AuthFailure and the rest here.
sealed class Failure implements Exception {
  const Failure(this.message, {this.cause, this.stackTrace});

  /// Human-readable summary, safe to show in a snackbar.
  final String message;

  /// The underlying exception or error that triggered this failure.
  final Object? cause;

  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when reading from or writing to local storage fails.
final class StorageFailure extends Failure {
  const StorageFailure(super.message, {super.cause, super.stackTrace});
}

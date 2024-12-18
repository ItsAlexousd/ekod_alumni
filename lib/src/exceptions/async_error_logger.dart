import 'package:ekod_alumni/src/exceptions/exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Error logger class to keep track of all AsyncError states that are set
/// by the controllers in the app.
class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final errorLogger = container.read(errorLoggerProvider);
    final error = _findError(newValue);
    if (error != null) {
      if (error.error is AppException) {
        // Only prints the AppException data
        errorLogger.logAppException(error.error as AppException);
      } else {
        // Prints everything including the stack trace
        errorLogger.logError(error.error, error.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}

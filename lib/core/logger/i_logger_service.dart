import 'package:get_it/get_it.dart';

ILoggerService get logger => GetIt.instance.get<ILoggerService>();

abstract class ILoggerService {
  void log(
      dynamic message, {
        StackTrace? stackTrace,
        required LogLevel logLevel,
        Object? error,
      });

  void clearLogs();
}

enum LogLevel {
  info,
  warning,
  error,
  success,
}
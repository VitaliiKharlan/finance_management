import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'i_logger_service.dart';

class LoggerService implements ILoggerService {
  LoggerService();

  ///Idea for future:
  ///handle all [warnings] and [errors]
  ///and directly from logger send them to the [crashlytics]
  //final ErrorsRecorder _errorsRecorder;

  final _logger = Logger(
    filter: ProductionLogFilter(),
    printer: PrettyPrinter(
      methodCount: 9,
      stackTraceBeginIndex: 0,
      colors: true,
      lineLength: 100,
      errorMethodCount: 9,

      /// color settings organization
      levelColors: {
        Level.info: AnsiColor.fg(10), // Зелёный для info
        Level.warning: AnsiColor.fg(208), // Оранжевый для warning
        Level.error: AnsiColor.fg(10), // Зелёный для error
        // Level.error: AnsiColor.fg(196), // Красный для error
        Level.debug: AnsiColor.fg(12), // Голубой для debug
        Level.trace: AnsiColor.fg(8), // Серый для trace
        Level.fatal: AnsiColor.fg(199), // Фиолетовый для fatal
      },
    ),
  );

  final List<CustomLog> _logsHistory = [];

  @override
  void log(
      dynamic message, {
        Object? error,
        StackTrace? stackTrace,
        required LogLevel logLevel,
        bool sendToRemote = false,
        bool? sendToMessenger = false,
      }) {
    final log = CustomLog(
      message: message,
      error: error,
      stackTrace: stackTrace,
      logLevel: logLevel,
      dateTime: DateTime.now(),
    );

    _logsHistory.add(log);
    _printToConsole(log);
  }

  void _printToConsole(CustomLog log) {
    switch (log.logLevel) {
      case LogLevel.info:
        _logger.i(
          log.message,
          time: DateTime.now(),
          error: log.error,
          stackTrace: log.stackTrace,
        );
        break;
      case LogLevel.warning:
        _logger.w(
          log.message,
          time: DateTime.now(),
          error: log.error,
          stackTrace: log.stackTrace,
        );
        break;
      case LogLevel.error:
        _logger.e(
          log.message,
          time: DateTime.now(),
          error: log.error,
          stackTrace: log.stackTrace,
        );
        break;
      default:
        _logger.i(
          log.message,
          time: DateTime.now(),
          error: log.error,
          stackTrace: log.stackTrace,
        );
        break;
    }
  }

  @override
  void clearLogs() {
    _logsHistory.clear();
  }
}

class ProductionLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => kDebugMode;
}

class CustomLog {
  const CustomLog({
    required this.message,
    required this.error,
    required this.logLevel,
    required this.stackTrace,
    required this.dateTime,
  });

  final dynamic message;
  final Object? error;
  final LogLevel logLevel;
  final StackTrace? stackTrace;
  final DateTime? dateTime;

  @override
  String toString() {
    return 'CustomLog{'
        'message: $message, '
        'error: $error, '
        'stackTrace: $stackTrace, '
        'dateTime: $dateTime}';
  }

  String toStringBeautify({required bool fullData}) {
    String prettyMessage = '$message\n';
    if (fullData) {
      prettyMessage = '$prettyMessage \n'
          'error: ${error.toString()}\n'
          '\nstackTrace: ${stackTrace.toString()} \n';
    }
    return prettyMessage;
  }
}

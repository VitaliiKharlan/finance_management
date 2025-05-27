import 'package:get_it/get_it.dart';

import '../logger/i_logger_service.dart';
import '../logger/logger_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// Logger
  GetIt.instance.registerLazySingleton<ILoggerService>(() => LoggerService());
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_injectable.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  usesNullSafety: true,
  generateForDir: ['lib'],
)
void configureDependencies() => locator.init();

// flutter packages pub run build_runner watch --delete-conflicting-outputs

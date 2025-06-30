import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies(GetIt getIt) => getIt.init();

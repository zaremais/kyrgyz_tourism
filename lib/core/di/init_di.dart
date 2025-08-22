import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/di/init_di.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(di);




// flutter run --dart-define=MOCK=true
// flutter run --dart-define=ENV=dev
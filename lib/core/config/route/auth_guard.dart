import 'package:auto_route/auto_route.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/auth_cubit.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authCubit = di<AuthCubit>();
    final isAuthenticated = authCubit.state.model != null;

    if (isAuthenticated) {
      resolver.next(); // Пускаем на защищённый маршрут
    } else {
      router.replace(const LoginRoute()); // Перенаправляем на логин
    }
  }
}

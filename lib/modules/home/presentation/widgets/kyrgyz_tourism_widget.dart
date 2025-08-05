import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/locale_provider.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class KyrgyzTourism extends StatefulWidget {
  const KyrgyzTourism({super.key});

  @override
  State<KyrgyzTourism> createState() => _KyrgyzTourismState();
}

class _KyrgyzTourismState extends State<KyrgyzTourism> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final localePovider = Provider.of<LocaleProvider>(context);

    return MaterialApp.router(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localePovider.locale,
      supportedLocales: S.delegate.supportedLocales,
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}

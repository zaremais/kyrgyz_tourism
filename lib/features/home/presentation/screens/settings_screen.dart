import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme_provider.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/features/home/presentation/widgets/settings_tile.dart';

import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          SettingsTile(
            title: S.of(context).darktheme,
            action: CupertinoSwitch(
              onChanged:
                  (value) =>
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).toogleTheme(),

              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}

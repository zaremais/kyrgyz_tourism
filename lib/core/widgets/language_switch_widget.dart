import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/features/home/presentation/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSwitchWidget extends StatelessWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    final locale = context.watch<LocaleProvider>().locale;
    final isRu = locale.languageCode == 'ru';

    return GestureDetector(
      onTap: () {
        final newLocale = isRu ? const Locale('en') : const Locale('ru');
        context.read<LocaleProvider>().setLocale(newLocale);
      },
      child: Container(
        width: 74,
        height: 30,
        decoration: BoxDecoration(
          color: darkTheme ? Colors.grey[900] : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isRu ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: darkTheme ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    isRu ? 'RU' : 'EN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

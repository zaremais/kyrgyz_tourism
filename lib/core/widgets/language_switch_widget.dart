import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/language_switch_notifier.dart';

class LanguageSwitchWidget extends StatefulWidget {
  const LanguageSwitchWidget({super.key});

  @override
  State<LanguageSwitchWidget> createState() => _LanguageSwitchWidgetState();
}

class _LanguageSwitchWidgetState extends State<LanguageSwitchWidget> {
  final languageNotifier = LanguageSwitchNotifier();

  @override
  void dispose() {
    languageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: languageNotifier,
      builder: (context, isRu, child) {
        return GestureDetector(
          onTap: () {
            languageNotifier.toggleLanguage();
          },
          child: Center(
            child: AnimatedContainer(
              margin: EdgeInsets.only(
                left: AppSizes.paddingMedium,
                right: AppSizes.paddingHorizontal,
              ),
              duration: const Duration(milliseconds: 300),
              width: 74,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusBig),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        isRu ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      width: AppSizes.paddingHorizontal,
                      height: AppSizes.paddingHorizontal,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textDescription,
                            blurRadius: AppSizes.borderRadiusBlur,
                            spreadRadius: AppSizes.borderRadiusSpread,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          isRu ? 'RU' : 'EN',
                          style: TextStyle(
                            fontSize: AppSizes.paddingSmall,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

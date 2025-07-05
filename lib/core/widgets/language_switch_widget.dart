import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/cubit/bloc/language_cubit.dart';
import 'package:provider/provider.dart';

class LanguageSwitchWidget extends StatelessWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isRu = context.select(
      (LanguageBloc bloc) => bloc.state.languageCode == 'ru',
    );

    return GestureDetector(
      onTap: () => context.read<LanguageBloc>().add(ToggleLanguageEvent()),
      child: Container(
        width: 74,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey[200],
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    isRu ? 'RU' : 'EN',
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

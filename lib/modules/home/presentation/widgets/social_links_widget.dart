import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';

class SotialLinksWidget extends StatelessWidget {
  const SotialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', width: 97, height: 92),
          const SizedBox(height: AppSizes.paddingButtonHeight),

          Column(
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Главная'), Text('О компании'), Text('Туры')],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Контакты'), Text('Гиды'), Text('Отзывы')],
              ),
            ],
          ),
          const SizedBox(height: 30),

          Column(
            children: [
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  const SizedBox(width: 10),
                  const Text('takhminam'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/instagram.png', width: 20),
                  const SizedBox(width: 10),
                  const Text('@takhminam'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_outlined),
                  const SizedBox(width: 10),
                  const Text('takhminam@email.com'),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/location.png',
                    width: 35,
                    color: darkTheme ? Colors.white : AppColors.text,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'ул. Тыныстанова \nБЦ "Бизнес Центр"\n3 -й этаж, офис 5',
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_outlined),
                  const SizedBox(width: 10),
                  const Text('+996 700 000 000'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

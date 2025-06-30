import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drop_down_button.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/cubit/profile_cubit.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/widgets/profile_alert_dialog.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_text_formfield.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _profileCubit = di<ProfileCubit>()..getProfile();

  final _fullNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _startDayContorller = TextEditingController();
  final _locationController = TextEditingController();
  final _statusController = TextEditingController();
  final _employeeController = TextEditingController();
  final _endDayController = TextEditingController();
  void _showDeleteAvatarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => ProfileAlertDialog(
            text: 'Внимание!\nВам необходимо\nобязательно загрузить новое фото',
            title: 'Удалить Аватар?',
          ),
    );
  }

  void _showLoadedAvatarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ProfileAlertDialog(text: '', title: 'Загрузить Аватар?'),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _startDayContorller.dispose();
    _statusController.dispose();
    _employeeController.dispose();
    _endDayController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  String? menuItem = 'e1';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(showImage: false, height: 80, onPressed: () {}),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocProvider.value(
            value: _profileCubit,
            child: BlocBuilder<ProfileCubit, BaseState<ProfileEntity>>(
              builder: (context, state) {
                return _buildForm(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Менеджеры',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.grey,
            ),
          ),
          SizedBox(height: 20),
          Text('Гиды', style: FontStyles.bodyText),
          SizedBox(height: 20),
          Text('Пользователи', style: FontStyles.bodyText),
          SizedBox(height: 20),
          Text('Черный список', style: FontStyles.bodyText),
          const SizedBox(height: 16),
          CustomDropDownButton(),

          CustomTextFormField(
            hintText: 'Введите вашу имя и фамилию',
            label: 'ФИО',
            controller: _fullNameController,
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Введите ФИО' : null,
          ),
          Row(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/ellipse1.png', width: 100),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(BorderSide.none),
                    ),
                    onPressed: () => _showLoadedAvatarDialog(context),
                    child: Text(
                      "Загрузить новое фото",
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showDeleteAvatarDialog(context),
                    child: const Text(
                      'Удалить фото',
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text('Имя пользователя'),
          CustomTextFormField(
            hintText: '@nickeName',
            label: '@nickeName',
            controller: _nickNameController,
            validator: (v) {
              if (v?.trim().isEmpty ?? true) return 'Введите nickeName';
              if (!v!.startsWith('@')) return 'Никнейм должен начинаться с @';
              return null;
            },
          ),

          CustomTextFormField(
            hintText: '20.02.2025',
            label: 'Дата рождения',
            controller: _birthDateController,
            onTap: _pickDate,
            validator:
                (v) =>
                    (v?.trim().isEmpty ?? true)
                        ? 'Выберите дату рождения'
                        : null,
          ),
          CustomTextFormField(
            label: 'Электронная почта',
            hintText: 'example@mail.com',
            controller: _emailController,
            validator: (v) {
              if (v?.trim().isEmpty ?? true) return 'Введите email';
              final emailRegExp = RegExp(
                r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$',
              );
              if (!emailRegExp.hasMatch(v!)) return 'Некорректный email';
              return null;
            },
          ),
          CustomTextFormField(
            hintText: '+996(000) 12-34-56',
            label: 'Телефон',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator:
                (v) =>
                    (v?.trim().isEmpty ?? true)
                        ? 'Введите номер телефона'
                        : null,
          ),
          CustomTextFormField(
            hintText: '11.11.2025',
            label: 'Начало работы',
            controller: _startDayContorller,
          ),

          CustomTextFormField(
            hintText: 'Старший менеджер',
            label: 'Роли',
            controller: _employeeController,
          ),
          CustomTextFormField(
            hintText: '20.05.2025',
            label: 'Последнее время захода',
            controller: _endDayController,
          ),
          SizedBox(height: 12),
          Text('  Описание гида', style: FontStyles.bodyLarge),
          CustomTextFormField(
            hintText: 'Описание гида',
            label:
                'Профессиональный гид, который проводит экскурсии по Кыргызстану. Любит свою работу и считает, что это лучшее занятие в мире! ',
            controller: _statusController,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Профиль обновлен')));
              }
            },
            text: 'Сохранить изменения',
            backgroundColor: AppColors.buttonGuide,
          ),

          Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Отмена', style: TextStyle(color: Colors.black)),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );
    if (picked != null) {
      _birthDateController.text =
          "${picked.day}.${picked.month}.${picked.year}";
    }
  }
}

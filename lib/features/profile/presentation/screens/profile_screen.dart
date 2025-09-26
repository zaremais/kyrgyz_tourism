import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart' show di;
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drop_down_button.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_text_formfield.dart';
import 'package:kyrgyz_tourism/features/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:kyrgyz_tourism/features/profile/presentation/widgets/profile_alert_dialog.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = di<ProfileCubit>()..getProfile();
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  Future<void> _pickDate() async {
    try {
      final picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: DateTime(2000),
      );
      if (picked != null && mounted) {
        setState(() {});
      }
    } catch (e) {
      // Обработка ошибок
      debugPrint('Date picker error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.router.push(HomeRoute()),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocProvider.value(
        value: _profileCubit,
        child: BlocBuilder<ProfileCubit, BaseState<ProfileEntity>>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == StateStatus.failure) {
              return Center(child: Text('Ошибка: ${state.errorMessage}'));
            } else if (state.status == StateStatus.success) {
              final profile = state.model!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).manager,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(S.of(context).guides, style: FontStyles.bodyText),
                    SizedBox(height: 20),
                    Text(S.of(context).users, style: FontStyles.bodyText),
                    SizedBox(height: 20),
                    Text(S.of(context).blacklist, style: FontStyles.bodyText),
                    const SizedBox(height: 24),

                    CustomDropDownButton(),
                    const SizedBox(height: 24),
                    Text(
                      S.of(context).generalinfo,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      S.of(context).authortours,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomDropDownButton(),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      hintText: S.of(context).firstandlastname,
                      label: S.of(context).fullname,
                    ),
                    const SizedBox(height: 24),

                    _buildAvatarAndName(profile, context),
                    const SizedBox(height: 24),
                    Text(S.of(context).nameuser),
                    CustomTextFormField(
                      hintText: '@nickeName',
                      label: "@${profile.nickname}",
                    ),
                    SizedBox(height: 12),
                    Text('День рождения', style: FontStyles.bodyLarge),
                    CustomTextFormField(
                      hintText: '20.02.2025',
                      label: ' ${profile.birthDate.toString()}',
                      onTap: _pickDate,
                    ),
                    SizedBox(height: 12),
                    Text(S.of(context).enteremail, style: FontStyles.bodyLarge),
                    CustomTextFormField(
                      label: profile.email.toString(),
                      hintText: 'example@mail.com',

                      validator: validateEmail,
                    ),
                    SizedBox(height: 12),
                    Text(
                      S.of(context).phonenumber,
                      style: FontStyles.bodyLarge,
                    ),
                    SizedBox(height: 12),

                    CustomTextFormField(
                      hintText: '+996(000) 12-34-56',
                      label: profile.phoneNumber,

                      keyboardType: TextInputType.phone,
                    ),

                    Text(
                      S.of(context).gettingstarted,
                      style: FontStyles.bodyLarge,
                    ),
                    CustomTextFormField(
                      hintText: '11.11.2025',
                      label: profile.workStartDate.toString(),
                    ),

                    Text(S.of(context).roles, style: FontStyles.bodyLarge),
                    CustomTextFormField(
                      hintText: S.of(context).seniormanager,
                      label: profile.roles.toString(),
                    ),
                    Text(
                      S.of(context).lasttimeofentry,
                      style: FontStyles.bodyLarge,
                    ),
                    CustomTextFormField(
                      hintText: '20.05.2025',
                      label: profile.lastLogin.toString(),
                    ),
                    SizedBox(height: 12),
                    Text(
                      S.of(context).guidedescription,
                      style: FontStyles.bodyLarge,
                    ),

                    CustomTextFormField(
                      hintText: S.of(context).guidedescription,
                      label: profile.description.toString(),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

void _showDeleteAvatarDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (_) => ProfileAlertDialog(
          text: S.of(context).loadavatar,
          title: S.of(context).deleteavatar,
        ),
  );
}

void _showLoadedAvatarDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (_) => ProfileAlertDialog(text: '', title: S.of(context).uploadAvatar),
  );
}

Widget _buildAvatarAndName(ProfileEntity profile, BuildContext context) {
  return Row(
    children: [
      CircleAvatar(radius: 50, backgroundImage: NetworkImage(profile.image)),
      const SizedBox(width: 20),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profile.fullName ?? S.of(context).lastname,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _showLoadedAvatarDialog(context),
            child: Text(
              'Загрузить новое фото',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => _showDeleteAvatarDialog(context),
            child: Text('Удалить фото', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ],
  );
}

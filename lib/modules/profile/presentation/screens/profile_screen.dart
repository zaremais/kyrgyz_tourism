import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drop_down_button.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_text_formfield.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/cubit/profile_cubit.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/widgets/profile_alert_dialog.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileCubit = di<ProfileCubit>()..getProfile();
  DateTime? _selectedDate;

  // @override
  // void initState() {
  //   super.initState();
  //   _profileCubit.getProfile();
  // }

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
          (_) =>
              ProfileAlertDialog(text: '', title: S.of(context).uploadAvatar),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: _selectedDate ?? DateTime(2000),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.router.push(HomeRoute()),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocProvider.value(
        value: _profileCubit,
        child: BlocConsumer<ProfileCubit, BaseState<ProfileEntity>>(
          listener: (context, state) {
            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage?.toString() ?? 'Ошибка'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == StateStatus.failure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ошибка загрузки профиля'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _profileCubit.getProfile(),
                      child: const Text('Попробовать снова'),
                    ),
                  ],
                ),
              );
            }

            if (state.status == StateStatus.success && state.model != null) {
              final profile = state.model!;
              return _buildProfileContent(profile, context);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(ProfileEntity profile, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildManagementSection(context),
          const SizedBox(height: 24),

          _buildGeneralInfoSection(profile),
          const SizedBox(height: 24),

          _buildAuthorToursSection(),
          const SizedBox(height: 30),

          _buildProfileInfoSection(profile, context),
        ],
      ),
    );
  }

  Widget _buildManagementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).manager,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Text(S.of(context).guides, style: FontStyles.bodyText),
        const SizedBox(height: 20),
        Text(S.of(context).users, style: FontStyles.bodyText),
        const SizedBox(height: 20),
        Text(S.of(context).blacklist, style: FontStyles.bodyText),
      ],
    );
  }

  Widget _buildGeneralInfoSection(ProfileEntity profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).generalinfo,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          hintText: S.of(context).firstandlastname,
          label: S.of(context).fullname,
        ),
      ],
    );
  }

  Widget _buildAuthorToursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).authortours,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const CustomDropDownButton(),
      ],
    );
  }

  Widget _buildProfileInfoSection(ProfileEntity profile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAvatarSection(profile, context),
        const SizedBox(height: 24),

        _buildProfileFields(profile),
      ],
    );
  }

  Widget _buildAvatarSection(ProfileEntity profile, BuildContext context) {
    return Row(
      children: [
        _buildSafeAvatar(profile.image),
        const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.fullName ?? 'ФИО не указано',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              _buildAvatarButtons(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSafeAvatar(String? imageUrl) {
    final hasValidImage = imageUrl != null && imageUrl.isNotEmpty;

    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey[300],
      backgroundImage: hasValidImage ? NetworkImage(imageUrl) : null,
      child:
          hasValidImage
              ? null
              : const Icon(Icons.person, size: 40, color: Colors.grey),
    );
  }

  Widget _buildAvatarButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => _showLoadedAvatarDialog(context),
          child: const Text(
            'Загрузить новое фото',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () => _showDeleteAvatarDialog(context),
          child: const Text(
            'Удалить фото',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileFields(ProfileEntity profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileField(
          title: S.of(context).nameuser,
          value: profile.nickname,
          hint: '@nickeName',
        ),

        _buildDateField(
          title: 'День рождения',
          value: profile.birthDate?.toString(),
          hint: '20.02.2025',
          onTap: _pickDate,
        ),

        _buildProfileField(
          title: S.of(context).enteremail,
          value: profile.email,
          hint: 'example@mail.com',
          validator: validateEmail,
        ),

        _buildProfileField(
          title: S.of(context).phonenumber,
          value: profile.phoneNumber,
          hint: '+996(000) 12-34-56',
          keyboardType: TextInputType.phone,
        ),

        _buildProfileField(
          title: S.of(context).gettingstarted,
          value: profile.workStartDate?.toString(),
          hint: '11.11.2025',
        ),

        _buildProfileField(
          title: S.of(context).roles,
          value: profile.roles.join(', '),
          hint: S.of(context).seniormanager,
        ),

        _buildProfileField(
          title: S.of(context).lasttimeofentry,
          value: profile.lastLogin?.toString(),
          hint: '20.05.2025',
        ),

        _buildProfileField(
          title: S.of(context).guidedescription,
          value: profile.description,
          hint: S.of(context).guidedescription,
        ),
      ],
    );
  }

  Widget _buildProfileField({
    required String title,
    required String? value,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: FontStyles.bodyLarge),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: hint,
          label: value ?? '',
          keyboardType: keyboardType,
          validator: validator,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateField({
    required String title,
    required String? value,
    required String hint,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: FontStyles.bodyLarge),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: hint,
          label: '',

          //  "${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}"
          onTap: onTap,
          // readOnly: true,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }
}

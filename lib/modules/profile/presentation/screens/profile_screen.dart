import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/constants/validator.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drop_down_button.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
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
        appBar: CustomAppBar(height: 80, onPressed: () {}),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).authortours,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30),
          CustomDropDownButton(),
          CustomTextFormField(
            hintText: S.of(context).firstandlastname,
            label: S.of(context).fullname,
            controller: _fullNameController,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? S.of(context).yourfullname
                        : null,
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
                      S.of(context).uploadnewphoto,
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showDeleteAvatarDialog(context),
                    child: Text(
                      S.of(context).deletephoto,
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(S.of(context).nameuser),
          CustomTextFormField(
            hintText: '@nickeName',
            label: '@nickeName',
            controller: _nickNameController,
            validator: (v) {
              if (v?.trim().isEmpty ?? true) {
                return S.of(context).enternickename;
              }
              if (!v!.startsWith('@')) return S.of(context).nicknamestart;
              return null;
            },
          ),

          CustomTextFormField(
            hintText: '20.02.2025',
            label: S.of(context).dateofbirth,
            controller: _birthDateController,
            onTap: _pickDate,
            validator:
                (v) =>
                    (v?.trim().isEmpty ?? true)
                        ? S.of(context).selectdateofbirth
                        : null,
          ),
          CustomTextFormField(
            label: S.of(context).email,
            hintText: 'example@mail.com',
            controller: _emailController,
            validator: validateEmail,
          ),
          CustomTextFormField(
            hintText: '+996(000) 12-34-56',
            label: S.of(context).phone,
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator:
                (v) =>
                    (v?.trim().isEmpty ?? true)
                        ? S.of(context).enterphone
                        : null,
          ),
          CustomTextFormField(
            hintText: '11.11.2025',
            label: S.of(context).gettingstarted,
            controller: _startDayContorller,
          ),

          CustomTextFormField(
            hintText: S.of(context).seniormanager,
            label: S.of(context).roles,
            controller: _employeeController,
          ),
          CustomTextFormField(
            hintText: '20.05.2025',
            label: S.of(context).lasttimeofentry,
            controller: _endDayController,
          ),
          SizedBox(height: 12),
          Text(S.of(context).guidedescription, style: FontStyles.bodyLarge),
          CustomTextFormField(
            hintText: S.of(context).guidedescription,
            label:
                'Профессиональный гид, который проводит экскурсии по Кыргызстану. Любит свою работу и считает, что это лучшее занятие в мире! ',
            controller: _statusController,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).profileupdated)),
                );
              }
            },
            text: S.of(context).savechanges,
            backgroundColor: AppColors.buttonGuide,
          ),

          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).cancel,
                style: TextStyle(color: Colors.black),
              ),
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

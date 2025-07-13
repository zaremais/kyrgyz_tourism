import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/widgets/auth_button.dart';

@RoutePage()
class TelegramPhoneScreen extends StatelessWidget {
  final List<String> codes = [
    '+996',
    '+7',
    '+81',
    '+92',
    '+994',
    '+971',
    '+380',
  ];

  TelegramPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneInputCubit(),
      child: BlocBuilder<PhoneInputCubit, PhoneInputState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                        ),

                        const Text(
                          'Вход',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () => context.router.pop(),
                          icon: const Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 120),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: state.code,
                          items:
                              codes
                                  .map(
                                    (code) => DropdownMenuItem(
                                      value: code,
                                      child: Text(code),
                                    ),
                                  )
                                  .toList(),
                          onChanged:
                              (val) => context
                                  .read<PhoneInputCubit>()
                                  .changeCode(val!),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            onChanged:
                                (val) => context
                                    .read<PhoneInputCubit>()
                                    .changePhone(val),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.status == PhoneValidationStatus.invalid)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Не удалось определить',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    Spacer(),
                    AuthButton(
                      text: 'Далее',
                      onPressed: () {
                        context.router.replace(TelegramChatBotRoute());
                        // context.read<PhoneInputCubit>().submit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum PhoneValidationStatus { initial, valid, invalid }

class PhoneInputState {
  final String code;
  final String phone;
  final PhoneValidationStatus status;

  PhoneInputState({
    this.code = '+996',
    this.phone = '',
    this.status = PhoneValidationStatus.initial,
  });

  PhoneInputState copyWith({
    String? code,
    String? phone,
    PhoneValidationStatus? status,
  }) {
    return PhoneInputState(
      code: code ?? this.code,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }
}

class PhoneInputCubit extends Cubit<PhoneInputState> {
  PhoneInputCubit() : super(PhoneInputState());

  void changeCode(String code) => emit(state.copyWith(code: code));

  void changePhone(String phone) => emit(state.copyWith(phone: phone));

  void submit() {
    final phone = state.phone.trim();
    if (phone.length >= 6 && phone.length <= 12) {
      emit(state.copyWith(status: PhoneValidationStatus.valid));
    } else {
      emit(state.copyWith(status: PhoneValidationStatus.invalid));
    }
  }
}

enum TelegramStatus { initial, loading, success, failure }

class TelegramActivationState {
  final TelegramStatus status;
  const TelegramActivationState({this.status = TelegramStatus.initial});
}

class TelegramActivationCubit extends Cubit<TelegramActivationState> {
  TelegramActivationCubit() : super(const TelegramActivationState());

  void checkTelegramActivation() async {
    emit(const TelegramActivationState(status: TelegramStatus.loading));

    await Future.delayed(const Duration(seconds: 1));

    final success = true;
    emit(
      TelegramActivationState(
        status: success ? TelegramStatus.success : TelegramStatus.failure,
      ),
    );
  }
}

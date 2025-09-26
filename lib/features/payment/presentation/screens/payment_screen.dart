import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/features/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/features/payment/domain/usecases/get_payment_qr_code_use_case.dart';
import 'package:kyrgyz_tourism/features/payment/presentation/cubit/payment_cubit.dart';

@RoutePage()
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 70,
          onPressed: () {
            context.router.pop();
          },
        ),
        body: BlocProvider.value(
          value: _paymentCubit,

          child: const _PaymentViewWidget(),
        ),
      ),
    );
  }
}

final _paymentCubit =
    di<PaymentCubit>()..loadPaymentQr(QrCodeParams(amount: 0));

class _PaymentViewWidget extends StatelessWidget {
  const _PaymentViewWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      height: 600,
      width: 380,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<PaymentCubit, BaseState<PaymentQrEntity>>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == StateStatus.failure) {
              return Center(child: Text("Ошибка: ${state.errorMessage}"));
            }

            if (state.status == StateStatus.success && state.model != null) {
              final qrBytes = state.model!.qrBytes;
              return Column(
                children: [
                  const Text('II. Оплата тура', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  Image.memory(qrBytes, height: 200),
                  const SizedBox(height: 20),
                  const Text(
                    "Отсканируйте QR-код",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Либо оплатите по номеру телефона',
                      hintText: '+996 XXX XXX XXX',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        labelText: '          Введите промокод',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Итого к оплате: ${state.model!.amount} сом',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(IsBookedRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonGuide,
                      ),
                      child: const Text('Забронировать'),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

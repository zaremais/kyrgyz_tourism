import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/applay_promocode_use_case.dart';
import 'package:kyrgyz_tourism/modules/payment/presentation/cubit/confirm_booked_cubit.dart';
import 'package:kyrgyz_tourism/modules/payment/presentation/cubit/payment_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class TourPaymentScreen extends StatefulWidget {
  const TourPaymentScreen({super.key});

  @override
  State<TourPaymentScreen> createState() => _TourPaymentScreenState();
}

class _TourPaymentScreenState extends State<TourPaymentScreen> {
  final _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  final _paymentCubit = di<PaymentCubit>()..getPaymentInfo();
  final _confirmCubit = di<ConfirmBookedCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оплата тура'), centerTitle: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _paymentCubit),
          BlocProvider.value(value: _confirmCubit),
        ],
        child: BlocBuilder<PaymentCubit, BaseState<PaymentEntity>>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == StateStatus.failure) {
              return Center(child: Text('Ошибка: //${state.errorMessage}'));
            }

            final data = state.model;
            if (data == null) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'II. Оплата тура',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  QrImageView(
                    data: data.qrUrl,
                    size: 200,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Отсканируйте QR-код',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Либо оплатите по номеру телефона',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _promoController,
                    decoration: InputDecoration(
                      hintText: 'Введите промокод',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Итого к оплате: ${data.amount} сом',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      _paymentCubit.applyCode(PromocodeParams(code: 12345));
                    },
                    child: const Text('Применить промокод'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      _confirmCubit.confirm();

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Тур успешно забронирован!'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        context.router.push(const HomeRoute());
                      }
                    },
                    child: const Text('Забронировать'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

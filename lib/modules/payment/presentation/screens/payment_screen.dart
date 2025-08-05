import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';

@RoutePage()
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Uint8List? qrCodeBytes;
  int amount = 2000;

  Future<Uint8List?> fetchQrCode(int amount) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'http://34.18.76.114/v1/api/qr/mbank',
        queryParameters: {'amount': amount},
        options: Options(
          responseType: ResponseType.bytes,
        ), // Получаем байты изображения
      );
      return response.data;
    } catch (e) {
      print('Ошибка при загрузке QR-кода: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadQrCode();
  }

  Future<void> _loadQrCode() async {
    final bytes = await fetchQrCode(amount);
    setState(() => qrCodeBytes = bytes);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(height: 70),
        body: Container(
          margin: EdgeInsets.all(24),
          height: 600,
          width: 380,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('II. Оплата тура'),
                SizedBox(height: 20),
                if (qrCodeBytes != null)
                  Image.memory(qrCodeBytes!, height: 200)
                else
                  CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "Отсканируйте QR-коде",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Либо оплатите по номеру телефона',
                    hintText: '+996 XXX XXX XXX',
                  ),

                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '          Введите промокод',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Итого к оплате: $amount сом',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonGuide,
                    ),
                    child: Text('Забронировать'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

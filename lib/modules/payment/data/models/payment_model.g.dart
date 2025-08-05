// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map json) => PaymentModel(
  amount: (json['amount'] as num).toInt(),
  qrUrl: json['qrUrl'] as String,
);

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{'amount': instance.amount, 'qrUrl': instance.qrUrl};

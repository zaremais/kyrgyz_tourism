import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends PaymentEntity {
  PaymentModel({required super.amount, required super.qrUrl});

  factory PaymentModel.fromJson(JSON json) => _$PaymentModelFromJson(json);

  JSON toJson() => _$PaymentModelToJson(this);
}

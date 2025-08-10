import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/entities/contact_entity.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel extends ContactEntity {
  ContactModel({
    required super.fullName,
    required super.phoneNumber,
    required super.email,
    required super.comment,
  });

  factory ContactModel.fromJson(JSON json) => _$ContactModelFromJson(json);
  JSON toJson() => _$ContactModelToJson(this);
}

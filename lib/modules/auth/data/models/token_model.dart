import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/token_einity.dart';

part 'token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenModel extends TokenEntity {
  @JsonKey(fromJson: DataModel.fromJson, toJson: dataToJson)
  final DataModel dat;
  TokenModel({required super.message, required super.error, required this.dat})
    : super(data: dat);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

@JsonSerializable()
class DataModel extends DataEntity {
  DataModel({
    required super.idRole,
    required super.idUser,
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

Map<String, dynamic> dataToJson(DataModel data) => data.toJson();

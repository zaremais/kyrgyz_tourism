// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
  message: json['message'] as String,
  error: json['error'] as bool,
  dat: DataModel.fromJson(json['dat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'dat': dataToJson(instance.dat),
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
  idRole: (json['idRole'] as num).toInt(),
  idUser: (json['idUser'] as num).toInt(),
  token: json['token'] as String,
);

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
  'idRole': instance.idRole,
  'idUser': instance.idUser,
  'token': instance.token,
};

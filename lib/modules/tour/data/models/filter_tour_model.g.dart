// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterTourModel _$FilterTourModelFromJson(Map json) => FilterTourModel(
  oneDay: json['oneDay'] as bool,
  longTerm: json['longTerm'] as bool,
  guideIncluded: json['guideIncluded'] as bool,
  withAccommodation: json['withAccommodation'] as bool,
  withFood: json['withFood'] as bool,
  smallGroup: json['smallGroup'] as bool,
  bigGroup: json['bigGroup'] as bool,
  difficulty: $enumDecodeNullable(_$TourDifficultyEnumMap, json['difficulty']),
  region: json['region'] as String,
);

Map<String, dynamic> _$FilterTourModelToJson(FilterTourModel instance) =>
    <String, dynamic>{
      'oneDay': instance.oneDay,
      'longTerm': instance.longTerm,
      'guideIncluded': instance.guideIncluded,
      'withAccommodation': instance.withAccommodation,
      'withFood': instance.withFood,
      'smallGroup': instance.smallGroup,
      'bigGroup': instance.bigGroup,
      'difficulty': _$TourDifficultyEnumMap[instance.difficulty],
      'region': instance.region,
    };

const _$TourDifficultyEnumMap = {
  TourDifficulty.easy: 'easy',
  TourDifficulty.medium: 'medium',
  TourDifficulty.hard: 'hard',
};

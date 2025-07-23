import 'package:json_annotation/json_annotation.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/filter_tour_entity.dart';
part 'filter_tour_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilterTourModel extends FilterTourEntity {
  FilterTourModel({
    required super.oneDay,
    required super.longTerm,
    required super.guideIncluded,
    required super.withAccommodation,
    required super.withFood,
    required super.smallGroup,
    required super.bigGroup,
    required super.difficulty,
    required super.region,
  });

  factory FilterTourModel.fromJson(JSON json) =>
      _$FilterTourModelFromJson(json);
  JSON toJson() => _$FilterTourModelToJson(this);
}

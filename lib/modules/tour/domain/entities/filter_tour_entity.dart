import 'package:kyrgyz_tourism/core/enums/state_status.dart';

class FilterTourEntity {
  final bool oneDay;
  final bool longTerm;
  final bool guideIncluded;
  final bool withAccommodation;
  final bool withFood;
  final bool smallGroup;
  final bool bigGroup;
  final TourDifficulty? difficulty;
  final String region;

  const FilterTourEntity({
    this.oneDay = false,
    this.longTerm = false,
    this.guideIncluded = false,
    this.withAccommodation = false,
    this.withFood = false,
    this.smallGroup = false,
    this.bigGroup = false,
    this.difficulty,
    this.region = '',
  });
}

//   FilterTourEntity copyWith({
//     bool? oneDay,
//     bool? longTerm,
//     bool? guideIncluded,
//     bool? withAccommodation,
//     bool? withFood,
//     bool? smallGroup,
//     bool? bigGroup,
//     TourDifficulty? difficulty,
//     String? region,
//   }) {
//     return FilterTourEntity(
//       oneDay: oneDay ?? this.oneDay,
//       longTerm: longTerm ?? this.longTerm,
//       guideIncluded: guideIncluded ?? this.guideIncluded,
//       withAccommodation: withAccommodation ?? this.withAccommodation,
//       withFood: withFood ?? this.withFood,
//       smallGroup: smallGroup ?? this.smallGroup,
//       bigGroup: bigGroup ?? this.bigGroup,
//       difficulty: difficulty ?? this.difficulty,
//       region: region ?? this.region,
//     );
//   }
// }

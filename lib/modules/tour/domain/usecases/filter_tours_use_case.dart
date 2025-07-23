// import 'package:injectable/injectable.dart';
// import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
// import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/entities/filter_tour_entity.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

// @injectable
// class FilterTourUseCase extends BaseUsecase<List<FilterTourEntity>, void> {
//   final TourDomainRepository _repository;

//   FilterTourUseCase({required TourDomainRepository repository})
//     : _repository = repository;

//   @override
//   Future<List<FilterTourEntity>> execute({required void params}) {
//     return _repository.filterTours();
//   }
// }

// class FilterTourParams {
//   final bool? oneDay;
//   final bool? longTerm;
//   final bool? guideIncluded;
//   final bool? withAccommodation;
//   final bool? withFood;
//   final bool? smallGroup;
//   final bool? bigGroup;
//   final String? difficulty;
//   final String? region;

//   FilterTourParams({
//     this.oneDay,
//     this.longTerm,
//     this.guideIncluded,
//     this.withAccommodation,
//     this.withFood,
//     this.smallGroup,
//     this.bigGroup,
//     this.difficulty,
//     this.region,
//   });

//   JSON toJson() {
//     return {
//       'oneDay': oneDay,
//       'longTerm': longTerm,
//       'guideIncluded': guideIncluded,
//       'withAccommodation': withAccommodation,
//       'withFood': withFood,
//       'smallGroup': smallGroup,
//       'bigGroup': bigGroup,
//       'difficulty': difficulty,
//       'region': region,
//     }..removeWhere((_, v) => v == null);
//   }
// }

// class FilterTourParams {
//   final bool oneDay;
//   final bool longTerm;
//   final bool guideIncluded;
//   final bool withAccommodation;
//   final bool withFood;
//   final bool smallGroup;
//   final bool bigGroup;
//   final String difficulty;
//   final String region;

//   FilterTourParams({
//    required this.oneDay,
//    required this.longTerm,
//    required this.guideIncluded,
//    required this.withAccommodation,
//    required this.withFood,
//    required this.smallGroup,
//    required this.bigGroup,
//    required this.difficulty,
//    required this.region,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'oneDay': oneDay,
//       'longTerm': longTerm,
//       'guideIncluded': guideIncluded,
//       'withAccommodation': withAccommodation,
//       'withFood': withFood,
//       'smallGroup': smallGroup,
//       'bigGroup': bigGroup,
//       'difficulty': difficulty,
//       'region': region,
//     };
//   }
// }

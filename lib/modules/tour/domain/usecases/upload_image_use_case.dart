// import 'dart:io';

// import 'package:injectable/injectable.dart';
// import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

// @injectable
// class UploadImageUseCase extends BaseUsecase<String, File> {
//   final TourDomainRepository _repository;

//   UploadImageUseCase({required TourDomainRepository repository})
//     : _repository = repository;

//   @override
//   Future<String> execute({required File params}) async {
//     return _repository.uploadImage(params);
//   }
// }

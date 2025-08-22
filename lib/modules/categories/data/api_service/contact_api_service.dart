import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/modules/categories/data/models/contact_model.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/usecases/send_contact_use_case.dart';
import 'package:retrofit/retrofit.dart';

part 'contact_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
@injectable
abstract class ContactApiService {
  @factoryMethod
  factory ContactApiService(Dio dio, {@Named("BaseUrl") String baseUrl}) =
      _ContactApiService;

  @GET('/v1/api/contact-requests')
  Future<ContactModel> getContact();

  @POST('/v1/api/contact-requests')
  Future<ContactModel> sendContact(@Body() ContactParams params);
}

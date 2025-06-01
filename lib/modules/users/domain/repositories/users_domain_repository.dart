import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';

abstract class UsersDomainRepository {
  Future<List<UsersEntity>> getUsers();
}

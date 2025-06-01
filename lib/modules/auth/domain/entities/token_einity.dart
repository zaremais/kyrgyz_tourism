class TokenEntity {
  final DataEntity? data;
  final String message;
  final bool error;

  TokenEntity({required this.message, required this.error, required this.data});
}

class DataEntity {
  final int idRole;
  final int idUser;
  final String token;

  DataEntity({required this.idRole, required this.idUser, required this.token});
}

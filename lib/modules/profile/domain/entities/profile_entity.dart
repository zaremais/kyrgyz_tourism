class ProfileEntity {
  final String? fullName;
  final String? birthDate;
  final String? workStartDate;
  final String? lastLogin;
  final String? description;
  final int? id;
  final String? name;
  final String nickname;
  final String? email;
  final String image;
  final String phoneNumber;
  final List<String> roles;

  const ProfileEntity({
    this.fullName,
    this.birthDate,
    this.workStartDate,
    this.lastLogin,
    this.description,
    required this.id,
    required this.name,
    required this.nickname,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.roles,
  });
}

class UserModel {
  final String mail;
  final String? username;
  final String userUUID;
  final bool emailVerified;

  UserModel({
    required this.mail,
    this.username,
    required this.userUUID,
    required this.emailVerified,
  });
}

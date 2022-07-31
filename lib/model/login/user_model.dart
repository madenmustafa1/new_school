class UserModel {
  final String mail;
  final String? username;
  final String userUUID;
  final bool? emailVerified;
  final String? nameSurname;
  final String? profileUrl;

  UserModel({
    required this.mail,
    this.username,
    this.nameSurname,
    required this.userUUID,
    this.emailVerified,
    this.profileUrl,
  });

  Map<String, dynamic> asMap() => {
        'nameSurname': nameSurname,
        'mail': mail,
        'userUUID': userUUID,
        'username': username,
        'profileUrl': profileUrl,
        'emailVerified': emailVerified,
      };

  UserModel.fromJson(Map<String, dynamic> json)
      : nameSurname = json['nameSurname'],
        mail = json['mail'],
        userUUID = json['userUUID'],
        username = json['username'],
        emailVerified = json['emailVerified'],
        profileUrl = json['profileUrl'];
}

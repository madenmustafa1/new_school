class UserModel {
  final String mail;
  final String? username;
  final String userUUID;
  final bool? emailVerified;
  final String? nameSurname;

  UserModel({
    required this.mail,
    this.username,
    this.nameSurname,
    required this.userUUID,
    this.emailVerified,
  });

 Map<String, dynamic> asMap() => {
      'nameSurname': nameSurname,
      'mail': mail,
      'userUUID': userUUID,
      'username': username,
  };

  Map<String, dynamic> toMap() {
    return {
      'nameSurname': nameSurname,
      'mail': mail,
      'userUUID': userUUID,
      'username': username,
    };

    var map = <String, dynamic>{};
    if (nameSurname != null) {
      map["nameSurname"] = nameSurname;
    }
    map["mail"] = mail;
    map["username"] = username;
    map["userUUID"] = userUUID;
    return map;
  }
}

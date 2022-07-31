class PostModel {
  final String videoUrl;
  final String description;
  final String nameSurname;
  final String? profilePhotoUrl;
  final String videoName;
  final String uuid;
  final int like;
  final List<String> comment;
  final String subject;
  final String email;

  PostModel({
    required this.videoUrl,
    required this.description,
    required this.nameSurname,
    required this.profilePhotoUrl,
    required this.videoName,
    required this.uuid,
    required this.like,
    required this.comment,
    required this.subject,
    required this.email,
  });

    Map<String, dynamic> asMap() => {
        'videoUrl': videoUrl,
        'description': description,
        'uuid': uuid,
        'nameSurname': nameSurname,
        'profilePhotoUrl': profilePhotoUrl,
        'videoName': videoName,
        'like': like,
        'comment': comment,
        'subject': subject,
        'email': email,
      };

        PostModel.fromJson(Map<String, dynamic> json)
      : videoUrl = json['videoUrl'],
        description = json['description'],
        uuid = json['uuid'],
        nameSurname = json['nameSurname'],
        profilePhotoUrl = json['profilePhotoUrl'],
        videoName = json['videoName'],
        like = json['like'],
        comment =  List.from(json['comment']),
        subject = json['subject'],
        email = json['email'];
}

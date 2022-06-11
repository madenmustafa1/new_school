class PostModel {
  final String videoUrl;
  final String description;
  final String nameSurname;
  final String profilePhotoUrl;
  final String videoName;
  final String uuid;
  final int like;
  final List<String> comment;
  final String subject;

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
  });
}

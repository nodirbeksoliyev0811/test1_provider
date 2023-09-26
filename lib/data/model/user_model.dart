class UserModel {
  final int userId;
  final int id;
  final String title;

  UserModel({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}

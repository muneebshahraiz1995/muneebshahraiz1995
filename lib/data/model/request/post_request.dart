class PostRequest {
  final String title;
  final int userId;

  PostRequest({required this.title, required this.userId});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'userId': userId,
    };
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostResponse {
  final int id;
  final String title;
  final int userId;
  // Add other fields as needed

  PostResponse({required this.id, required this.title, required this.userId});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      // Map other fields from JSON response to corresponding fields in the class
    );
  }

  PostResponse copyWith({
    int? id,
    String? title,
    int? userId,
  }) {
    return PostResponse(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
    );
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({required this.id, required this.userId, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int, 'id must be an integer');
    assert(json['userId'] is int, 'userId must be an integer');
    assert(json['title'] is String, 'title must be a string');
    assert(json['body'] is String, 'body must be a string');

    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

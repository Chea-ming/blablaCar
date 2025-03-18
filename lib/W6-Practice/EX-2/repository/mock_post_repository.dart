import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPost() async {
    await Future.delayed(Duration(seconds: 5));
    return [
    ];
  }
}

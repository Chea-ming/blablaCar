import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W6-Practice/EX-2/repository/http_posts_repository.dart';

import '../../model/post.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final HttpPostsRepository _repository;

  AsyncValue<List<Post>>? postsValue;

  PostProvider({required HttpPostsRepository repository}) : _repository = repository;

  void fetchPost() async {
    // 1-  Set loading state
    postsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      List<Post> posts = await _repository.getPosts();

      // 3  Set success state
      postsValue = AsyncValue.success(posts);
    } catch (error) {
      // 4  Set error state
      postsValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}

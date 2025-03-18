import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week_3_blabla_project/W6-Practice/EX-2/repository/http_posts_repository.dart';

import 'package:provider/provider.dart';
import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  HttpPostsRepository postRepo = HttpPostsRepository(http.Client());

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: postRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}

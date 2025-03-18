import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';

class HttpPostsRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final http.Client _client;

  HttpPostsRepository(this._client);

  Future<List<Post>> getPosts() async {
    final response = await _client.get(Uri.parse('$_baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body); 
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  
}

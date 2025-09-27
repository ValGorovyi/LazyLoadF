import 'package:big_study/httpLes/domein/api/postsApi.dart';
import 'package:big_study/httpLes/domein/apiClient/apiClient.dart';
import 'package:flutter/material.dart';

class modelApi extends ChangeNotifier {
  var _posts = <Posts>[];
  List<Posts> get posts => _posts;
  final apiCl = ApiClient();

  Future<void> reloadPosts() async {
    final posts = await apiCl.getPosts();
    _posts += posts;
    notifyListeners();
  }

  Future<void> createPosts() async {
    final demoPost = await apiCl.createPost();
    notifyListeners();
  }
}

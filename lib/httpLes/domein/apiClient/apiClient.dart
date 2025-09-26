// my data for responce to serv
import 'dart:convert';
import 'dart:io';

import 'package:big_study/httpLes/domein/api/postsApi.dart';

class ApiClient {
  final client = HttpClient();
  Future<List<Posts>> getPosts() async {
    // final myUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // final myRequest = await client.getUrl(myUrl);
    // // myRequest.headers.set(
    // //   HttpHeaders.userAgentHeader,
    // //   'Mozilla/5.0 (compatible; Dart)',
    // // );
    // myRequest.headers.set(HttpHeaders.acceptHeader, 'application/json');
    // final myResponce = await myRequest.close();
    // final jsonSrtings = await myResponce.transform(utf8.decoder).toList();
    // final jsonString = jsonSrtings.join();
    final json =
        await myGetterPosts('https://jsonplaceholder.typicode.com/posts')
            as List<dynamic>;
    final posts = json
        .map((dynamic elem) => Posts.fromJson(elem as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<dynamic> myGetterPosts(String urlAddress) async {
    final myUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final myRequest = await client.getUrl(myUrl);
    // myRequest.headers.set(
    //   HttpHeaders.userAgentHeader,
    //   'Mozilla/5.0 (compatible; Dart)',
    // );
    myRequest.headers.set(HttpHeaders.acceptHeader, 'application/json');
    final myResponce = await myRequest.close();
    final jsonSrtings = await myResponce.transform(utf8.decoder).toList();
    final jsonString = jsonSrtings.join();
    return jsonDecode(jsonString);
  }
}

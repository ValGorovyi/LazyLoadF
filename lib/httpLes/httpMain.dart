import 'package:big_study/httpLes/domein/apiClient/apiClient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UpperApiW()));
}

class UpperApiW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiClient().getPosts();
    return Scaffold(
      appBar: AppBar(title: Text('Api lesson')),
      body: SafeArea(child: Center()),
    );
  }
}

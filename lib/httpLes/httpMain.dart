import 'package:big_study/httpLes/domein/apiClient/apiClient.dart';
import 'package:big_study/httpLes/domein/inheritData/inheritApi.dart';
import 'package:big_study/httpLes/domein/inheritData/modelApi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UpperApiW()));
}

class UpperApiW extends StatefulWidget {
  @override
  State<UpperApiW> createState() => _UpperApiWState();
}

class _UpperApiWState extends State<UpperApiW> {
  final model = modelApi();
  @override
  Widget build(BuildContext context) {
    ApiClient().getPosts();
    return Scaffold(
      appBar: AppBar(title: Text('Api lesson')),
      body: SafeArea(
        child: apiInherit(
          model: model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ReloadButton(),
              _CreateButton(),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
                  child: _PostsW(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => apiInherit.read(context)?.model.reloadPosts(),
      child: Text('Reload Posts'),
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => apiInherit.read(context)?.model.createPosts(),
      child: Text('Create Posts'),
    );
  }
}

class _PostsW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiInherit.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return PostRowW(index: index);
      },
    );
  }
}

class PostRowW extends StatelessWidget {
  final int index;
  const PostRowW({required this.index});
  @override
  Widget build(BuildContext context) {
    final post = apiInherit.read(context)!.model.posts[index];
    return Column(
      children: [
        Text(post.body),
        SizedBox(height: 18),
        Text(post.userID.toString()),
        SizedBox(height: 18),
        Text(post.title),
        SizedBox(height: 18),
      ],
    );
  }
}

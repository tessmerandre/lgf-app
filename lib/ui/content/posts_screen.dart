import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreen createState() => _PostsScreen();
}

class _PostsScreen extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Posts screen"),);
  }
}

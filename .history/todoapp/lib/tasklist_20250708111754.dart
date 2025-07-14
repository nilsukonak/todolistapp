import 'package:flutter/material.dart';
import 'package:flutteranimation/Models/Post.dart';
import 'package:todoapp/screens/tasks.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  List<Post> posts =[
    Post('persın1',Icons.check_box),
    Post('persın2',Icons.check_box),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.indigoAccent,
          child: ListTile(
            leading: Icon(
              posts[index].icon,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              posts[index],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),

            ),
          ),
        );
      },
    ),
  }
}

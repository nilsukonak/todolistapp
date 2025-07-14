import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/screens/tasks.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

List<Taskmodel> tasklist = [];

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            itemCount: tasklist.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasklist[index];
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(value: false, onChanged: (value) => value),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title),
                      Text(task.date),
                      Text(task.category),
                      Text(task.priority),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

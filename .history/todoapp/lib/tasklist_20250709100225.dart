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
              bool ischecked = false;
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(
                    value: ischecked,
                    onChanged: (bool? value) {
                      setState(() {
                        ischecked = value!;
                      });
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title),

                      Row(
                        children: [
                          Text(
                            'Due: ${task.date} ,',
                            style: TextStyle(
                              color: const Color.fromARGB(147, 0, 0, 0),
                            ),
                          ),
                          Text(
                            ' Priority: ${task.priority}',
                            style: TextStyle(
                              color: const Color.fromARGB(147, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
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

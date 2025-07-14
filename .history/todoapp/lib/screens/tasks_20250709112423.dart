import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/edittask.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/tasklist.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('TASK LİST '))),

      body: Column(
        children: [
          Row(
            children: [
              chipbox(),
              Chipapp(
                prioritycont: TextEditingController(),
                chiplist: ['all', 'completed', 'active'],
              ),
            ],
          ),

          Tasklist(),

          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Newtasks()),
                );
              },
              child: Text('+'),
            ),
          ),

          /*Butonsinif(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditTask(taskmodel: ,)),
                );
              },
              child: Text('save task '),
            ),
          ),*/
        ],
      ),
    );
  }
}

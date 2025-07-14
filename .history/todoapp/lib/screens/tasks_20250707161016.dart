import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/newtasks.dart';

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
          Text('gorevler'),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Newtasks()),
              );
            },
            child: Text('+'),
          ),

          Row(children: [chipbox(), Chipapp()]),

          Butonsinif(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tasks()),
                );
              },
              child: Text('save task '),
            ),
          ),
        ],
      ),
    );
  }
}

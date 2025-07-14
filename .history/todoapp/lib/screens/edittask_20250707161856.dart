import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('edit task')),
      body: Column(
        children: [
          Center(
            child: Ortaksinif(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'title'),
              ),
            ),
          ),
          sizedbox(),
          Ortaksinif(
            child: TextFormField(
              decoration: InputDecoration(labelText: 'title'),
            ),
          ),
          sizedbox(),
          Ortaksinif(
            child: TextFormField(
              decoration: InputDecoration(labelText: 'title'),
            ),
          ),
        ],
      ),
    );
  }
}

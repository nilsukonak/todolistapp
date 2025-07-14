import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/tasks.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.12),
            Center(
              child: Text(
                'Edit Task',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
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
          sizedbox(),
          Ortaksinif(child: DropdownMenuExample()),
          sizedbox(),
          Ortaksinif(child: DropdownMenuExample()),
          sizedbox(),
          Butonsinif(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tasks()),
                );
              },
              child: Text('edit task'),
            ),
          ),
        ],
      ),
    );
  }
}

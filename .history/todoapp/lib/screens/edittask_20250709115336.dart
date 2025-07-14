import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/tasklist.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key, required Taskmodel taskmodel});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Ortaksinif(
                  child: TextFormField(
                    controller: titlecont,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                ),
              ),
              sizedbox(),
              Ortaksinif(
                child: TextFormField(
                  controller: datecont,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ),
              sizedbox(),
              Datesec(),
              sizedbox(),
              Row(
                children: [
                  chipbox(),
                  Chipapp(
                    chiplist: ['Low', 'Medium', 'Heigh'],
                    prioritycont: prioritycont,
                  ),
                ],
              ),

              sizedbox(),
              Ortaksinif(child: DropdownMenuExample()),
              sizedbox(),
              Butonsinif(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                  ),
                  onPressed: () async {
                    final newTask = Taskmodel(
                      title: titlecont.text,
                      description: descriptioncont.text,
                      date: datecont.text,
                      priority: prioritycont.text,
                      category: categorycont.text,
                    );

                    tasklist.add(newTask);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Tasks()),
                    );
                  },
                  child: Text(
                    'Edit Task',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

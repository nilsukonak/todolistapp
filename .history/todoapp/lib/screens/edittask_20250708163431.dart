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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Ortaksinif(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                ),
              ),
              sizedbox(),
              Ortaksinif(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ),
              sizedbox(),
              Ortaksinif(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Date'),
                ),
              ),
              sizedbox(),
              Row(children: [chipbox(), Chipapp(prioritycont: prioritycont)]),

              sizedbox(),
              Ortaksinif(child: DropdownMenuExample()),
              sizedbox(),
              Butonsinif(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tasks()),
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

late TextEditingController titlecont;
late TextEditingController descriptioncont;
late TextEditingController datecont;
late TextEditingController prioritycont;
late TextEditingController categorycont;

class Edittask extends StatefulWidget {
  final Taskmodel taskmodel;

  const Edittask({required this.taskmodel, super.key});

  @override
  State<Edittask> createState() => _EdittaskState();
}

class _EdittaskState extends State<Edittask> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

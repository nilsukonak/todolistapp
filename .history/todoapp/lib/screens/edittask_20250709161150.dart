import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/tasklist.dart';

class EditTask extends StatefulWidget {
  final Taskmodel taskmodel;
  const EditTask({super.key, required this.taskmodel});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  void initState() {
    super.initState(); //oncei deeğrler gozuksn
    titlecont.text = widget.taskmodel.title; //taskmodl nerde olstrldu ?
    descriptioncont.text = widget.taskmodel.description;
    datecont.text = widget.taskmodel.date;
    prioritycont.text = widget.taskmodel.priority;
    categorycont.text = widget.taskmodel.category;
  }

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
                  controller: descriptioncont,
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
                    final updatetask = Taskmodel(
                      id: widget.taskmodel.id,
                      title: titlecont.text,
                      description: descriptioncont.text,
                      date: datecont.text,
                      priority: prioritycont.text,
                      category: categorycont.text,
                    );

                    // Task güncellemesi
                    int index = tasklist.indexOf(widget.taskmodel);
                    //taskmodelde hangi indexte oldunu stw widgetine sahip newwidgetten  cağırıp indeksini alıp indexe atıyoz
                    tasklist[index] = updatetask;

                    // Firestore güncelle
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    if (uid != null) {
                      print('Güncellenecek ID: ${widget.taskmodel.id}');

                      await FirebaseFirestore.instance
                          .collection('user')
                          .doc(uid)
                          .collection('tasks')
                          .doc(widget.taskmodel.id) // Belgenin ID’si
                          .update({
                            'title': updatetask.title,
                            'description': updatetask.description,
                            'date': updatetask.date,
                            'priority': updatetask.priority,
                            'category': updatetask.category,
                          });
                    }

                    Navigator.pop(context); // Sadece geri dön
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

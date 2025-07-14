import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> fetchTasksFromFirestore() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot =
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .collection('tasks')
            .get();

    final loadedTasks =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return Taskmodel(
            id: doc.id,
            title: data['title'] ?? '',
            description: data['description'] ?? '',
            date: data['date'] ?? '',
            priority: data['priority'] ?? '',
            category: data['category'] ?? '',
          );
        }).toList();

    setState(() {
      tasklist = loadedTasks;
    });
  }

  void initState() {
    //initstate old iicn  bu liste yalnızca bir kere tanımlanıyor sürekli sıfırlanmıyor yani bi kere calısır
    super.initState();

    fetchTasksFromFirestore(); //UYGULAMAYI İLK
  }

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
                onchipselected: (selected) {
                  if (selected == 'all') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tasks()),
                    );
                  } else if (selected == 'completed') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Completedpage()),
                    );
                  } else if (selected == 'active') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Activepage()),
                    );
                  }
                },
              ),
            ],
          ),

          Tasklist(),

          Butonsinif(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.height * 0.20,
                    MediaQuery.of(context).size.width * 0.08,
                  ),
                  backgroundColor: Colors.indigoAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Newtasks()),
                  );
                },

                child: Text(
                  'Add Task +',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
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

class Completedpage extends StatelessWidget {
  const Completedpage({super.key});

  @override
  Widget build(BuildContext context) {
    final completedTasks = tasklist.where((task) => task.isdone).toList();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = completedTasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            subtitle: Text("Due: ${task.date}"),
          );
        },
      ),
      // body: ,
    );
  }
}

class Activepage extends StatelessWidget {
  const Activepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blueGrey));
  }
}

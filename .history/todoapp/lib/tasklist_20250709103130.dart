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
  List<bool> ischeckedlist = [];
  @override
  void initState() {
    //
    super.initState();
    ischeckedlist = List.filled(
      tasklist.length,
      false,
    ); //listeyi görev sayısı kadar false ile doldurur hiçbi gorev işaretli değildr
  }

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
              //bool ischecked =
              // false; //bu tek basına olmuyo her render da sıfırlanıyo false oluyo o yuzden tıklanmıyo o yuzden list yapcz

              return Card(
                //tıklanablr olck edt sayfası acılsn diye
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(
                    value: ischeckedlist[index],
                    onChanged: (bool? value) {
                      setState(() {
                        ischeckedlist[index] = value!;
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

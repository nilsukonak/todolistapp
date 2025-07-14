import 'package:flutter/material.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/screens/edittask.dart';
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
    //initstate old iicn  bu liste yalnızca bir kere tanımlanıyor sürekli sıfırlanmıyor yani bi kere calısır
    super.initState();
    ischeckedlist = List.filled(
      tasklist.length,
      false,
    ); //kaç gorev eklersem bunun uzunlug kdr false ile doldur checklisti
  }

  @override
  Widget build(BuildContext context) {
    // Her seferinde listedeki görev sayısı kadar false değeri oluştur ??????? index sayısı listedeki şey syısına ulasamıydu o yuzden artk sorun olmick
    if (ischeckedlist.length != tasklist.length) {
      ischeckedlist = List.filled(tasklist.length, false);
    }
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            itemCount: tasklist.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasklist[index];

              return Card(
                //tıklanablr olck edt sayfası acılsn diye
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTask(taskmodel: task),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Checkbox(
                      value:
                          ischeckedlist[index], //????????? uygulamaya gorev ekledm ama yeniden baslatmka yerine hot restart yaptm bu durumda initstate bi kere calıstgı iicn gorev ekledkce tasklist.lenght 3 olsada bu 2 klaıoy mesela
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

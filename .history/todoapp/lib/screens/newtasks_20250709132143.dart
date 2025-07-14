import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/tasklist.dart';

final TextEditingController titlecont = TextEditingController();
final TextEditingController descriptioncont = TextEditingController();

final TextEditingController datecont = TextEditingController();

final TextEditingController prioritycont = TextEditingController();

final TextEditingController categorycont = TextEditingController();

class Newtasks extends StatefulWidget {
  const Newtasks({super.key});

  @override
  State<Newtasks> createState() => _NewtasksState();
}

class _NewtasksState extends State<Newtasks> {
  @override
  void initState() {
    super.initState();
    titlecont.clear();
    descriptioncont.clear();
    datecont.clear();
    prioritycont.clear();
    categorycont.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.12),
            Center(
              child: Text(
                'New Task',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Ortaksinif(
            child: TextFormField(
              controller: titlecont,
              decoration: InputDecoration(labelText: 'title'),
            ),
          ),
          sizedbox(),
          Ortaksinif(
            child: TextFormField(
              controller: descriptioncont,
              decoration: InputDecoration(labelText: 'description'),
            ),
          ),

          sizedbox(),

          Datesec(),
          sizedbox(),
          Ortaksinif(child: DropdownMenuExample()),
          sizedbox(),
          Row(
            children: [
              chipbox(),
              Chipapp(
                prioritycont: prioritycont,
                chiplist: ['Low', 'Medium', 'Heigh'],
              ),
            ],
          ),
          sizedbox(),
          Butonsinif(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),

              onPressed: () {
                final newTask = Taskmodel(
                  title: titlecont.text,
                  description: descriptioncont.text,
                  date: datecont.text,
                  priority: prioritycont.text,
                  category: categorycont.text,
                );

                tasklist.add(newTask); // listeye ekle

                // geri dönüp güncel listeyi göstermek için pop yerine push
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Tasks()),
                );

                // kontrolleri temizle (isteğe bağlı)
                titlecont.clear();
                descriptioncont.clear();
                datecont.clear();
                prioritycont.clear();
                categorycont.clear();
              },

              child: Text(
                'save task ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

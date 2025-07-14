import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:todoapp/classrenk.dart';
import 'package:todoapp/tasklist.dart';
import 'package:firebase_auth/firebase_auth.dart';

final TextEditingController titlecont = TextEditingController();
final TextEditingController descriptioncont = TextEditingController();

final TextEditingController datecont = TextEditingController();

final TextEditingController prioritycont = TextEditingController();

final TextEditingController categorycont = TextEditingController();

//firebaseden
final FirebaseAuth _auth = FirebaseAuth.instance;

String? get currentUserUid => _auth.currentUser?.uid;

//?????????? giriş yapms kullanıcıcnın uid degerini getter ile alıyoruz
class Newtasks extends StatefulWidget {
  const Newtasks({super.key});

  @override
  State<Newtasks> createState() => _NewtasksState();
}

class _NewtasksState extends State<Newtasks> {
  @override
  void initState() {
    //edittaskta duzenledgm son degerler new taskte de geliyodu bu yuzden temizledm
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

              onPressed: () async {
                final newTask = Taskmodel(
                  title: titlecont.text,
                  description: descriptioncont.text,
                  date: datecont.text,
                  priority: prioritycont.text,
                  category: categorycont.text,
                );

                //taskscollection sminde bir firestoreye referans olusturuyoz yani görevleri firestorede dogru yere kaydetmk icin kullanyoz
                final tasksCollection = FirebaseFirestore.instance
                    .collection('user')
                    .doc(currentUserUid)
                    .collection('tasks');

                //map seklinde mauel olrk koleksiyona yazıyoz
                await tasksCollection.add({
                  'title': newTask.title,
                  'description': newTask.description,
                  'date': newTask.date,
                  'priority': newTask.priority,
                  'category': newTask.category,
                });

                tasklist.add(newTask); // listeye ekle

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

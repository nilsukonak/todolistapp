import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

List<Taskmodel> tasklist = []; //görevleri local alcak olsaydm

class _TasklistState extends State<Tasklist> {
  List<bool> ischeckedlist = [];

  Future<void> fetchTasksFromFirestore() async {
    final uid =
        FirebaseAuth
            .instance
            .currentUser
            ?.uid; //suanda girş yapan kullanıcının idsini al yoksa null iilem yapılmz cıkılır
    if (uid == null) return;

    final snapshot =
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid) //girş yapan kullanıcın uidi
            .collection('tasks') //onun gorevleri
            .get(); // get ile çekiypruz

    final loadedTasks =
        snapshot.docs.map((doc) {
          //firestoredeki belgeelri alıp donusturuypruz
          final data = doc.data();
          return Taskmodel(
            id: doc.id,
            title:
                data['title'] ?? '', //firestorede o alan eksikse bos string ver
            description: data['description'] ?? '',
            date: data['date'] ?? '',
            priority: data['priority'] ?? '',
            category: data['category'] ?? '',
            isdone: data['isdone'] ?? false,
          );
        }).toList();

    //Her asenkron fonksiyonda await sonrası setState() çağırmadan önce if (!mounted) return; yaz.

    //Bu, widget’ın hâlâ aktif ve görünür olduğundan emin olur.

    if (!mounted)
      return; // <-- burada kontrol mesela edittask yaptm sonra login sayfasına geri geldm haat verdi cunu az onceki stateden baska statefula geldk ve bu sırada o widgetn statesi artk aagcta yoktur ve false olp haat verir uygulamada o yuzden setstate de hata verir cunku flutter artk o widgeti guncelleyemez o yuzden bastaki kontrolu yap
    setState(() {
      tasklist = loadedTasks;
    });
  }

  @override
  void initState() {
    //initstate old iicn  bu liste yalnızca bir kere tanımlanıyor sürekli sıfırlanmıyor yani bi kere calısır
    super.initState();
    ischeckedlist = List.filled(
      tasklist.length,
      false,
    ); //kaç gorev eklersem bunun uzunlug kdr false ile doldur checklisti
    fetchTasksFromFirestore(); //UYGULAMAYI İLK ACTIGIMZDA KULLANCI GİRŞ YAPINCA EKRANA HEMN CALISR CALISMAZ DBDEKİ GOREVLER YAZMAK İCN veriyi firestoreden alan futureli foksu çağırıyruz
  }

  @override
  Widget build(BuildContext context) {
    fetchTasksFromFirestore();
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
                        Text(
                          task.title,
                          style: TextStyle(
                            decoration:
                                ischeckedlist[index]
                                    ? TextDecoration
                                        .lineThrough //işaretliyse ciz
                                    : TextDecoration.none, //değilse norml yazı

                            fontSize: 16,
                          ),
                        ),

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

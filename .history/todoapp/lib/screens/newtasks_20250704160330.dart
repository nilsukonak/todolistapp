import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:todoapp/classrenk.dart';

final TextEditingController titlecontroller = TextEditingController();
final TextEditingController descriptioncontroller = TextEditingController();
final TextEditingController datecontroller = TextEditingController();

class Newtasks extends StatefulWidget {
  const Newtasks({super.key});

  @override
  State<Newtasks> createState() => _NewtasksState();
}

class _NewtasksState extends State<Newtasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Center(
          child: Text(
            'task ekleme',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tasks()),
                  );
                },
                child: Text('ekle'),
              ),
            ),
          ),

          Ortaksinif(
            child: TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(labelText: 'password'),
            ),
          ),
        ],
      ),
    );
  }
}

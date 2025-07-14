import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks.dart';

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
      body: Column(
        children: [
          SizedBox(height: 80),
          Center(
            child: Text(
              'task ekleme',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),

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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:todoapp/screens/tasks.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(value: false, onChanged: (value) => value),
                  title: Column(
                    children: [
                      Row(
                        //gorevlerden sırayla titleyi alcak
                      ),
                      Row(
                        //o gorevn priortysi  ve datesi az opak
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

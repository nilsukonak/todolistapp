import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/screens/signin.dart';

final containerrenk = const Color.fromARGB(253, 234, 232, 232);

class Ortaksinif extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final double? decoration;

  const Ortaksinif({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.child,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.06,
      //color: color ?? Colors.grey,
      child: child,
      decoration: BoxDecoration(
        color: const Color.fromARGB(253, 234, 232, 232),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

//containerler arası
class containersizedbox extends StatelessWidget {
  final double? height;

  const containersizedbox({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(height: MediaQuery.of(context).size.height * 0.03),
    );
  }
}

//butonlarn arasındaki bosluk
class sizedbox extends StatelessWidget {
  final double? height;

  const sizedbox({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(height: MediaQuery.of(context).size.height * 0.02),
    );
  }
}

//BUTONLAR
class Butonsinif extends StatelessWidget {
  final Widget child;

  final double? width;
  final double? height;

  const Butonsinif({Key? key, required this.child, this.width, this.height})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.92,
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      child: child,
    );
  }
}

const List<String> list = <String>['work', 'school', 'self'];
//String first = Text('Category').toString(); //varsayılan deger

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(child: DropdownMenuExample()),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;
  void initState() {
    super.initState();
    categorycont.text = dropdownValue; // ilk değer
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      //initialSelection: first.toString(),
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
          categorycont.text = value; // controller'a yaz
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}

//TAKVİM KISMI
class Datesec extends StatefulWidget {
  final double? width;
  final double? height;
  final double? decoration;

  const Datesec({this.width, this.height, this.decoration, super.key});

  @override
  State<Datesec> createState() => _DatesecState();
}

class _DatesecState extends State<Datesec> {
  DateTime? selecteddate;

  Future<void> selecteddte() async {
    final DateTime? pickeddate = await showDatePicker(
      context: context,
      firstDate: DateTime(2025),
      lastDate: DateTime(2027),
    );

    setState(() {
      selecteddate = pickeddate;

      datecont.text =
          "${pickeddate?.day}/${pickeddate?.month}/${pickeddate?.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        controller: datecont,
        decoration: InputDecoration(labelText: 'Date'),

        readOnly: true,
        onTap: () {
          selecteddte();
        },
      ),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 227, 227),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

//chipler aarsı bosluk
//butonlarn arasındaki bosluk
class chipbox extends StatelessWidget {
  final double? width;

  const chipbox({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? MediaQuery.of(context).size.width * 0.02);
  }
}

class Chipapp extends StatefulWidget {
  final TextEditingController prioritycont;
  const Chipapp({super.key, required this.prioritycont, required chiplist});

  @override
  State<Chipapp> createState() => _ChipappState();
}

class _ChipappState extends State<Chipapp> {
  int? selectedindex = 0;
  final List<String> chiplist = [];
  void initState() {
    super.initState();
    widget.prioritycont.text = chiplist.first; // ilk değer
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //satır gibi
      spacing:
          MediaQuery.of(context).size.width * 0.04, //aralarda bu kdr boslk olck
      children: List.generate(chiplist.length, (index) {
        //mainde 3 kere donmemek icin
        return ChoiceChip(
          label: Text(chiplist[index]),
          selected: selectedindex == index,
          onSelected: (bool selected) {
            setState(() {
              selectedindex = selected ? index : null;
              prioritycont.text = chiplist[index];
            });
          },

          shape: StadiumBorder(), //yuvarlak olması için
          avatar: CircleAvatar(backgroundColor: containerrenk), //tik iconu

          selectedColor: Colors.indigoAccent,
        );
      }),
    );
  }
}

//TASK İÇİN CLASS

class Taskmodel {
  late String title;
  late String description;
  late String date;
  late String priority;
  late String category;

  Taskmodel({
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
    required this.category,
  });
}

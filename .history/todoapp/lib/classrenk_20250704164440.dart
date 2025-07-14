import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/screens/signin.dart';

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
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

//containerler arası
class containersizedbox extends StatelessWidget {
  final double? width;

  const containersizedbox({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(height: MediaQuery.of(context).size.height * 0.03),
    );
  }
}

//butonlarn arasındaki bosluk
class sizedbox extends StatelessWidget {
  final double? width;

  const sizedbox({Key? key, this.width}) : super(key: key);

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

class Chipclass extends StatelessWidget {
  final double? width;
  final double? height;
  final double? decoration;

  const Chipclass({this.width, this.height, this.decoration, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text('deneme'));
  }
}

/*
class Dropdownmenu extends StatefulWidget {
  final double? width;
  final double? height;

  const Dropdownmenu({super.key});

  @override
  State<Dropdownmenu> createState() => _DropdownmenuState();
}

class _DropdownmenuState extends State<Dropdownmenu> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

*/

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

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

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}

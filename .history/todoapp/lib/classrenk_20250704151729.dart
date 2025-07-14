import 'package:flutter/material.dart';
import 'package:todoapp/screens/signin.dart';

class Appbar extends StatelessWidget {
  final double? height;

  const Appbar({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.2,
    );
  }
}

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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:todoapp/screens/newtasks.dart';
import 'package:todoapp/screens/signin.dart';
import 'package:todoapp/screens/tasks.dart';

import 'package:todoapp/classrenk.dart';

final TextEditingController userController = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
final TextEditingController emailcont = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SigninState();
}

class _SigninState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'hosgeldiniz',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Ortaksinif(
              child: TextFormField(
                controller: emailcont,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
          ),

          containersizedbox(),
          Ortaksinif(
            child: TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(labelText: 'password'),
            ),
          ),

          containersizedbox(),

          /*Container(

            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tasks()),
                );
              },
              child: Text('log in', style: TextStyle(color: Colors.white)),
            ),
          ),*/
          Butonsinif(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: emailcont.text.trim(),
                        password: passcontroller.text.trim(),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tasks()),
                  );
                } on FirebaseAuthException catch (e) {
                  String errorMessage = '';

                  if (e.code == 'user-not-found') {
                    errorMessage = 'bu e postayla kimse yok';
                  } else if (e.code == 'wrong-password') {
                    errorMessage = 'yanls sifre';
                  } else {
                    errorMessage = 'giris basarısz:${e.message}';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('log in', style: TextStyle(color: Colors.white)),
            ),
          ),

          sizedbox(),

          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: Text('sign in', style: TextStyle(color: Colors.white)),
            ),
          ),
          sizedbox(),

          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white24),
              onPressed: () => print('tıklandı'),
              child: Text('forget', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

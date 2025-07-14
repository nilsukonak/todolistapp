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
    final appbarlength = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: appbarlength,

        title: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),

            Center(
              child: Text(
                'Welcome back!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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

          sizedbox(),

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
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          sizedbox(),

          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: containerrenk),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          sizedbox(),

          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 244, 244),
              ),
              onPressed: () => print('tıklandı'),
              child: Text(
                'Forget Password',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

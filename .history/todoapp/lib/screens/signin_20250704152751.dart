import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/screens/tasks.dart';
import 'package:flutter/services.dart';

import 'package:todoapp/classrenk.dart';
import 'package:todoapp/services/auth_services.dart';

TextEditingController emailcont = TextEditingController();
TextEditingController passcontroller = TextEditingController();

final AuthServices _services = AuthServices();

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          SizedBox(height: 90),

          Center(
            child: Text(
              'hosgeldiniz',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 15),

          /*Ortaksinif(
            child: TextFormField(
              controller: emailcont,
              decoration: InputDecoration(
                labelText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
*/
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              controller: emailcont,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          /*Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              controller: confirmpascontroller,
              decoration: InputDecoration(
                labelText: 'tekrar Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ), */
          //bu ve onceki containere girilen seyleri alıp aynı mı diye bakıcak
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Container(
            width: MediaQuery.of(context).size.width * 0.62,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),
              onPressed: () async {
                if (emailcont.text.isEmpty || passcontroller.text.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('hata')));
                } else {
                  await _services.signin(emailcont.text, passcontroller.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                  emailcont.clear();
                  passcontroller.clear();
                }
              },

              child: Text('KAYDET', style: TextStyle(color: Colors.white)),
              //KAYDET YAPINCABUNU FİREBASEYE ATMALI VE GİRİŞ YAPILMALI  KAYDETE BASINCA LOGİNE ATSIN
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

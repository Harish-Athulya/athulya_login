import 'dart:async';

import 'package:athulya_login/pages/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print(e);

      final text = e.toString();
      final snackBar = SnackBar(content: Text(text!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? UserPage()
      : Scaffold(
          appBar: AppBar(
            title: Text('Verify Email'),
            backgroundColor: Color.fromARGB(255, 222, 52, 128),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A verification email has been sent to your email.\n\nPlease verify it',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                /* Text(
                    'If you do not have access to your email, feel free to authenticate later. \nNow, please sign out'),
                SizedBox(
                  height: 20,
                ), */
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      primary: Colors.teal,
                    ),
                    onPressed: () {
                      // FirebaseAuth.instance.signOut();
                      canResendEmail ? sendVerificationEmail() : null;
                    },
                    icon: Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    label: Text(
                      'Resend Email',
                      style: TextStyle(fontSize: 24),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 24),
                    ))
              ],
            ),
          ),
        );
}

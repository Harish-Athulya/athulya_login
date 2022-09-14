import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 52, 128),
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Receive an email to\nreset your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22)),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      labelText: ('Email'),
                      hintText: ('Enter your email id'),
                      border: new OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: resetPassword,
                    icon: Icon(Icons.mail_outline_outlined),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        primary: Color.fromARGB(255, 29, 102, 142)),
                    label: Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 24),
                    ))
              ],
            )),
      ),
    );
  }

  Future resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Navigator.of(context).popUntil((route) => route.isFirst);

      final text = 'Password Reset Email Sent';
      final snackBar = SnackBar(content: Text(text!));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      print(e);

      final text = e.message;
      final snackBar = SnackBar(content: Text(text!));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    }
  }
}

import 'package:athulya_login/main.dart';
import 'package:athulya_login/widgets/navigation_drawer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/utils.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignupPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Athulya Senior Care"),
        backgroundColor: Color.fromARGB(255, 222, 52, 128),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  focusNode: focusEmail,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      icon: Icon(Icons.mail_outline),
                      hintText: ("Enter email"),
                      labelText: ('Email'),
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
                TextFormField(
                  controller: passwordController,
                  focusNode: focusPassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      icon: Icon(Icons.password_outlined),
                      hintText: ("Enter password"),
                      labelText: ('Password'),
                      border: new OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter minimum 6 characters'
                      : null,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: (Color.fromARGB(255, 29, 102, 142))),
                        onPressed: signUp,
                        icon: Icon(Icons.login_outlined),
                        label: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 29, 102, 142),
                                fontSize: 20,
                              ),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                                text: 'Sign In',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black))
                          ])),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Expanded(child: Image.asset('/assets/images/bgImg.jpg')),
                Expanded(child: Image.asset('assets/images/bgImg.jpg'))
              ],
            )),
      ),
    );
  }

  Future signUp() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

  Future signIn() async {
    // print('Hari');

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // navigatorKey.currentState!.popUntil((route) => route.isCurrent);
    // Navigator.pop(context);
    Navigator.of(context).pop();
  }
}

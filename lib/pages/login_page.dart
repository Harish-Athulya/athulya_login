import 'package:athulya_login/main.dart';
import 'package:athulya_login/widgets/navigation_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();

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
                    style: ElevatedButton.styleFrom(primary: (Colors.teal)),
                    onPressed: signIn,
                    icon: Icon(Icons.lock_open),
                    label: Text(
                      'Sign In',
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
                          text: 'No Account? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 29, 102, 142),
                            fontSize: 20,
                          ),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: 'Sign Up',
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
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
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

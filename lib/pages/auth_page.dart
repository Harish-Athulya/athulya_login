import 'package:athulya_login/pages/login_page.dart';
import 'package:athulya_login/pages/signup_page.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(onClickedSignUp: toggle);
    } else {
      return SignupPage(onClickedSignIn: toggle);
    }
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}

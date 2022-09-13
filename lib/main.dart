import 'package:athulya_login/pages/my_home_page.dart';
import 'package:athulya_login/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
/*
       title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
 */
      home: const MyHomePage(),
    );
  }
}

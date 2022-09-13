import 'package:athulya_login/pages/login_page.dart';
import 'package:athulya_login/pages/main_page.dart';
import 'package:athulya_login/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        color: Color.fromARGB(255, 29, 102, 142),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute builder: (context) => const MyHomePage());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.login_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Login',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage(),
                  ),
                );

              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.date_range,
                color: Colors.blue,
              ),
              title: const Text(
                'My Appointments',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.person_add_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Add Family Member',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'My Orders',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
            ),
            /* ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 102, 142),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {},
            ), */
          ],
        ),
      );
}

import 'package:athulya_login/widgets/custom_carousel_slider.dart';
import 'package:athulya_login/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/emoticon_face.dart';
import '../widgets/exercise_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Athulya Senior Care"),
          backgroundColor: Color.fromARGB(255, 222, 52, 128),
        ),
        body: Column(
          children: [
            CustomCarouselSlider(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  /* Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 102, 142),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  ), */
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 102, 142),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromARGB(255, 29, 102, 142),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          EmoticonFace(emoticonFace: '❤️'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Like',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 29, 102, 142)),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            EmoticonFace(emoticonFace: '😂'),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Haha',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 102, 142)),
                              ),
                            ),
                          ],
                        ),
                        Column(children: [
                          EmoticonFace(emoticonFace: '😎'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Cool',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 29, 102, 142)),
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            EmoticonFace(emoticonFace: '😔'),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sad',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 102, 142)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey[350],
                // color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Activities',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 29, 102, 142)),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ExerciseTile(
                              icon: Icons.book_outlined,
                              exerciseName: "Reading",
                              numberOfExercise: 15,
                              customColor: Colors.orange,
                            ),
                            ExerciseTile(
                              icon: Icons.accessibility_new_outlined,
                              exerciseName: "Yoga",
                              numberOfExercise: 41,
                              customColor: Colors.red,
                            ),
                            ExerciseTile(
                              icon: Icons.star_border_purple500_rounded,
                              exerciseName: "Physiotherapy",
                              numberOfExercise: 35,
                              customColor: Colors.green,
                            ),
                            ExerciseTile(
                              icon: Icons.directions_walk,
                              exerciseName: "Jogging",
                              numberOfExercise: 19,
                              customColor: Colors.purple,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

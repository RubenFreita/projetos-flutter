import 'package:flutter/material.dart';
import 'package:my_app_layout/widgets/description_text.dart';
import './widgets/icons_list.dart';
import './widgets/title_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  String text =
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets\\images\\lake.jpg",
                fit: BoxFit.cover,
                height: 240,
                width: 600,
              ),
              TitleSection(
                title: "Oeschinen Lake Campground",
                subtitle: "Kandersteg, Switzerland",
              ),
              IconsList(
                icons: const {
                  "CALL": Icons.call,
                  "ROUTE": Icons.near_me,
                  "SHARE": Icons.share,
                },
              ),
              DescriptionText(
                text: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

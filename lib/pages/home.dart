import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/constants.dart';
import 'package:multi_quiz_s_t_tt9/modules/level_class.dart';
import 'package:multi_quiz_s_t_tt9/pages/level_describtion.dart';
import 'package:multi_quiz_s_t_tt9/widgets/my_outline_btn.dart';
import '../widgets/my_level_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<level> levels = [
    level(
      title: 'True or false',
      subtitle: 'Level 1',
      descreption: 'Rise Up Your IQ',
      image: 'assets/images/bags.png',
      icon: Icons.check,
      colors: [kL1, kL12],
      routeName: '/level1',
    ),
    level(
      title: 'Multiple Choice',
      subtitle: 'Level 2',
      descreption: 'Rise Up Your IQ',
      image: 'assets/images/ballon-s.png',
      icon: Icons.play_arrow,
      colors: [kL2, kL22],
      routeName: '/level2',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MYOutlineBtn(
            icon: Icons.favorite,
            iconColor: kBlueIcon,
            bColor: kGreyFont.withOpacity(0.5),
            function: () {},
          ),
          MYOutlineBtn(
              icon: Icons.person,
              iconColor: kBlueIcon,
              bColor: kGreyFont.withOpacity(0.5),
              function: () {}),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let\'s Play',
              style: TextStyle(
                fontSize: 32,
                color: kRedFont,
                fontWeight: FontWeight.bold,
                fontFamily: kFontFamily,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Be the First!',
              style: TextStyle(
                fontSize: 18,
                color: kGreyFont,
                fontFamily: kFontFamily,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return MyLevelWidget(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelDescription(
                                    levelInfo: levels[index])));
                      },
                      mylevel: levels[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

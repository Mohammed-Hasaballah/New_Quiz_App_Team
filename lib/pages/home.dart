import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/constants.dart';
import 'package:multi_quiz_s_t_tt9/pages/level_describtion.dart';
import 'package:multi_quiz_s_t_tt9/pages/multiple_q_screen.dart';
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
            function: () {
              print("11111");
            },
          ),
          MYOutlineBtn(
              icon: Icons.person,
              iconColor: kBlueIcon,
              bColor: kGreyFont.withOpacity(0.5),
              function: () {
                print("2222");
              }),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              MyLevelWidget(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LevelDescription();
                      },
                    ),
                  );
                },
                icon: Icons.check,
                title: 'True or False',
                subtitle: 'Level 1',
                image: 'assets/images/bags.png',
                colors: const [kL1, kL12],
              ),
              MyLevelWidget(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LevelDescription();
                      },
                    ),
                  );
                },
                icon: Icons.play_arrow,
                title: 'Multiple Choice',
                subtitle: 'Level 2',
                image: 'assets/images/ballon-s.png',
                colors: const [kL2, kL22],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

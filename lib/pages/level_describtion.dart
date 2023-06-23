import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/modules/level_class.dart';

import '../widgets/my_outline_btn.dart';

class LevelDescription extends StatelessWidget {
  final level levelInfo;
  const LevelDescription({
    Key? key,
    required this.levelInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var questionNumber = 5;
    var questionsCount = 10;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: levelInfo.colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: MYOutlineBtn(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(levelInfo.image!),
                ),
              ),
              Text(
                'question $questionNumber of $questionsCount',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                levelInfo.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' ${levelInfo.descreption!}',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white60,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, levelInfo.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                  child: Expanded(
                    child: Center(
                      child: Text(
                        'Game',
                        style: TextStyle(
                            color: levelInfo.colors[0],
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

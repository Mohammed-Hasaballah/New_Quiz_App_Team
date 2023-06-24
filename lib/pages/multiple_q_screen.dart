import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../modules/multipe_choice/choice_handel.dart';
import '../modules/multipe_choice/quizBrainMultiple.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

// ignore: camel_case_types
class quiz_screen extends StatefulWidget {
  const quiz_screen({super.key});
  @override
  State<quiz_screen> createState() => _quiz_screenState();
}

class _quiz_screenState extends State<quiz_screen> {
  bring_question quize = bring_question();

  int score = 0;
  int count = 01;

  Color color = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;

  int questionNumber = 1;

  late int questionsCount;
  @override
  Widget build(BuildContext context) {
    questionsCount = quize.gitlingth();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kBlueBg,
              kL2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 56, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///-------------------------------------the crose button------
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: MYOutlineBtn(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {
                        // Navigator.pop(context);
                        // Navigator.pop(context);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
//-----------------------------------the progress indicator-----------

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: CircularProgressIndicator(
                          value: (count) / 10,
                          color: Colors.white,
                          backgroundColor: Colors.white12,
                        ),
                      ),
                      Text(
                        "$count",
                        style: const TextStyle(
                          fontFamily: 'Sf-Pro-Text',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
//-----------------------------------like button------
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: const BorderSide(color: Colors.white)),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              //------------------image ------
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Image.asset(
                      'assets/images/ballon-b.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              //----------------number of question---------
              Text(
                'question $count of ${quize.multiQuestions.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white60,
                ),
                //-----------------------------------------
              ),
              const SizedBox(
                height: 8,
              ),

              ///--------------- text of qastion--------------------
              Text(
                quize.gitqustiontext(),
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 48,
              ),

              //-----------------------------
              const SizedBox(
                height: 48,
              ),
              //------------------choices---------

              //------------------choice1---------

              choise(quize.gitchoise(0), color, 0, quize.questionnumber, () {
                if (0 == quize.gitqustionanswer()) {
                  setState(() {
                    color = kG1;
                    score++;
                  });
                } else {
                  setState(() {
                    color = kRedFont;
                  });
                }
              }),

              choise(quize.gitchoise(1), color1, 1, quize.questionnumber, () {
                if (quize.gitqustionanswer() == 1) {
                  setState(() {
                    color1 = kG1;
                    score++;
                  });
                } else {
                  setState(() {
                    color1 = kRedFont;
                  });
                }
              }),

              choise(quize.gitchoise(2), color2, 2, quize.questionnumber, () {
                if (quize.gitqustionanswer() == 2) {
                  setState(() {
                    color2 = kG1;
                    score++;
                  });
                } else {
                  setState(() {
                    color2 = kRedFont;
                  });
                }
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        if (quize.isfinished()) {
                          Alert(
                              context: context,
                              title: "Quiz Finished",
                              desc: "your score $score/${quize.gitlingth()}",
                              buttons: [
                                DialogButton(
                                    child: const Text(
                                      "Close",
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false,
                                      );
                                    }),
                              ]).show();
                          setState(() {
                            quize.reset();
                            score = 0;
                            count = 1;
                            color = Colors.white;
                            color1 = Colors.white;
                            color2 = Colors.white;
                          });
                        } else {
                          setState(() {
                            count++;
                            quize.nextquestion();
                            color = Colors.white;
                            color1 = Colors.white;
                            color2 = Colors.white;
                          });
                        }
                      },
                      child: const Text(
                        "next",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

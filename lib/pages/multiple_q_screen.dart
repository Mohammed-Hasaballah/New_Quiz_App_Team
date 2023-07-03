import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../modules/multipe_choice/choice_handle.dart';
import '../modules/multipe_choice/multi_q_brain.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

class MultiQuizScreen extends StatefulWidget {
  const MultiQuizScreen({super.key});
  @override
  State<MultiQuizScreen> createState() => _MultiQuizScreenState();
}

class _MultiQuizScreenState extends State<MultiQuizScreen> {
  MultibleQBrain quizeBrain = MultibleQBrain();

  int score = 0;

  Color firstChoiceColor = const Color.fromARGB(255, 198, 196, 196);
  Color secondChoiceColor = const Color.fromARGB(255, 198, 196, 196);
  Color thirdChoiceColor = const Color.fromARGB(255, 198, 196, 196);

  late int questionsCount;
  int questionNumber = 1;

  late Timer timer;
  int counter = 10;
  bool buttonEnabled = true;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        goToNextQuestion();
      }
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void goToNextQuestion() {
    if (quizeBrain.isFinished()) {
      Alert(
          context: context,
          title: "Quiz Finished",
          desc: "your score $score/${quizeBrain.getLength()}",
          buttons: [
            DialogButton(
                child: const Text(
                  "Close",
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                }),
            DialogButton(
                child: const Text(
                  "Play Again",
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ]).show();
      setState(() {
        quizeBrain.reset();
        score = 0;
        questionNumber = 1;
        firstChoiceColor = Colors.grey;
        secondChoiceColor = Colors.grey;
        thirdChoiceColor = Colors.grey;
        stopTimer();
      });
    } else {
      setState(() {
        questionNumber++;
        quizeBrain.nextQuestion();
        firstChoiceColor = const Color.fromARGB(255, 198, 196, 196);
        secondChoiceColor = const Color.fromARGB(255, 198, 196, 196);
        thirdChoiceColor = const Color.fromARGB(255, 198, 196, 196);
        counter = 10;
        startTimer();
        buttonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    questionsCount = quizeBrain.getLength();

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
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: MYOutlineBtn(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: CircularProgressIndicator(
                          value: counter / 10,
                          color: Colors.white,
                          backgroundColor: Colors.white12,
                        ),
                      ),
                      Text(
                        counter.toString(),
                        style: const TextStyle(
                          fontFamily: 'Sf-Pro-Text',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
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
              Text(
                'question $questionNumber of ${quizeBrain.multiQuestions.length}',
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
                quizeBrain.getQustionText(),
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
              const SizedBox(
                height: 48,
              ),
              Choice(
                choicetext: quizeBrain.getChoice(0),
                disapledColor: firstChoiceColor,
                userAnswer: 0,
                questionNumber: quizeBrain.questionnumber,
                onPressed: buttonEnabled
                    ? () {
                        if (quizeBrain.getQustionAnswer() == 0) {
                          setState(() {
                            firstChoiceColor = kG1;
                            score++;
                          });
                        } else {
                          setState(() {
                            firstChoiceColor = kRedFont;
                          });
                        }
                        buttonEnabled = false; // Disable clicking on choices
                        stopTimer();
                      }
                    : null,
              ),
              Choice(
                choicetext: quizeBrain.getChoice(1),
                disapledColor: secondChoiceColor,
                userAnswer: 1,
                questionNumber: quizeBrain.questionnumber,
                onPressed: buttonEnabled
                    ? () {
                        if (quizeBrain.getQustionAnswer() == 1) {
                          setState(() {
                            secondChoiceColor = kG1;
                            score++;
                          });
                        } else {
                          setState(() {
                            secondChoiceColor = kRedFont;
                          });
                        }
                        buttonEnabled = false; // Disable clicking on choices
                        stopTimer();
                      }
                    : null,
              ),
              Choice(
                choicetext: quizeBrain.getChoice(2),
                disapledColor: thirdChoiceColor,
                userAnswer: 2,
                questionNumber: quizeBrain.questionnumber,
                onPressed: buttonEnabled
                    ? () {
                        if (quizeBrain.getQustionAnswer() == 2) {
                          setState(() {
                            thirdChoiceColor = kG1;
                            score++;
                          });
                        } else {
                          setState(() {
                            thirdChoiceColor = kRedFont;
                          });
                        }
                        buttonEnabled = false; // Disable clicking on choices
                        stopTimer();
                      }
                    : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        goToNextQuestion();
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

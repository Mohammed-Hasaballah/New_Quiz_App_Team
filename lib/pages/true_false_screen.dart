// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../modules/true_false/true_false_brain.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

class TrueFalseQuiz extends StatefulWidget {
  const TrueFalseQuiz({super.key});

  @override
  _TrueFalseQuizState createState() => _TrueFalseQuizState();
}

class _TrueFalseQuizState extends State<TrueFalseQuiz> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  int result = 0;
  int counter = 10;
  late Timer timer;
  int questionNum = 1;
  bool buttonEnabled = true;
  bool? userChoiceAns;

  void checkAnswer(bool? userChoice) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (correctAnswer == userChoice) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        result++;
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });

    if (quizBrain.isFinished()) {
      print('finished');
      timer.cancel();
      Timer(const Duration(seconds: 0), () {
        Alert(
            context: context,
            title: "Quiz Finished",
            desc: "your score $result/${quizBrain.questionBank.length}",
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
                    setState(() {
                      quizBrain.reset();
                      scoreKeeper.clear();
                    });
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
          quizBrain.reset();
          // scoreKeeper.clear();
          questionNum = 1;
        });
      });
    } else {
      counter = 10;
    }
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        checkAnswer(null);
        quizBrain.nextQuestion();
        questionNum++;
        buttonEnabled = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kL1, kL12],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                height: 32,
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/images/bags.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Text(
                'question $questionNum of ${quizBrain.getLength()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sf-Pro-Text',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      disabledBackgroundColor: Colors.green,
                    ),
                    onPressed: buttonEnabled
                        ? () {
                            //The user picked true.
                            checkAnswer(true);
                            buttonEnabled = false;
                          }
                        : null,
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      disabledBackgroundColor: Colors.red,
                    ),
                    onPressed: buttonEnabled
                        ? () {
                            //The user picked true.
                            checkAnswer(false);
                            buttonEnabled = false;
                          }
                        : null,
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Wrap(
                children: scoreKeeper,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        buttonEnabled ? checkAndCont() : cont();
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
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkAndCont() {
    checkAnswer(userChoiceAns);
    questionNum++;
    quizBrain.nextQuestion();
    buttonEnabled = true;
  }

  void cont() {
    questionNum++;
    quizBrain.nextQuestion();
    buttonEnabled = true;
  }
}

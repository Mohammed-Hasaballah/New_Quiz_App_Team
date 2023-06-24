import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/questionMultiple.dart';

// class QuizBrainMulti {
//   int _questionNumber = 0;

//   final List<QuestionMultiple> _questionBank = [
//     QuestionMultiple('You can lead a cow down stairs but not up stairs.', 1,
//         ['always', 'never', 'sometimes']),
//     QuestionMultiple(
//         'Approximately one quarter of human bones are in the feet.',
//         0,
//         ['agree', 'disagree', 'not sure']),
//   ];

//   String getQuestionText() {
//     return _questionBank[_questionNumber].questionText;
//   }

//   int getQuestionAnswer() {
//     return _questionBank[_questionNumber].questionAnswer;
//   }

//   List<String> getOptions() {
//     return _questionBank[_questionNumber].options;
//   }

//   void nextQuestion() {
//     if (_questionNumber < _questionBank.length - 1) {
//       _questionNumber++;
//     }
//   }

//   bool isFinished() {
//     if (_questionNumber >= _questionBank.length - 1) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void reset() {
//     _questionNumber = 0;
//   }
// }

// ignore: camel_case_types
class bring_question {
  int questionnumber = 0;

  final List<question> multiQuestions = [
    question(
        "The sun rises from which direction?",
        ["the East", "the West", "the South"],
        // index of answer---
        0),

    ///------------------
    question(
        "What is the least dense gas?",
        ["oxygen", "hydrogen", "Nitrogen"],
        // index of answer---
        1),
    question(
        "The sun rises from which direction?",
        ["the East", "the West", "the South"],
        // index of answer---
        0),

    ///------------------
    question(
        "What is the least dense gas?",
        ["oxygen", "hydrogen", "Nitrogen"],
        // index of answer---
        1),
    question(
        "The sun rises from which direction?",
        ["the East", "the West", "the South"],
        // index of answer---
        0),

    ///------------------
    question(
        "What is the least dense gas?",
        ["oxygen", "hydrogen", "Nitrogen"],
        // index of answer---
        1),

    question(
        "The sun rises from which direction?",
        ["the East", "the West", "the South"],
        // index of answer---
        0),

    ///------------------
    question(
        "What is the least dense gas?",
        ["oxygen", "hydrogen", "Nitrogen"],
        // index of answer---
        1),

    question(
        "The sun rises from which direction?",
        ["the East", "the West", "the South"],
        // index of answer---
        0),

    ///------------------
    question(
        "What is the least dense gas?",
        ["oxygen", "hydrogen", "Nitrogen"],
        // index of answer---
        1),
  ];

  String gitqustiontext() {
    return multiQuestions[questionnumber].questiontext;
  }

  String gitchoise(int x) {
    return multiQuestions[questionnumber].choice[x];
  }

  int gitqustionanswer() {
    return multiQuestions[questionnumber].questionanswerindex;
  }

  void nextquestion() {
    if (questionnumber < multiQuestions.length - 1) {
      questionnumber++;
    }
  }

  bool isfinished() {
    if (questionnumber == multiQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionnumber = 0;
  }

  int gitlingth() {
    return multiQuestions.length;
  }

  int gitqustionanswerbyx(int x) {
    return multiQuestions[x].questionanswerindex;
  }
}

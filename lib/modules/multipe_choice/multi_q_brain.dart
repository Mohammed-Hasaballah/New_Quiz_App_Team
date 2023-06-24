import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/multiquestion.dart';

class MultibleQBrain {
  int questionnumber = 0;

  List<Question> multiQuestions = [
    Question(
      "What is the least dense gas?",
      ["oxygen", "hydrogen", "Nitrogen"],
      1,
    ),
    Question(
      "Which planet is known as the Red Planet?",
      ["Mars", "Venus", "Jupiter"],
      0,
    ),
    Question(
      "What is the chemical symbol for gold?",
      ["Ag", "Au", "Fe"],
      1,
    ),
    Question(
      "Which animal can fly without wings?",
      ["Fish", "Snake", "Bat"],
      2,
    ),
    Question(
      "What is the largest organ in the human body?",
      ["Heart", "Liver", "Skin"],
      2,
    ),
    Question(
      "Which country is known for the Taj Mahal?",
      ["India", "China", "Egypt"],
      0,
    ),
    Question(
      "What is the capital city of Australia?",
      ["Sydney", "Melbourne", "Canberra"],
      2,
    ),
    Question(
      "Who painted the Mona Lisa?",
      ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci"],
      2,
    ),
    Question(
      "What is the tallest mountain in the world?",
      ["Mount Kilimanjaro", "Mount Everest", "Mount Fuji"],
      1,
    ),
    Question(
      "What is the chemical formula for water?",
      ["H2O", "CO2", "NaCl"],
      0,
    ),
  ];

  String getQustionText() {
    return multiQuestions[questionnumber].questionText;
  }

  String getChoice(int x) {
    return multiQuestions[questionnumber].choice[x];
  }

  int getQustionAnswer() {
    return multiQuestions[questionnumber].questionAnswerIndex;
  }

  void nextQuestion() {
    if (questionnumber < multiQuestions.length - 1) {
      questionnumber++;
    }
  }

  bool isFinished() {
    if (questionnumber == multiQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionnumber = 0;
  }

  int getLength() {
    return multiQuestions.length;
  }

  int getQustionAnswerByIndex(int index) {
    return multiQuestions[index].questionAnswerIndex;
  }
}

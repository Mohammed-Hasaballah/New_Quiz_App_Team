import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/multi_q_brain.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class Choice extends StatefulWidget {
  final String choicetext;
  final Color disapledColor;
  final int userAnswer;
  final int questionNumber;
  final Function()? onPressed;

  const Choice({
    required this.choicetext,
    required this.disapledColor,
    required this.userAnswer,
    required this.questionNumber,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  MultibleQBrain chick = MultibleQBrain();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          disabledBackgroundColor: widget.disapledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.choicetext,
                  style: const TextStyle(
                      color: kL2, fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

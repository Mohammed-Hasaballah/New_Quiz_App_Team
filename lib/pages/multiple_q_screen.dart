import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../modules/multipe_choice/choice_handel.dart';
import '../modules/multipe_choice/quizBrainMultiple.dart';

// ignore: camel_case_types
class quiz_screen extends StatefulWidget {
  const quiz_screen({super.key});
  @override
  State<quiz_screen> createState() => _quiz_screenState();
}

class _quiz_screenState extends State<quiz_screen> {
 
  bring_question quize=bring_question();

  int score=0;
  int count=01;

Color color=Colors.white;
Color color1=Colors.white;
Color color2=Colors.white;

   int questionNumber = 1;
   
    late int  questionsCount   ;
    @override

  Widget build(BuildContext context) {
    questionsCount=quize.gitlingth();
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
                    child: OutlinedButton(
                      onPressed: () {
                         Navigator.pop(context);
                      },
                     style:const ButtonStyle().copyWith(
                      shape: const MaterialStatePropertyAll(
                        CircleBorder(),
                      ),
                      side: const MaterialStatePropertyAll(
                        BorderSide(color: Colors.white),
                        ),
                        padding:const MaterialStatePropertyAll(EdgeInsets.all(8)),
                        
                     ),
                     child: const Icon(Icons.close,
                     color: Colors.white,),
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
                          value: (count)/10,
                          color: Colors.white,
                          backgroundColor: Colors.white12,
                        ),
                      ),
                      Text(
                        "${count}",
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
              //------------------image ------
              Expanded(
                child: Center(
                  child: Image.asset('assets/images/ballon-b.png'),
                ),
              ),
              //----------------number of question---------
              Text(
                'question ${count} of $questionsCount',

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
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //-----------------------------
              const SizedBox(
                height: 48,
              ),
              //------------------choise---------

              //------------------choise1---------
              
 choise(
  quize.gitchoise(0),
   color,
    0,
     quize.questionnumber, (){
if (0==quize.gitqustionanswer()){
  setState(() {
    color=kG1;
    score++;
  });
}
else{
   setState(() {
   color=kRedFont;
  });
}

              
        }),

              choise(quize.gitchoise(1), color1, 1, quize.questionnumber,(){
if (1==quize.gitqustionanswer()){
 
  setState(() {
    color1=kG1;
    score++;
  });
}
else{
   setState(() {
   color1=kRedFont;
  });
}

//  if (quize.isfinished()) {
//                     print("is fine-----------");
                   
//                     setState(() {
//                     color=Colors.white;
//                     color1=Colors.white;
//                     color2=Colors.white;
//                       quize.reset();
//                       ;
                   
//                Alert(context: context, title: "finished", desc: "the quize is finished. and your scor $score/${quize.gitlingth()}").show();
//                      score=0;
//                       count=1;
//                       });
//                }
               
// else{
//     Timer(const Duration(seconds: 1), () {
//     setState(() {
//       count++;
//       quize.nextquestion();
//       color=Colors.white;
//       color1=Colors.white;
//       color2=Colors.white;
//     });
//  });
//   }  
                    }),

              choise(quize.gitchoise(2), color2, 2, quize.questionnumber,(){
if (2==quize.gitqustionanswer()){
 
  setState(() {
    color2=kG1;
    score++;
  });
}
else{
   setState(() {
   color2=kRedFont;
  });
}

//  if (quize.isfinished()) {
//                     print("is fine-----------");
                    
//                     Alert(context: context, title: "finished", desc: "the quize is finished. and your scor $score/${quize.gitlingth()}").show();
//                     setState(() {
//                       quize.reset();
//                       score=0;
//                       count=1;
//                     });}
// else{
//     Timer(const Duration(seconds: 1), () {
//     setState(() {
//       count++;
//       quize.nextquestion();
//       color=Colors.white;
//       color1=Colors.white;
//       color2=Colors.white;
//     });
//  });
//   }  

                    }),

              
      
TextButton(onPressed: (){
  if (quize.isfinished()) {
                    print("is fine-----------");
                    Alert(context: context, title: "finished", desc: "the quize is finished. and your scor $score/${quize.gitlingth()}").show();
                    setState(() {
                      
                      quize.reset();
                      score=0;
                      count=1;
                      color=Colors.white;
                      color1=Colors.white;
                      color2=Colors.white;
                    });
                    }
  else{
    
    setState(() {
      count++;
      quize.nextquestion();
      color=Colors.white;
      color1=Colors.white;
      color2=Colors.white;
    });
 
  }     

}, child: Text("next",
style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white) ,)),
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

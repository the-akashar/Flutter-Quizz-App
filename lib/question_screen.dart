import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/answers_button.dart';
import 'package:quizz_app/data/questions.dart';



class QuestionScreen extends StatefulWidget{

  const QuestionScreen({super.key , required this.onSelectAnswer});

  final void Function (String answer) onSelectAnswer; 

  


  @override
  State<QuestionScreen> createState() {
    // TODO: implement createState
    return _QuestionScreenState();
  }

}

class _QuestionScreenState extends State<QuestionScreen>{

 
  var currentQuestionIndex = 0 ;

  void answerQuestion(String selectedAnswers){
     widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  

  @override
  Widget build( context) {
    // TODO: implement build

     final currentQuestion = questions[currentQuestionIndex]; 

     

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text( currentQuestion.text ,style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30,),
          ...currentQuestion.getShuffledAnswers().map((ansewer){
            return AnswersButton(answerText: ansewer ,
             onTap: (){
              answerQuestion(ansewer);
            });
          })
        ],),
      ), 
    );
  }
  
}
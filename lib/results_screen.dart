import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/question_summary/questions_summary.dart';


class ResultsScreen extends StatelessWidget{

  

  const ResultsScreen({super.key , required this.chooseAnswer , required this.onRestart}); 


  final void Function() onRestart ;
  final List<String> chooseAnswer ; 
  

  List<Map<String , Object>> getSummaryData(){

    List<Map<String , Object>> summary = [];

    for(var i = 0 ; i < chooseAnswer.length ; i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answer[0],
        'user_answer':chooseAnswer[i]
      });
    }

    return summary;
  }

  

  @override
  Widget build(BuildContext context) {
  final summaryData = getSummaryData();
  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where(
    (data){
      return data['user_answer'] == data['correct_answer'];
    }
  ).length;
   return SizedBox(
    width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text("You Answered $numCorrectQuestions out of $numTotalQuestions questions" ,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
            fontWeight:FontWeight.bold
          ),
          ),
          SizedBox(height: 30,),
          QuestionsSummary(summaryData),
          SizedBox(height: 30,),
          TextButton.icon(
          onPressed:onRestart ,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: const Icon(Icons.refresh),
          label: const Text('Restart Quiz!!!'),
          )
        ],
      ),
    ),
   );
  }

}
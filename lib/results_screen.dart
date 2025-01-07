import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary.dart';


class ResultsScreen extends StatelessWidget{

  

  const ResultsScreen({super.key , required this.chooseAnswer}); 

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
          Text("Your Answered $numCorrectQuestions out of $numTotalQuestions questions"),
          SizedBox(height: 30,),
          QuestionsSummary(summaryData),
          SizedBox(height: 30,),
          TextButton(onPressed:(){
          }, child: Text('Retry Again !!!'))
        ],
      ),
    ),
   );
  }

}
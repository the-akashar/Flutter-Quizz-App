import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset('assets/images/quiz-logo.png',
            width: 300)),
          SizedBox(height: 80),
          Text(
            "Learn flutter fun way!!!",
            style: GoogleFonts.lato(
                color: Color.fromARGB(255, 164, 138, 167), fontSize: 24),
          ),
          const SizedBox(height: 20,),
          OutlinedButton.icon(onPressed: startQuiz , 
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: Icon(Icons.arrow_right_alt), 
          label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}

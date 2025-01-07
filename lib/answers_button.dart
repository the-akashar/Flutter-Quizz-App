import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton({super.key , required this.onTap , required this.answerText} );

  final String answerText;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    //  
    return ElevatedButton(onPressed: onTap, 
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
      backgroundColor: const Color.fromARGB(255, 112, 11, 159),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
    ),
    child: Text(answerText , textAlign: TextAlign.center,));
  }
}

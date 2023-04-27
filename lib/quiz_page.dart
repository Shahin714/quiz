import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/constants/constants.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/screens/result_screen.dart';

class Quiz_page extends StatefulWidget {
  const Quiz_page({Key? key}) : super(key: key);

  @override
  State<Quiz_page> createState() => _Quiz_pageState();
}

class _Quiz_pageState extends State<Quiz_page> {
  int showQuestionIndex = 0;
  bool isFinalAnswerSubmitet = false;
  question? selectedQuestion;
  int corectAnswer = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    selectedQuestion = getQuestionList()[showQuestionIndex];
    String imageIndex = getQuestionList()[showQuestionIndex].imageNameNumber!;
    String appbarNumber = getQuestionList()[showQuestionIndex].appBar!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        title: Text(
          ' کوییز ' + appbarNumber + ' از  ${getQuestionList().length}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Image(
              image: AssetImage('images/$imageIndex.png'),
              height: 300,
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              getQuestionList()[showQuestionIndex].titleQuestion!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            ...List.generate(
              4,
              (index) => Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: getOptionsItem(index)),
            ),
            if (isFinalAnswerSubmitet)
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => resultScreen(
                          corectAnswer: corectAnswer,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'مشاهده نمایش',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[800],
                    minimumSize: Size(200, 50),
                  ))
          ],
        ),
      ),
    );
  }

  Widget getOptionsItem(index) {
    return ListTile(
      title: Text(
        getQuestionList()[showQuestionIndex].answerList![index],
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.end,
      ),
      onTap: () {
        if (selectedQuestion!.corectansewer == index) {
          corectAnswer++;
        } else {
          print('false');
        }
        if (showQuestionIndex == getQuestionList().length - 1) {
          isFinalAnswerSubmitet = true;
        }
        setState(
          () {
            if (showQuestionIndex < getQuestionList().length - 1) {
              showQuestionIndex++;
            }
          },
        );
      },
    );
  }
}

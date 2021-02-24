import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the Debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;
  int _totalScore = 0;
  // Question List
  List questionList = [
    Question.name(
        "Lauryn Hill was NOT the first African American woman to win five Grammy Awards in one year?",
        false),
    Question.name(
        "Hiram Rhodes Revels was the first African-American to graduate from Harvard University and become a U.S. senator??",
        true),
    Question.name(
        "Rapper Tupac Shakur took Ballet and Poetry as student at the Baltimore School of Performing Arts?",
        true),
    Question.name(
        "Garrett Morgan invented the three-position traffic signal in 1923 that includes the yellow light?",
        true),
    Question.name(
        "Katherine G. Johnson is known for her calculations helping NASA’s space program?",
        true),
    Question.name(
        "Cheyney University was the first historically black college in America?",
        true),
    Question.name(
        "It took Thomas Jefferson 17 days to write the Declaration of Independence?",
        true),
    Question.name(
        "On July 4, 1776, Congress voted to accept the Declaration of Independence?",
        true),
  ];

  _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % questionList.length;
      print(_questionIndex); // remove later
    });
  }

  _checkAnswer(bool userAnswer, BuildContext context) {
    var answerResult;
    if (userAnswer == questionList[_questionIndex].isCorrect) {
      _totalScore++;

      answerResult = "Answer is correct";
    } else {
      answerResult = "Answer is incorrect";
    }
    // print("Score so far is: $_totalScore / ${questionList.length}");

    final snackBar = SnackBar(
        duration: Duration(milliseconds: 500), content: Text(answerResult));
    Scaffold.of(context).showSnackBar(snackBar);
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade100,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/flag.png', width: 250, height: 180),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 120,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.white, style: BorderStyle.solid)),
                  child: Text(
                    "${questionList[_questionIndex].questionText}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () => _checkAnswer(true, context),
                        child: Text("True"),
                        color: Colors.blue.shade200,
                      ),
                      RaisedButton(
                          onPressed: () => _checkAnswer(false, context),
                          child: Text("False"),
                          color: Colors.blue.shade200),
                      RaisedButton(
                          onPressed: () => _nextQuestion(),
                          child: Text("Next"),
                          color: Colors.blue.shade200),
                    ]),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

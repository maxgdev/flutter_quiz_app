class Question {
  String questionText;
  bool isCorrect;

  Question.name(this.questionText, this.isCorrect);
  // same as 
  // Question({this.questionText, this.isCorrect});
}

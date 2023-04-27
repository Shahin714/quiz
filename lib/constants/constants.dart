import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';

List<question> getQuestionList() {
  var firstquestion = question();

  firstquestion.appBar = '1';

  firstquestion.titleQuestion = 'مشهور ترین شعبده باز تاریخ کیست؟';
  firstquestion.imageNameNumber = '1';
  firstquestion.corectansewer = 1;
  firstquestion.answerList = [
    'شاهین مالکی',
    'هری هودینی',
    'محمد مالکی',
    'علی مالکی'
  ];
  var secondquestion = question();
  secondquestion.appBar = '2';
  secondquestion.titleQuestion = 'چه کشوری ایستگاه فضایی میر را بنا کرد؟';
  secondquestion.imageNameNumber = '2';
  secondquestion.corectansewer = 1;
  secondquestion.answerList = ['آمریکا', 'روسیه', 'آلمان', 'فرانسه'];
  return [firstquestion, secondquestion];
}

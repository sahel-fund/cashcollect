import 'package:cashcollect/src/models/survey_question.dart';

class SurveyModel {
  final String? id;
  final String title;
  final String description;
  final String? image;
  final String? color;
  final int reward;
  final List<SurveyQuestion> questions;
  SurveyModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    this.color,
    required this.reward,
    required this.questions,
  });
}

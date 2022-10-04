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

final List<SurveyModel> surveys = [
  SurveyModel(
    description: "Presidenial Elections",
    title: "2025 Elections",
    color: "#000000",
    image:
        "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
    reward: 1000,
    questions: [
      SurveyQuestion(
        question: "Who is the best candidate?",
        options: [
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate B"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate C"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate A"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate D"),
        ],
      ),
      SurveyQuestion(
        question: "Who is the best candidate?",
        options: [
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate B"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate C"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate A"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate D"),
        ],
      ),
      SurveyQuestion(
        question: "Who is the best candidate?",
        options: [
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate B"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate C"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate A"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate D"),
        ],
      ),
      SurveyQuestion(
        question: "Who is the best candidate?",
        options: [
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate B"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate C"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate A"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate D"),
        ],
      ),
      SurveyQuestion(
        question: "Who is the best candidate?",
        options: [
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate B"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate C"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate A"),
          Option(
              image:
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              option: "Candidate D"),
        ],
      ),
    ],
  ),
];

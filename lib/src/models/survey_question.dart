class SurveyQuestion {
  final String question;
  final String? image;
  final List<Option> options;
  SurveyQuestion({
    required this.question,
    this.image,
    required this.options,
  });
}

class Option {
  final String option;
  final String image;
  Option({
    required this.option,
    required this.image,
  });
}

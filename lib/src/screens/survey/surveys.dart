import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/autorouter.dart';
import 'package:cashcollect/src/models/survey_model.dart';
import 'package:cashcollect/src/models/survey_question.dart';
import 'package:cashcollect/src/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cashcollect/src/router/router.gr.dart' as router;
//import router

final GlobalKey<ScaffoldState> _key = GlobalKey();

class Surveys extends ConsumerWidget {
  const Surveys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _key,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                GestureDetector(
                  onTap: () {
                    context.autorouter.push(
                      router.SurveyIntro(survey: surveys.first),
                    );
                  },
                  child: const Box(
                    title: "Elections",
                    desc: "Answer a few questionss",
                    icon: Icon(Icons.abc, color: Palette.secondary),
                  ),
                ),
                const Box(
                  title: "Elections",
                  desc: "Answer a few questions",
                  icon: Icon(Icons.abc, color: Palette.secondary),
                ),
                const Box(
                  title: "Elections",
                  desc: "Answer a few questions",
                  icon: Icon(Icons.abc, color: Palette.secondary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SurveyQuestionView extends ConsumerWidget {
  final SurveyQuestion question;
  final int questionIndex;
  final int questionsLength;
  const SurveyQuestionView({
    required this.questionIndex,
    required this.questionsLength,
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0) +
            const EdgeInsets.only(top: 34.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: questionIndex / questionsLength,
              backgroundColor: Palette.darkGrey.withOpacity(.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Palette.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(""),
                Text(
                  "Question $questionIndex of $questionsLength",
                  style: TextStyles.designText(
                      bold: true, color: Palette.darkGrey, size: 18),
                ),
                const Icon(Icons.cancel_rounded, color: Palette.darkGrey),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Text(
              question.question,
              style: TextStyles.designText(
                  bold: true, color: Palette.darkGrey, size: 18),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            ...question.options.map((option) {
              final i = question.options.indexOf(option);
              return Questiontile(ref: ref, option: question.options[i]);
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Questiontile extends StatelessWidget {
  final WidgetRef ref;
  final Option option;
  const Questiontile({
    Key? key,
    required this.ref,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Color> color = ValueNotifier<Color>(
      Palette.darkGrey.withOpacity(.1),
    );
    return ValueListenableBuilder(
      valueListenable: color,
      builder: (context, color, child) => GestureDetector(
        onTap: () {
          color = Palette.success;

          Future.delayed(const Duration(milliseconds: 500), () {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      option.image,
                      height: 65,
                      width: 65,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    option.option,
                    style: TextStyles.designText(
                        bold: true, color: Palette.darkGrey, size: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final controller = PageController(initialPage: 0);

class SurveyQuestions extends ConsumerStatefulWidget {
  final List<SurveyQuestion> questions;
  const SurveyQuestions({Key? key, required this.questions}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SurveyQuestionsState();
}

class _SurveyQuestionsState extends ConsumerState<SurveyQuestions> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (index) {},
      pageSnapping: true,
      restorationId: 'survey_questions',
      itemCount: widget.questions.length,
      itemBuilder: (context, index) {
        return SurveyQuestionView(
          question: widget.questions[index],
          questionIndex: index + 1,
          questionsLength: widget.questions.length,
        );
      },
    );
  }
}

import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/autorouter.dart';
import 'package:cashcollect/src/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import router

final GlobalKey<ScaffoldState> _key = GlobalKey();
final colorRiverpod = StateProvider(
  (ref) => Palette.darkGrey.withOpacity(.3),
);

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
                    context.autorouter.pushNamed('/survey-intro');
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
  const SurveyQuestionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorRiverpod.state).state;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0) +
            const EdgeInsets.only(top: 34.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Palette.darkGrey.withOpacity(.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Palette.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(""),
                Text(
                  "Question 2 of 12",
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
              "What is the common age range affected by COVID-19 in your local community?",
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
            for (int i = 1; i <= 4; i++)
              GestureDetector(
                onTap: () {
                  ref.read(colorRiverpod.state).state =
                      color == Palette.tertiary
                          ? Palette.darkGrey.withOpacity(.3)
                          : Palette.tertiary;
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
                              height: 65,
                              width: 65,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "18-25",
                            style: TextStyles.designText(
                                bold: true, color: Palette.darkGrey, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

final controller = PageController(initialPage: 0);

class SurveyQuestions extends ConsumerStatefulWidget {
  const SurveyQuestions({Key? key}) : super(key: key);

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
      itemCount: 12,
      itemBuilder: (context, index) {
        return const SurveyQuestionView();
      },
    );
  }
}

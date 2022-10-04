import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/autorouter.dart';
import 'package:cashcollect/src/models/survey_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cashcollect/src/router/router.gr.dart' as router;

class SurveyIntro extends ConsumerWidget {
  final SurveyModel survey;
  const SurveyIntro({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: WillPopScope(
        onWillPop: () async {
          return true;
          // ignore: dead_code
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text(
                  "Once you start the survey, you can't go back until you finish it. Are you sure you want to proceed?"),
              title: const Text("Survey completion"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Okay"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Exit"),
                ),
              ],
            ),
          );
        },
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            Center(
              child: Text(
                survey.title,
                style: TextStyles.designText(
                    color: Palette.secondary, size: 22, bold: true),
              ),
            ),
            Text(
              survey.description,
              style: TextStyles.designText(
                  color: Palette.secondary, size: 10, bold: false),
            ),
            const SizedBox(
              height: 4,
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
            const SizedBox(
              height: 4,
            ),
            Text(
              'Answer a few questions to help us improve our services',
              style: TextStyles.designText(
                  color: Palette.darkGrey, size: 14, bold: false),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text(
                            "Once you start the survey, you can't go back until you finish it. Are you sure you want to proceed?"),
                        title: const Text("Survey completion"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.autorouter.push(
                                router.SurveyQuestions(
                                  questions: survey.questions,
                                ),
                              );
                            },
                            child: const Text("Okay"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Exit"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Let's go in",
                    style: TextStyles.designText(
                        color: Palette.lightGrey, size: 14, bold: true),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     itemCount: surveys.length,
            //     itemBuilder: (context, index) {
            //       return SurveyTile(
            //         survey: surveys[index],
            //       );
            //     },
            //   ),
            // ),
            // const TradeMark(),
          ],
        ),
      ),
    ));
  }
}

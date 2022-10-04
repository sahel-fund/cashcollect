import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyIntro extends ConsumerWidget {
  const SurveyIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: WillPopScope(
        onWillPop: () async {
          bool value = false;
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: const Text(
                  "Once you start the survey, you can't go back until you finish it. Are you sure you want to proceed?"),
              title: const Text("You have raised a Alert Dialog Box"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    value = true;
                  },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(14),
                    child: const Text("Okay"),
                  ),
                ),
              ],
            ),
          );
          return value;
        },
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            Center(
              child: Text(
                '2025 Presidential Elections in Cameroon',
                style: TextStyles.designText(
                    color: Palette.secondary, size: 22, bold: true),
              ),
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
            Text(
              'Answer a few questions to help us improve our services',
              style: TextStyles.designText(
                  color: Palette.darkGrey, size: 14, bold: false),
            ),
            const SizedBox(
              height: 20,
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

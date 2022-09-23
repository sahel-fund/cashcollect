import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/autorouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends ConsumerWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/intro-ilustration.svg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Palette.primary, Palette.secondary],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to CashCollect",
                    style: TextStyles.designText(
                        bold: true, size: 22, color: Palette.lightGrey),
                  ),
                  Text(
                    "CashCollect is a survey app where you can earn money by completing surveys",
                    style: TextStyles.designText(
                        bold: false,
                        size: 12,
                        color: Palette.lightGrey.withOpacity(.5)),
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.circular(14)),
                    child: Center(
                      child: Text(
                        "Let's go in",
                        style: TextStyles.designText(
                            color: Palette.lightGrey, size: 14, bold: true),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

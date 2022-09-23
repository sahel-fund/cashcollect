import 'package:auto_route/auto_route.dart';
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
        //  clipBehavior: Clip.none,
        fit: StackFit.loose,
        alignment: AlignmentDirectional.center,
        children: [
          //Image.asset('assets/images/welcome.png'),

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Palette.primary,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Palette.primary,
                  //  Palette.secondary,
                  Palette.tertiary,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
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
                  const SizedBox(height: 8),
                  Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Palette.secondary,
                        borderRadius: BorderRadius.circular(14)),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          context.router.pushNamed('/signup');
                        },
                        child: Text(
                          "Let's go in",
                          style: TextStyles.designText(
                              color: Palette.lightGrey, size: 14, bold: true),
                        ),
                      ),
                    ),
                  ),
                  //  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      context.router.pushNamed('/login');
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyles.designText(
                          color: Palette.lightGrey.withOpacity(.7),
                          size: 14,
                          bold: false),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svg/intro.svg',
            height: 280,
            //width: MediaQuery.of(context).size.width * 0.5,
          ),
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/welcome.png'),
          //       // fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

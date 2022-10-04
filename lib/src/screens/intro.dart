import 'package:awesome_card/awesome_card.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/context.dart';
import 'package:cashcollect/src/models/user_model.dart';
import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:cashcollect/src/services/hive/userbox.dart';
import 'package:cashcollect/src/widgets/box.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class Intro extends ConsumerWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? user =
        UserBox.getUser(ref.read(AuthRiverpods.currentUserRiverpod)?.uid ?? "");
    return Scaffold(
      key: _key,
      drawer: CustomDrawer(ref: ref),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Hi ${user?.names}! welcome back",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 12),
                          ),
                        ],
                      ),
                      const Icon(
                        IconlyBroken.notification,
                        color: Palette.primary,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CreditCard(
                    cardNumber: "3,800,000 XAF",
                    cardHolderName: "Powered by CashCollect",
                    cvv: "456",
                    textExpDate: "------------------------------------",
                    cardType: CardType.maestro,
                    showBackSide: false,
                    frontBackground:
                        CardBackgrounds.custom(Palette.primary.value),
                    backBackground: CardBackgrounds.white,
                    showShadow: false,
                    bankName: "Total Amount",
                    textExpiry: ''),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const _SliderItem();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    Box(
                      title: 'SURVEYS',
                      icon: Icon(
                        EvaIcons.barChart,
                        size: 54,
                        color: Palette.lightGrey,
                      ),
                      desc: 'Complete surveys',
                    ),
                    Box(
                      title: 'HISTORY',
                      icon: Icon(
                        Icons.newspaper,
                        size: 54,
                        color: Palette.lightGrey,
                      ),
                      desc: 'Answered surveys',
                    ),
                    Box(
                      title: 'WITHDRAW',
                      icon: Icon(
                        Icons.currency_exchange,
                        size: 54,
                        color: Palette.lightGrey,
                      ),
                      desc: 'Withdraw cash',
                    ),
                    Box(
                      title: 'SUPPORT',
                      icon: Icon(
                        IconlyBroken.work,
                        size: 54,
                        color: Palette.lightGrey,
                      ),
                      desc: 'Ask for help',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final WidgetRef ref;
  const CustomDrawer({
    Key? key,
    required this.ref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final UserModel? user = UserBox.getUser(
            ref.read(AuthRiverpods.currentUserRiverpod)?.uid ?? "");
        return Container(
          width: context.screenWidth * .75,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Palette.primary, Palette.lightGrey],
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(context.screenWidth * .95, 100),
              topRight: Radius.elliptical(context.screenWidth * .95, 100),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  user!.names,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DrawerPainter extends CustomPainter {
  @override
  paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Palette.primary;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path
      ..moveTo(0, 0)
      ..lineTo(100, 100)
      ..lineTo(0, size.width * .45)
      ..lineTo(size.width * .45, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 100,
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Palette.primary)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Icon(EvaIcons.smartphone, color: Palette.primary, size: 64),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "Complete surveys and earn cash",
                      style: TextStyles.designText(
                          bold: false, size: 14, color: Palette.darkGrey),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Start now",
                          style: TextStyles.designText(
                              bold: true, size: 14, color: Palette.primary),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

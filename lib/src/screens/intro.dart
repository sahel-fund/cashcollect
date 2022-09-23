import 'package:awesome_card/awesome_card.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/widgets/box.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Intro extends ConsumerWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://unsplash.com/photos/Ft4p5E9HjTQ"),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Hi Alpha! welcome back",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 12),
                          ),
                        ],
                      ),
                      const Icon(
                        EvaIcons.bell,
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
                        Icons.support_agent,
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

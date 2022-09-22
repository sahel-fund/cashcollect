import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/widgets/mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalSheet {
  static void show(Widget child, BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Palette.lightGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  const Dash(),
                  const SizedBox(
                    height: 14,
                  ),
                  child,
                  const TradeMark()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Dash extends ConsumerWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 6,
      width: 70,
      decoration: BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}

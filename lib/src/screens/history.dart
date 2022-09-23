import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/models/history_model.dart';
import 'package:cashcollect/src/widgets/mark.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class History extends ConsumerWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Text(
                'History',
                style: TextStyles.designText(
                    color: Palette.secondary, size: 22, bold: true),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Review the history of your transactions. Here you can find all withdraws you have done on CashCollect',
              style: TextStyles.designText(
                  color: Palette.darkGrey, size: 14, bold: false),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  return HistoryTile(
                    history: histories[index],
                  );
                },
              ),
            ),
            const TradeMark(),
          ],
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final HistoryModel history;
  const HistoryTile({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Palette.darkGrey.withOpacity(.3),
            borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Palette.tertiary.withOpacity(.3),
                child: const Icon(Icons.currency_exchange,
                    color: Palette.lightGrey),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              history.nature,
                              style: TextStyles.designText(
                                  color: Palette.lightGrey,
                                  size: 14,
                                  bold: true),
                            ),
                            const SizedBox(width: 8),
                            Builder(builder: (context) {
                              Color color = history.status == 'pending'
                                  ? Palette.orange
                                  : history.status == 'success'
                                      ? Palette.success
                                      : Palette.danger;
                              return Container(
                                height: 22,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: color.withOpacity(.35),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Text(
                                    history.status,
                                    style: TextStyles.designText(
                                        color: Palette.lightGrey,
                                        size: 8,
                                        bold: false),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "26th October 2022 at 07:40 AM",
                          style: TextStyles.designText(
                              color: Palette.lightGrey, size: 10, bold: false),
                        )
                      ],
                    ),
                    Text(
                      "${history.amount}",
                      style: TextStyles.designText(
                          color: Palette.darkGrey, size: 18, bold: true),
                    )
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

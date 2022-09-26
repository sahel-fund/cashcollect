import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/context.dart';
import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback callback;
  const Button(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Center(
        child: Container(
          width: context.screenWidth * 0.8,
          height: 48.0,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Palette.primary,
                Palette.tertiary,
              ],
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyles.designText(
                  bold: false, color: Palette.light, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}

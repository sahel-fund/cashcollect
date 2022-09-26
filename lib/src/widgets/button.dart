import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
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
    return ArgonButton(
      height: 50,
      width: 350,
      borderRadius: 5.0,
      color: Palette.primary,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: const CupertinoActivityIndicator(),
      ),
      onTap: (startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.Idle) {
          startLoading();
          callback.call();
          //await doNetworkRequest();
          stopLoading();
        }
      },
      child: Text(
        label,
        style: TextStyles.designText(
            color: Palette.lightGrey, size: 18, bold: false),
      ),
    );
  }
}

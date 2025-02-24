import 'package:crypto_app/core/extension.dart';
import 'package:crypto_app/core/ui.dart';
import 'package:flutter/cupertino.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color?color;
  const PrimaryButton({super.key, required this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: CupertinoButton(
        onPressed: onPressed,
        color:color?? AppColors.accent,
        child: Text(text),
      ),
    );
  }
}

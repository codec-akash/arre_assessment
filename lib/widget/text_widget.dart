import 'package:arre_assessment/utils/global.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  bool isDark(context) => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: isDark(context) ? Global.textColor : Colors.black),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final Color? textColor;
  const HeadingText({super.key, required this.text, this.textColor});

  bool isDark(context) => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: isDark(context)
              ? textColor ?? Global.textColor.withOpacity(0.8)
              : textColor ?? Colors.black),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  const NormalText({super.key, required this.text});

  bool isDark(context) => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isDark(context)
                ? Global.textColor.withOpacity(0.8)
                : Colors.black,
          ),
    );
  }
}

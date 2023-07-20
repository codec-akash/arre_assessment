import 'package:arre_assessment/utils/global.dart';
import 'package:arre_assessment/utils/image_path.dart';
import 'package:arre_assessment/provider/theme_provider.dart';
import 'package:arre_assessment/widget/text_widget.dart';
import 'package:arre_assessment/widget/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ListTileCard extends StatelessWidget {
  final String svgPath;
  final String text;
  final Color? textColor;
  final Function()? onButtonTap;
  const ListTileCard({
    super.key,
    required this.text,
    required this.svgPath,
    this.onButtonTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor,
      ),
      child: GestureDetector(
        onTap: () {
          if (onButtonTap != null) {
            onButtonTap!();
          }
        },
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 13),
            Expanded(child: HeadingText(text: text, textColor: textColor)),
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                ImagePath.backIcon,
                color: Global.textColor.withOpacity(0.8),
                height: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileText extends StatelessWidget {
  final String text;
  final Function()? onButtonTap;
  const ListTileText({
    super.key,
    required this.text,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: GestureDetector(
        onTap: () {
          if (onButtonTap != null) {
            onButtonTap!();
          }
        },
        child: Row(
          children: [
            const SizedBox(width: 13),
            Expanded(child: NormalText(text: text)),
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                ImagePath.backIcon,
                color: Global.textColor.withOpacity(0.8),
                height: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileSwitch extends StatefulWidget {
  final String text;
  const ListTileSwitch({
    super.key,
    required this.text,
  });

  @override
  State<ListTileSwitch> createState() => _ListTileSwitchState();
}

class _ListTileSwitchState extends State<ListTileSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          const SizedBox(width: 13),
          Expanded(child: NormalText(text: widget.text)),
          Consumer(
            builder: (context, ref, child) {
              bool theme = ref.watch<bool>(themeProvider);
              return ToggleSwitchButton(
                value: theme,
                onChanged: (val) async {
                  await ref.read(themeProvider.notifier).toggle();
                },
                height: 45,
                imagePath: ImagePath.switchWithoutBgImage,
              );
            },
          )
        ],
      ),
    );
  }
}

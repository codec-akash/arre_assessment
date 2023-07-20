import 'package:arre_assessment/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToggleSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double height;
  final String imagePath;

  const ToggleSwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ToggleSwitchButton> createState() => _ToggleSwitchButtonState();
}

class _ToggleSwitchButtonState extends State<ToggleSwitchButton> {
  @override
  Widget build(BuildContext context) {
    const aspectRatio = (50 / 30);
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: SizedBox(
        height: widget.height,
        width: aspectRatio * widget.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((16 / 25) * widget.height),
                border: Border.all(
                    width: 1.3, color: Theme.of(context).disabledColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular((16 / 25) * widget.height),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      colors: [
                        widget.value == true
                            ? Global.greenGradientColor
                            : Colors.yellow,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SvgPicture.asset(
                    widget.imagePath,
                    height: widget.height,
                    width: aspectRatio * widget.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding:
                  EdgeInsets.symmetric(horizontal: (2 / 20) * widget.height),
              alignment:
                  widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: ClipOval(
                child: Container(
                  height: (3.5 / 5) * widget.height,
                  width: (3.5 / 5) * widget.height,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

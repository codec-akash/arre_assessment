import 'package:arre_assessment/model/language_model.dart';
import 'package:arre_assessment/widget/text_widget.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final Language language;
  final bool isSelected;

  const LanguageCard(
      {super.key, required this.language, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected == true
                  ? Theme.of(context).highlightColor
                  : Theme.of(context).primaryColor.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              NormalText(
                text: language.title,
                fontSize: 12,
                textColor: Theme.of(context).primaryColor,
              ),
              if (language.englishTitle.isNotEmpty)
                NormalText(
                  text: language.englishTitle,
                  fontSize: 12,
                  textColor: Theme.of(context).primaryColor,
                ),
              Spacer(),
            ],
          ),
        ),
        if (isSelected)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).highlightColor)),
              child: Icon(
                Icons.check,
                size: 12,
                color: Theme.of(context).highlightColor,
              ),
            ),
          ),
      ],
    );
  }
}

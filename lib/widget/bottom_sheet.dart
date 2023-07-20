import 'package:arre_assessment/model/language_model.dart';
import 'package:arre_assessment/provider/language_provider.dart';
import 'package:arre_assessment/utils/global.dart';
import 'package:arre_assessment/utils/strings.dart';
import 'package:arre_assessment/widget/language_card.dart';
import 'package:arre_assessment/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  List<Language> language = [];
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 20),
        const TitleText(text: Strings.editLanguage),
        const SizedBox(height: 10),
        const NormalText(text: Strings.editLanguageSubtitle),
        const SizedBox(height: 30),
        Consumer(
          builder: (context, ref, child) {
            language = ref.watch<List<Language>>(languageProvider);
            if (language.isEmpty) {
              return const CircularProgressIndicator();
            }
            return Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.5,
                ),
                itemCount: language.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLanguage = language[index].title;
                    });
                  },
                  child: LanguageCard(
                    language: language[index],
                    isSelected: selectedLanguage == language[index].title,
                  ),
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    language = ref.watch<List<Language>>(languageProvider);
                    return GestureDetector(
                      onTap: () async {
                        await ref
                            .read(languageProvider.notifier)
                            .updateLanguage(selectedLanguage);
                        if (context.mounted) {
                          Navigator.of(context).pop(true);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const HeadingText(
                            text: Strings.update, textColor: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const HeadingText(
                      text: Strings.cancel,
                      textColor: Global.tealColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

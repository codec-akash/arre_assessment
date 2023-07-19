import 'package:arre_assessment/utils/image_path.dart';
import 'package:arre_assessment/utils/strings.dart';
import 'package:arre_assessment/utils/themeprovider.dart';
import 'package:arre_assessment/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SvgPicture.asset(ImagePath.backIcon),
                        ),
                        const TitleText(text: Strings.title),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      bool theme = ref.watch<bool>(themeProvider);
                      return Switch(
                        value: theme,
                        onChanged: (val) async {
                          await ref.read(themeProvider.notifier).toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

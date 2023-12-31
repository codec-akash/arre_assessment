import 'package:arre_assessment/utils/image_path.dart';
import 'package:arre_assessment/utils/strings.dart';
import 'package:arre_assessment/widget/bottom_sheet.dart';
import 'package:arre_assessment/widget/list_tile_card.dart';
import 'package:arre_assessment/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  const ListTileCard(
                    svgPath: ImagePath.communityIcon,
                    text: Strings.communityText,
                  ),
                  const ListTileCard(
                    svgPath: ImagePath.helpIcon,
                    text: Strings.help,
                  ),
                  ListTileCard(
                    svgPath: ImagePath.languageIcon,
                    text: Strings.language,
                    onButtonTap: () async {
                      if (mounted) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      }
                      var res = await showModalBottomSheet(
                        context: context,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        builder: (context) => const BottomModal(),
                      );
                      if (res == true) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(Strings.languageUpdated)));
                        }
                      }
                    },
                  ),
                  const ListTileSwitch(text: Strings.interfaceText),
                  const ListTileText(text: Strings.term),
                  const ListTileText(text: Strings.privacy),
                  const ListTileText(text: Strings.deactivateAcc),
                  const ListTileText(text: Strings.deleteAcc),
                  ListTileCard(
                    svgPath: ImagePath.logoutIcon,
                    text: Strings.logout,
                    textColor: Theme.of(context).primaryColor,
                    onButtonTap: () {},
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Hero(
                      tag: ImagePath.logoImage,
                      child: Image.asset(
                        ImagePath.logoImage,
                        height: 110,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:arre_assessment/provider/theme_provider.dart';
import 'package:arre_assessment/screens/home_screen.dart';
import 'package:arre_assessment/utils/image_path.dart';
import 'package:arre_assessment/utils/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.initState();
  }

  Future loadData() async {
    await ref.read(themeProvider.notifier).getDataFromHive();
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        SlidePageBuilder(
          duration: const Duration(milliseconds: 500),
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: ImagePath.logoImage,
            child: Image.asset(ImagePath.logoImage),
          )
        ],
      ),
    );
  }
}

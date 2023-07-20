import 'package:arre_assessment/screens/home_screen.dart';

import 'package:arre_assessment/utils/keys.dart';
import 'package:arre_assessment/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Arre Assessment',
      theme: ThemeData(
        primaryColor: const Color(0xff4BC7B6),
        scaffoldBackgroundColor: Colors.orange[100],
        canvasColor: Colors.grey,
        brightness: Brightness.light,
        fontFamily: Keys.fontFamilyUbuntu,
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xff4BC7B6),
        scaffoldBackgroundColor: const Color(0xff171E26),
        canvasColor: const Color(0xff232C36),
        brightness: Brightness.dark,
        fontFamily: Keys.fontFamilyAcumin,
        highlightColor: const Color(0xffEE8C34),
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}

import 'package:arre_assessment/screens/home_screen.dart';
import 'package:arre_assessment/utils/global.dart';
import 'package:arre_assessment/utils/themeprovider.dart';
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
      theme: darkMode ? Global.darkTheme : Global.lightTheme,
      home: const HomeScreen(),
    );
  }
}

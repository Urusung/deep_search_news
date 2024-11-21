import 'package:deep_search_news/views/home_view/home_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(
          scheme: FlexScheme.flutterDash, fontFamily: 'Pretendard'),
      darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.flutterDash, fontFamily: 'Pretendard'),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}

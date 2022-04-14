import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/common/routes.dart';
import 'package:ob_tj_day_one/common/theme.dart';
import 'package:ob_tj_day_one/providers/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeState = ref.watch(themeProvider);

    return MaterialApp(
      title: 'PDP Assignment 1',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeState.isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: MyRoutes.HOME_SCREEN,
      onGenerateRoute: MyRoutes.generateRoute,
    );
  }
}

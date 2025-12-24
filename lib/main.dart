import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/src/provider/theme_provider.dart';
import 'package:task/src/provider/user_provider.dart';
import 'package:task/src/screen/user_list_screen.dart';
import 'package:task/src/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: theme.themeMode,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

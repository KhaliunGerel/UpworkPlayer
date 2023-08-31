import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:upwork/screens/main_screen.dart';
import 'package:upwork/constants/colors_main.dart';
import 'package:upwork/constants/values.dart';

final colors = ColorsMain();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  final lightTheme = ThemeData(
    fontFamily: 'Glacial Indifference',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
      )
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: colors.PRIMARY, fontFamily: 'Druk', fontWeight: FontWeight.bold, height: 1),

      titleLarge: TextStyle(fontSize: 30, color: colors.PRIMARY, fontFamily: 'Hate Your Writing', fontWeight: FontWeight.w400, height: 0.6),
      titleMedium: TextStyle(fontSize: 24, color: colors.PRIMARY, fontFamily: 'Hate Your Writing', fontWeight: FontWeight.w400, height: 0.6),
      titleSmall: TextStyle(fontSize: 22, color: colors.PRIMARY, fontFamily: 'Hate Your Writing', fontWeight: FontWeight.w400, height: 0.6),

      displayLarge: TextStyle(fontSize: 16, color: colors.PRIMARY, fontWeight: FontWeight.w700, height: 1),
      displayMedium: TextStyle(fontSize: 14, color: colors.PRIMARY, fontWeight: FontWeight.w700, height: 1),
      displaySmall: TextStyle(fontSize: 10, color: colors.PRIMARY, fontWeight: FontWeight.w700, height: 1),

      bodyLarge: TextStyle(fontSize: 15, color: colors.PRIMARY, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 13, color: colors.PRIMARY, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 10, color: colors.PRIMARY, fontWeight: FontWeight.w400),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: colors.PRIMARY)
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const MainScreen()
    );
  }
}

import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';

void main() {
  // 1
  runApp( const Yummy());
}

class Yummy extends StatefulWidget {

  const Yummy({ super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.dark;

  ColorSelection colorSelection = ColorSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }
  void changeColor(int value) {
    setState(() {
      colorSelection = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme

    //3
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelection.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelection.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // 4
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelection,
      ),
    );
  }
}

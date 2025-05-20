import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  // 1
  runApp( Yummy());
}

class Yummy extends StatelessWidget {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelection = ColorSelection.pink;

  Yummy({super.key});

  // TODO: Add changeTheme above here

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
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
      home: Scaffold(
        appBar: AppBar(
          // TODO: Add action buttons
          elevation: 4.0,
          title: const Text(
            appTitle,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        body: const Center(
          child: Text(
            'You Hungry?😋',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}

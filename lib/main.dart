import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  // 1
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  // TODO: Setup default theme

  // 2
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // TODO: Add changeTheme above here
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection  colorSelected = ColorSelection.green;

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    // TODO: Setup default theme

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
      debugShowCheckedModeBanner: false,
      // TODO: Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      // TODO: Apply Home widget

      // 4
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      )
    );
  }

  void changeThemeMode(bool useLightMode){
    setState(() {
      print('Theme Mode: $useLightMode');
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
      print('Theme: $themeMode');

    });
  }
  void changeColor(int color){
    setState(() {
      colorSelected = ColorSelection.values[color];
    });
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_3/color_schemes.g.dart';

import 'package:material_design_3/page/first_page.dart';
import 'package:material_design_3/page/second_page.dart';
import 'package:material_design_3/page/third_page.dart';
import 'package:material_design_3/page/fourth_page.dart';
import 'package:material_design_3/page/fifth_page.dart';

void main() {
  runApp(const MaterialDesigen3());
}

class MaterialDesigen3 extends StatelessWidget {
  const MaterialDesigen3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: const MainPage(title: 'Material Design 3'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
    const FifthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat', backgroundColor: Colors.orange),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Photo', backgroundColor: Colors.lightGreen),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person', backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings', backgroundColor: Colors.grey),
        ],
      ),
    );
  }
}

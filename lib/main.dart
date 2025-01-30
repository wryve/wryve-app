import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wryve Messenger',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

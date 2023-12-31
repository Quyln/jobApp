import 'package:jobAppDT/Components/utils/navigation_to_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: Navigation.login,
      onGenerateRoute: Navigation.getNavigation,
    );
  }
}

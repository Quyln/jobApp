import 'package:duanmoi/Components/tasks%20list/news_class.dart';
import 'package:flutter/material.dart';

class NewDScreen extends StatefulWidget {
  const NewDScreen({super.key, required this.item});

  final NewDScreen item;

  @override
  State<NewDScreen> createState() => _NewDScreenState();
}

class _NewDScreenState extends State<NewDScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

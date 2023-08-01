import 'package:jobAppDT/Components/screens/task_screen.dart';
import 'package:flutter/material.dart';

class TaskSection extends StatelessWidget {
  const TaskSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        height: 350,
        width: 350,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          )
        ], borderRadius: BorderRadius.circular(10), color: Colors.white10),
        child: TaskDesign(),
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:duanmoi/Components/navigation.dart';
import 'package:duanmoi/Components/tasks%20list/task.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class TaskDesign extends StatefulWidget {
  const TaskDesign({Key? key}) : super(key: key);

  @override
  State<TaskDesign> createState() => _TaskDesignState();
}

class _TaskDesignState extends State<TaskDesign> {
  bool loading = false;
  List<Task> task2 = [];

  @override
  void initState() {
    super.initState();
    getTaskList();
  }

  void getTaskList() async {
    final dio = Dio();
    loading = true;
    var response = await dio.get(
        'https://raw.githubusercontent.com/Quyln/jobApp/main/server/TaskList.json');
    if (response.statusCode == 200) {
      // if (response.data is String) {
      //   print('string');
      // } else {
      //   print('map');
      // }
      List<dynamic> dataList = jsonDecode(response.data);
      // for (int i = 0; i < dataList.length; i++) {
      //   dynamic data = dataList[i];
      //   String title = data['title'];
      //   bool completed = data['completed'];
      //   Task task3 = Task(title: title, completed: completed);
      //   newTask.add(task3);
      // }
      task2 = dataList.map((e) => Task.fromJson(e)).toList();
      setState(() {
        loading = false;
        task2;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Loi truy xuat du lieu')));
    }
  }

  // void getTaskList() async {
  //   loading = true;
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> dataList = jsonDecode(response.body);
  //     task2 = dataList.map((e) => Task.fromJson(e)).toList();
  //     setState(() {
  //       loading = false;
  //       task2;
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Loi tai du lieu')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: task2.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () async {
                dynamic result = await Navigator.pushNamed(
                    context, Navigation.detail,
                    arguments: task2[index]);
                print(result);
                setState(() {
                  task2[index].completed = result;
                });
              },
              dense: true,
              leading: const Icon(
                Icons.local_activity,
                color: Color.fromARGB(255, 11, 72, 228),
              ),
              title: Text(
                task2[index].title,
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Checkbox(
                value: task2[index].completed,
                onChanged: (val) {
                  setState(() {
                    task2[index].completed = val!;
                  });
                },
                activeColor: const Color.fromARGB(255, 11, 72, 228),
              ),
            );
          },
        ),
        Visibility(
          visible: loading,
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
                child: CircularProgressIndicator(
              color: Color.fromARGB(255, 11, 72, 228),
            )),
          ),
        )
      ],
    );
  }
}

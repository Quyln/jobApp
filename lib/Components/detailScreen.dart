import 'package:duanmoi/Components/tasks%20list/task.dart';
import 'package:duanmoi/image.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.item});

  final Task item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 600,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer),
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Navigation.home);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        showGeneralDialog(
                            barrierDismissible: true,
                            barrierLabel: 'Thông báo huỷ?',
                            context: context,
                            pageBuilder: ((context, _, __) => Center(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 80,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Scaffold(
                                      body: Column(children: [
                                        Center(
                                          child: Text(
                                            'Bạn thật sự muốn xoá?',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.blue),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'YES',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red),
                                            ),
                                            Text('NO',
                                                style: TextStyle(fontSize: 20))
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Icon(
                        Icons.person,
                        color: fontSty.mauchinh,
                      ),
                      Text(
                        'Người gửi: ',
                        style: TextStyle(color: fontSty.mauchinh),
                      ),
                      Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: fontSty.mauchinh),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Icon(
                        Icons.how_to_vote,
                        color: fontSty.mauchinh,
                      ),
                      Text(
                        'Tiêu đề: ',
                        style: TextStyle(color: fontSty.mauchinh),
                      ),
                      Expanded(
                        child: Text(
                          widget.item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: fontSty.mauchinh),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 445,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Nội dung công việc'),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(!widget.item.completed);
                  },
                  child: Text(
                    'XÁC NHẬN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'TRẢ LỜI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     'HUỶ',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStatePropertyAll(Colors.red)),
                // ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

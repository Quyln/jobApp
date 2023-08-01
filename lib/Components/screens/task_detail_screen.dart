import 'package:jobAppDT/Components/classes/task_class.dart';
import 'package:jobAppDT/Components/utils/images_link.dart';
import 'package:flutter/material.dart';
import '../utils/navigation_to_screens.dart';

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
              padding: const EdgeInsets.all(10),
              height: 600,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer),
                ],
                gradient: const LinearGradient(
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
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
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
                                    child: const Scaffold(
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
                        child: const Icon(
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
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      const Icon(
                        Icons.person,
                        color: FontSty.mauchinh,
                      ),
                      const Text(
                        'Người gửi: ',
                        style: TextStyle(color: FontSty.mauchinh),
                      ),
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: FontSty.mauchinh),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      const Icon(
                        Icons.how_to_vote,
                        color: FontSty.mauchinh,
                      ),
                      const Text(
                        'Tiêu đề: ',
                        style: TextStyle(color: FontSty.mauchinh),
                      ),
                      Expanded(
                        child: Text(
                          widget.item.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: FontSty.mauchinh),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 425,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.item.content,
                      style: const TextStyle(fontSize: 14),
                    ),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'TRẢ LỜI',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: const ButtonStyle(
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

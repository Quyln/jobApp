import 'dart:convert';

import 'package:duanmoi/Components/tasks%20list/new_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../navigation.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> newsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsList();
  }

  void getNewsList() async {
    var url = Uri.parse('uri');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      newsList = dataList.map((e) => NewsDetail.fromJson(e)).toList();
    }
  }

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: newsList
          .map((e) => Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 26, bottom: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Navigation.newdetail, arguments: e);
                  },
                  child: Container(
                      height: 200,
                      padding:
                          const EdgeInsets.only(top: 23, left: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                blurStyle: BlurStyle.outer,
                                color: Color.fromRGBO(0, 0, 0, 0.4))
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 140,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                e.image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 235,
                                  child: Text(
                                    e.title,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  height: 110,
                                  width: 235,
                                  child: Text(
                                    e.content,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ))
          .toList(),
    );
  }
}

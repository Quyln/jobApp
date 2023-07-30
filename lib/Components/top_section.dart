import 'dart:convert';
import 'package:duanmoi/Components/top_class.dart';
import 'package:duanmoi/images_link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'navigation_screen.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  List<dynamic> danhsachtb = [];

  @override
  void initState() {
    super.initState();
    getThongbao();
  }

  void getThongbao() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Quyln/jobApp/main/server/thongbao_data.json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      danhsachtb = dataList.map((e) => ThongBao.fromJson(e)).toList();

      setState(() {
        danhsachtb;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lỗi truy xuất dữ liệu')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 3)
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 11, 72, 228),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(AppImage.anhavatar),
                radius: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Navigation.profile);
            },
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nguyễn Thị Mộng Mơ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  'Nhân viên tuyển dụng',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                )
              ],
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 11, 72, 228),
            ),
            child: InkWell(
              onTap: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: 'Danh sách thông báo',
                    context: context,
                    pageBuilder: (context, _, __) => Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 500,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Danh sách thông báo',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 430,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: danhsachtb.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title:
                                                Text(danhsachtb[index].title),
                                            subtitle: Text(
                                                danhsachtb[index].subtitle),
                                            trailing: const Icon(Icons.close),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
              },
              child: const Icon(
                Icons.notification_important_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:duanmoi/image.dart';
import 'package:flutter/material.dart';

import 'navigation_screen.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

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
                                    Text(
                                      'Danh sách thông báo',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      title: Text('Tiền lương tháng 7'),
                                      subtitle: Text(
                                          'Thông báo số dư: + 10,000,000đ.'),
                                      trailing: Icon(Icons.close),
                                    ),
                                    ListTile(
                                      title: Text('Công việc đã hoàn thành'),
                                      subtitle: Text(
                                          'Dự án ABC đã hoàn thành đúng tiến độ.'),
                                      trailing: InkWell(
                                        child: Icon(Icons.close),
                                        onTap: () {
                                          print('ABC');
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Cuộc họp tháng 7'),
                                      subtitle: Text(
                                          'Cuộc họp sẽ diễn ra vào ngày 20/07 lúc 10h.'),
                                      trailing: Icon(Icons.close),
                                    ),
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

import 'package:duanmoi/image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 210,
                width: 400,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 11, 72, 228),
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  const Text(
                    'Nguyễn Thị Mộng Mơ',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Nhân viên tuyển dụng',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '+ Giới tính: Nữ',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('+ Ngày sinh: 01/01/1990',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('+ Số điện thoại: 0987654321',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https://th.bing.com/th/id/OIP.UGXgAEZkx26AjB3Gkuw-JQHaE4?pid=ImgDet&w=900&h=593&rs=1',
                        height: 70,
                        width: 70,
                      ),
                      Image.network(
                        'https://webstockreview.net/images/gmail-icon-png-2.png',
                        height: 60,
                        width: 60,
                      ),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Facebook_Messenger_logo_2020.svg/1200px-Facebook_Messenger_logo_2020.svg.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Positioned(
              top: 145,
              left: 140,
              height: 120,
              width: 120,
              child: CircleAvatar(
                backgroundImage: NetworkImage(AppImage.anhavatar),
                foregroundColor: Colors.blueAccent,
                radius: 20,
              )),
          const Positioned(
            top: 0,
            left: 0,
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}

import 'dart:convert';
import 'package:duanmoi/profile_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late UserProfile userInfo;
  // @override
  // void initState() {
  //   super.initState();
  // }

  // Future<UserProfile> getUser(int id) async {
  // var url = Uri.parse(
  //     'https://raw.githubusercontent.com/Quyln/jobApp/main/server/profile_data.json');
  // final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     getUser(1).then((user) {
  //       userInfo = user;
  //       print('User ID: ${user.id}, Name: ${user.userName}');
  //     }).catchError((error) {
  //       print(error);
  //     });
  //     return UserProfile.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Khong lay duoc thong tin user');
  //   }
  // }
  List<UserProfile> userInfo = [];
  late UserProfile user;
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Quyln/jobApp/main/server/profile_data.json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      userInfo = dataList.map((e) => UserProfile.fromJson(e)).toList();
      setState(() {
        user = userInfo[0];
      });
    }
  }

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
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 11, 72, 228),
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Image.network(
                  user.coverimage,
                  height: 210,
                  width: 400,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  Text(
                    user.userName,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user.position,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer,
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Image.asset(
                                  'images/gioitinh.png',
                                  height: 40,
                                  width: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              user.gender,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer,
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Image.asset(
                                  'images/cake.png',
                                  height: 40,
                                  width: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              user.dob,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer,
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Image.asset(
                                  'images/phonenumber.png',
                                  height: 40,
                                  width: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              user.phonenb,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              top: 145,
              left: 137,
              height: 120,
              width: 120,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
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
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.manage_accounts,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}

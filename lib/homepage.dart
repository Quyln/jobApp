import 'package:duanmoi/Components/search_section.dart';
import 'package:duanmoi/Components/task_section.dart';
import 'package:duanmoi/Components/tasks%20list/news_design.dart';
import 'package:duanmoi/Components/top_section.dart';
import 'package:duanmoi/Components/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RiveAssets selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 11, 72, 228),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                        onTap: () {
                          bottomNavs[index].input!.change(true);
                          if (bottomNavs[index] != selectedBottomNav) {
                            setState(() {
                              selectedBottomNav = bottomNavs[index];
                            });
                          }
                          Future.delayed(const Duration(seconds: 1), () {
                            bottomNavs[index].input!.change(false);
                          });
                        },
                        child: SizedBox(
                            height: 36,
                            width: 36,
                            child: Opacity(
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);

                                  bottomNavs[index].input =
                                      controller.findSMI('active') as SMIBool;
                                },
                              ),
                            )),
                      ))
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              TopSection(),
              SearchSection(),
              TaskSection(),
              Expanded(
                child: News(),
              ),
            ],
          ),
          // Positioned(
          //     top: 145,
          //     left: 20,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 11, 72, 228),
          //           borderRadius: BorderRadius.circular(25)),
          //       height: 33,
          //       width: 110,
          //       child: Center(
          //           child: Text(
          //         'Hộp thư',
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20,
          //             color: Colors.white),
          //       )),
          //     )),
          Positioned(
              bottom: 154,
              left: 140,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 72, 228),
                    borderRadius: BorderRadius.circular(25)),
                height: 35,
                width: 100,
                child: const Center(
                    child: Text(
                  'Tin tức',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
              ))
        ],
      )),
    );
  }
}

class RiveAssets {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAssets(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAssets> bottomNavs = [
  RiveAssets('assets/RiveAssets/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
      title: 'Search'),
  RiveAssets('assets/RiveAssets/icons.riv',
      artboard: 'HOME', stateMachineName: 'HOME_interactivity', title: 'HOME'),
  RiveAssets('assets/RiveAssets/icons.riv',
      artboard: 'SETTINGS',
      stateMachineName: 'SETTINGS_Interactivity',
      title: 'Settings'),
  RiveAssets('assets/RiveAssets/icons.riv',
      artboard: 'USER', stateMachineName: 'USER_Interactivity', title: 'User'),
];

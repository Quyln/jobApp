import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/navigation_to_screens.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
              height: 30,
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        blurStyle: BlurStyle.outer)
                  ],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: ('Bạn đang tìm gì?...'),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: InputBorder.none),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: InkWell(
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();
              Navigator.of(context).pushReplacementNamed(Navigation.login);
            },
            child: Image.asset(
              'images/close.png',
              height: 30,
              width: 30,
              color: const Color.fromARGB(255, 11, 72, 228),
            ),
          ),
        ),
      ],
    );
  }
}

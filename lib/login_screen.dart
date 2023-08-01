import 'package:jobAppDT/Components/utils/images_link.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Components/utils/navigation_to_screens.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  bool showpassword = true;
  bool loading = false;

  Future<bool> checkloginBE(String id, String pass) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  void initState() {
    super.initState();
    navigation();
  }

  void navigation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? checklogin = pref.getBool('checklogin');
    if (checklogin == true) {
      Navigator.of(context).pushReplacementNamed(Navigation.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        AppImage.anhlogin,
                        height: 250,
                        width: 350,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to the App',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 11, 72, 228),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                              color: Color.fromRGBO(0, 0, 0, 0.4))
                        ]),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: idcontroller,
                      decoration: const InputDecoration(
                          hintText: 'ID....',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 227, 227, 227)),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Color.fromARGB(255, 255, 255, 255),
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 11, 72, 228),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                              color: Color.fromRGBO(0, 0, 0, 0.4))
                        ]),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: passcontroller,
                      decoration: InputDecoration(
                          suffixIconColor: Color.fromARGB(255, 255, 255, 255),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              child: Icon(showpassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: 'Mật khẩu....',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 227, 227, 227)),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Color.fromARGB(255, 255, 255, 255),
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none),
                      obscureText: showpassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: InkWell(
                    onTap: () async {
                      String id = idcontroller.text;
                      String pass = passcontroller.text;
                      print('$id,$pass');
                      if (id.isEmpty || pass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Vui long dien id,pass')));
                        return;
                      }
                      setState(() {
                        loading = true;
                      });
                      bool result = await checkloginBE(id, pass);
                      if (result == true) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setBool('checklogin', true);
                        setState(() {
                          loading = false;
                        });
                        Navigator.of(context)
                            .pushReplacementNamed(Navigation.home);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Loi dang nhap')));
                      }
                      //
                    },
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        color: Color.fromARGB(255, 11, 72, 228),
                      ),
                      child: const Center(
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      'hoặc đăng ký với...',
                      style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://www.quinneysbush.co.nz/wp-content/uploads/2021/04/cropped-Facebook-logo-768x768.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      'https://tools.bard.edu/wwwmedia/cms-icons/9598862/gmail-logo-icon-7.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      'https://th.bing.com/th/id/R.a594bc8ec9713844636895d0261580ef?rik=WyhpMECQGXQEnw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fapple_logo%2fapple_logo_PNG19667.png&ehk=5HXSjV0PkJXPe9OeQcrngoPVyGzadh4r14ZYFifesVg%3d&risl=&pid=ImgRaw&r=0',
                      height: 40,
                      width: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: loading,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black26),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            ),
          )
        ],
      ),
    );
  }
}

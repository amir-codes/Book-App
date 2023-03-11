import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:pdf_viewer/main.dart';
import 'package:status_alert/status_alert.dart';
import 'home_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'theme_changer.dart';

class PresentingPage extends StatefulWidget {
  const PresentingPage({super.key});

  @override
  State<PresentingPage> createState() => _PresentingPageState();
}

class _PresentingPageState extends State<PresentingPage> {
  @override
  void initState() {
    super.initState();
    StatusAlert.show(
      context,
      duration: const Duration(seconds: 2),
      title: 'تذكير',
      subtitle: 'لا تنسى الصلاة على النبي صلى الله عليه و سلم',
      configuration: const IconConfiguration(icon: Icons.remember_me_rounded),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ChangeTheme changer = ChangeTheme();
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Hi reader ,',
          style: TextStyle(
            color: Color.fromARGB(223, 70, 66, 43),
            fontSize: height * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),*/
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/appbackground.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.035,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hi reader ,',
                style: TextStyle(
                  color: Color.fromARGB(223, 70, 66, 43),
                  fontSize: height * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.010,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: const Image(
                  image: AssetImage(
                    'assets/PhotoAtomic.jpeg',
                  ),
                ),
              ),
            ),
            AnimatedButton(
              // ignore: sort_child_properties_last
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'قراءة الكتاب',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.010,
                  ),
                  const Icon(
                    Icons.menu_book,
                    color: Colors.white,
                  ),
                ],
              ),
              width: width * 0.4,
              color: Color.fromARGB(223, 70, 66, 43),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            SizedBox(
              height: height * 0.010,
            ),
            AnimatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                'نبذة عن الكتاب',
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              width: width * 0.4,
              color: const Color.fromARGB(223, 70, 66, 43),
              onPressed: () {},
            ),
            SizedBox(
              height: height * 0.010,
            ),
            AnimatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                'ملخص كل فصل',
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              width: width * 0.4,
              color: Color.fromARGB(223, 70, 66, 43),
              onPressed: () {},
            ),
            SizedBox(
              height: height * 0.015,
            ),
            AnimatedButton(
              // ignore: sort_child_properties_last
              child: Row(
                children: [
                  Text(
                    '  تحميل الكتاب ',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ],
              ),
              height: height * 0.05,
              width: width * 0.35,
              color: Colors.red,
              onPressed: () {
                // ignore: deprecated_member_use
                launch(
                    'https://www.mediafire.com/file/cnuac6usl8lbbh9/%25D9%2583%25D8%25AA%25D8%25A7%25D8%25A8_%25D8%25A7%25D9%2584%25D8%25B9%25D8%25A7%25D8%25AF%25D8%25A7%25D8%25AA_%25D8%25A7%25D9%2584%25D8%25B0%25D8%25B1%25D9%258A%25D8%25A9_-Amir_Codes.pdf/file');
              },
            ),
            Spacer(),
            Center(
              child: Text(
                ': تابعنا على مواقع التواصل الاجتماعي ',
                style: TextStyle(
                  color: Color.fromARGB(223, 70, 66, 43),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://www.instagram.com/amir_codes/');
                    },
                    child: ClipRRect(
                      child: Image(
                        height: height * 0.06,
                        image: const AssetImage('assets/instagram_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  GestureDetector(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://github.com/lord-sifo');
                    },
                    child: ClipRRect(
                      child: Image(
                        height: height * 0.06,
                        image: const AssetImage('assets/github_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  GestureDetector(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch(
                          'https://www.linkedin.com/in/amir-mellouk-a51b6b259/');
                    },
                    child: ClipRRect(
                      child: Image(
                        height: height * 0.06,
                        image: const AssetImage('assets/likedin_logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            )
          ],
        ),
      ),
    );
  }
}

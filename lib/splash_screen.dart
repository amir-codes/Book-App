import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pdf_viewer/presenting_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => const PresentingPage()))
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 57, 50),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.35,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/atomiic.png'),
              radius: 100,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const SpinKitThreeBounce(
              color: Color.fromARGB(255, 204, 203, 117),
              size: 50.0,
            ),
            /*SizedBox(
              height: 50,
            ),*/
            const Spacer(),
            const Text(
              'Developed By :',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Text(
              'Amir Codes',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}

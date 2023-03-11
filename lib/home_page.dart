// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer/favourites-data.dart';
import 'package:pdf_viewer/main.dart';
import 'package:pdf_viewer/presenting_page.dart';
import 'package:pdf_viewer/splash_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_changer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PdfViewerController? _pdfViewerController;
  int _currentPage = 0;
  bool _horizental = false;
  final addMyfav favPages = addMyfav();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _currentPage = prefs.getInt('current')!;
      SharedPreferences horiz = await SharedPreferences.getInstance();
      _horizental = horiz.getBool('_horiz')!;
      if (_currentPage != 1) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                content: Text(
                    'آخر مرة توقفت في الصفحة رقم $_currentPage ,هل تريد الاستمرار؟'),
                actions: [
                  TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: const Text('لا,أريد البدء من جديد'),
                  ),
                  TextButton(
                    onPressed: () {
                      _pdfViewerController!.jumpToPage(_currentPage);
                      Navigator.pop(context);
                    },
                    child: const Text('نعم'),
                  )
                ],
              )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ChangeTheme changer = ChangeTheme();
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Atomic Habits',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) => [
              popMenuItem(true),
              popMenuItem(false),
            ],
          ),
        ],
      ),*/
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => const PresentingPage()));
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color.fromARGB(255, 58, 57, 50),
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) => [
              popMenuItem(_horizental),
              popUpItemFavPages(),
            ],
          ),
        ],
      ),
      body: Center(
        child: SfPdfViewer.asset(
          'assets/atomic_habits.pdf',
          controller: _pdfViewerController,
          onPageChanged: (PdfPageChangedDetails details) async {
            _currentPage = details.newPageNumber;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setInt('current', _currentPage);
          },
          scrollDirection: _horizental
              ? PdfScrollDirection.horizontal
              : PdfScrollDirection.vertical,
        ),
      ),
    );
  }

  PopupMenuItem<dynamic> popUpItemFavPages() {
    return PopupMenuItem(
        child: TextButton(
      onPressed: () {
        favPages.addfav(_currentPage);
      },
      child: Row(
        children: const [
          Text(
            'Add page to fav page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ));
  }

  PopupMenuItem<dynamic> popMenuItem(bool horizental) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
              horizental ? Icons.swap_vert_outlined : Icons.swap_horiz_outlined,
              color: Colors.black),
          Text(
            horizental
                ? 'convert to vertical scroll'
                : 'convert to Horizental scroll',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      onTap: () async {
        setState(() {
          horizental = !horizental;
          _horizental = horizental;

          print(_horizental);
        });
        SharedPreferences horiz = await SharedPreferences.getInstance();
        _horizental = horiz.setBool('_horiz', _horizental) as bool;
      },
    );
  }
}

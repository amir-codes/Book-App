import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyFavSelected extends StatefulWidget {
  const MyFavSelected({super.key});

  @override
  State<MyFavSelected> createState() => _MyFavSelectedState();
}

class _MyFavSelectedState extends State<MyFavSelected> {
  PdfViewerController? _favpdfViewerController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfPdfViewer.asset(
          'assets/atomic_habits.pdf',
          controller: _favpdfViewerController,
          onPageChanged: null,
        ),
      ),
    );
  }
}

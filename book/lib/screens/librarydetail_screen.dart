// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class LibrarydetailScreen extends StatefulWidget {
  @override
  _LibrarydetailScreenState createState() => _LibrarydetailScreenState();
}

class _LibrarydetailScreenState extends State<LibrarydetailScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        child: PDF(
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
        ).fromAsset('assets/books/ai.pdf'),
      ),
    ));
  }
}

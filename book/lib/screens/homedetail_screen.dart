// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, must_be_immutable

import 'dart:ffi';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:book/colors/color_value.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';

class DetailScreen extends StatelessWidget {
  // final PopularBookModel _popularBookModel;
  // DetailScreen(this._popularBookModel);

  String title, coverurl, bookurl, author, uicontent;
  int rating;
  bool loading = false;
  Dio dio = new Dio();
  String filePath = "";
  String imagePath = "";
  DetailScreen(
      {required this.title,
      required this.author,
      required this.bookurl,
      required this.uicontent,
      required this.coverurl,
      required this.rating});

  getreview() async {
    //sem result

    var response = await http.get(Uri.parse(
        'https://major-project-ekitab.herokuapp.com/reviews?q=' + title));
    print(title);
    print(response.body);
    //print("what the hell is this");
  }

//read epub
  createFolder() async {
    final folderName = "images";
    final path = Directory(
        "/storage/emulated/0/Android/data/com.example.book/files/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
  }

  //download
  startDownload() async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + '/' + title + '.' + author + '.epub';
    var ext = coverurl.split('.');
    String imagep = appDocDir.path + '/images/' + title + '.' + ext.last;
    File file = File(path);
    File image = File(imagep);
    print("fuck.............................");
    print(path);

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        'https://major-project-ekitab.herokuapp.com' + bookurl,
        path,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          print((receivedBytes / totalBytes * 100).toStringAsFixed(0));
          //Check if download is complete and close the alert dialog
          if (receivedBytes == totalBytes) {
            loading = false;

            filePath = path;
          }
        },
      );
    } else {
      loading = false;

      filePath = path;
    }

    if (!File(imagep).existsSync()) {
      await file.create();
      await dio.download(
        'https://major-project-ekitab.herokuapp.com' + coverurl,
        imagep,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          print((receivedBytes / totalBytes * 100).toStringAsFixed(0));
          //Check if download is complete and close the alert dialog
          if (receivedBytes == totalBytes) {
            loading = false;

            imagePath = imagep;
          }
        },
      );
    } else {
      loading = false;

      imagePath = imagep;
    }
//    await file.delete();r
  }

  Future downloadFile() async {
    print('download already done');
    print(filePath);

    if (await Permission.storage.isGranted) {
      await Permission.storage.request();

      await startDownload();
    } else {
      await startDownload();
    }
  }

  download() async {
    if (Platform.isAndroid || Platform.isIOS) {
      print('download');
      await downloadFile();
    } else {
      loading = false;
    }

    print(filePath);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
        height: 45,
        color: Colors.transparent,
        child: FloatingActionButton(
          onPressed: () {
            createFolder();
            startDownload();
          },
          backgroundColor: Colors.deepPurple,
          child: Text(
            'Download Book',

            // style: GoogleFonts.openSans(
            //     fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  color: Colors.deepPurple,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62),
                          width: 172,
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://major-project-ekitab.herokuapp.com" +
                                      coverurl),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 25),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    // style: GoogleFonts.openSans(
                    //     fontSize: 25,
                    //     color: kBlackColor,
                    //     fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7, left: 25),
                  child: Text(
                    author,
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    // style: GoogleFonts.openSans(
                    //     fontSize: 14,
                    //     color: kGreyColor,
                    //     fontWeight: FontWeight.w400),
                  ),
                ),
                // Padding(
                //     padding: EdgeInsets.only(top: 7, left: 25),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           '\Rs. ' + _popularBookModel.price,
                //           style: GoogleFonts.openSans(
                //               fontSize: 14,
                //               color: kMainColor,
                //               fontWeight: FontWeight.w600),
                //         ),
                //       ],
                //     )),
                SizedBox(height: 20),
                Container(
                  height: 28,
                  margin: EdgeInsets.only(right: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Text(
                    uicontent,
                    // style: GoogleFonts.openSans(
                    //   fontSize: 12,
                    //   fontWeight: FontWeight.w400,
                    //   color: kGreyColor,
                    //   letterSpacing: 1.5,
                    //   height: 2,
                    // ),
                  ),
                ),

                Container(
                  height: 28,
                  margin: EdgeInsets.only(right: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Text(
                    uicontent,
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

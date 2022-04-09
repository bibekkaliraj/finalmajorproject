import 'package:book/colors/color_value.dart';
import 'package:book/models/download_model.dart';
import 'package:book/screens/librarydetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

//import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  var titlelist = [];
  var imagelist = [];
  Map<String, String> books = {};
  void listfile() async {
    final dir =
        Directory('/storage/emulated/0/Android/data/com.example.book/files');
    final List<FileSystemEntity> entities = await dir.list().toList();

    entities.forEach((element) {
      // print(element.path.substring(56));
      if (element.path.endsWith('epub')) {
        setState(() {
          titlelist.add(element.path.substring(56));
        });
      }
    });
    final dir1 = Directory(
        '/storage/emulated/0/Android/data/com.example.book/files/images');
    final List<FileSystemEntity> images = await dir1.list().toList();
    images.forEach((element) {
      // print(element.path.substring(56));

      setState(() {
        imagelist.add(element.path);
      });
    });
    print(titlelist);
    print(imagelist);
    // print(titlelist);
  }

  givefile(path) {
    return File(path);
  }

  @override
  void initState() {
    // TODO: implement initState
    listfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: titlelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    EpubViewer.setConfig(
                      themeColor: Theme.of(context).primaryColor,
                      identifier: "iosBook",
                      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                      allowSharing: true,
                      enableTts: true,
                    );

                    // get current locator
                    EpubViewer.locatorStream.listen((locator) {
                      print(
                          'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                    });

                    EpubViewer.open(
                      "/storage/emulated/0/Android/data/com.example.book/files/" +
                          titlelist[index],
                      lastLocation: EpubLocator.fromJson({
                        "bookId": "2239",
                        "href": "/OEBPS/ch06.xhtml",
                        "created": 1539934158390,
                        "locations": {
                          "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                        }
                      }),
                    );

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => LibrarydetailScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 19),
                    height: 81,
                    width: MediaQuery.of(context).size.width - 50,
                    color: kBackgroundColor,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 81,
                          width: 62,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: FileImage(File(imagelist[index]))),
                              color: kMainColor),
                        ),
                        const SizedBox(
                          width: 21,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              titlelist[index].toString().split('.')[0],
                              //                             style: GoogleFonts.openSans(
                              //                               fontSize: 16,
                              //                                 fontWeight: FontWeight.w600,
                              //                                 color: kBlackColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              titlelist[index].toString().split('.')[1],
                              //                             style: GoogleFonts.openSans(
                              //                                 fontSize: 12,
                              //                                 fontWeight: FontWeight.w400,
                              //                                 color: kGreyColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

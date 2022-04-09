// ignore_for_file: prefer_const_constructors, unused_field, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, avoid_print, prefer_const_literals_to_create_immutables

import 'package:book/models/Apibook_Model.dart';
import 'package:book/screens/homedetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../colors/color_value.dart';
import '../models/computerbook_model.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> fetchData() async {
    String url = "https://major-project-ekitab.herokuapp.com/recs";
    http.Response data = await http.post(Uri.parse(url),
        body: ({
          'username': '074bct519',
        }));

    return data.body;
  }

  Future<String> getData() async {
    String url = "https://major-project-ekitab.herokuapp.com/recs";
    http.Response data1 = await http.post(Uri.parse(url),
        body: ({
          'username': '074bct519',
        }));

    print(data1.body);
    print('kulle');
    return data1.body;
  }

  void logandscreen(title, uicontent, coverurl, bookurl, author, rating) async {
    String url = "https://major-project-ekitab.herokuapp.com/savelog";
    http.Response data1 = await http.post(Uri.parse(url),
        body: ({
          'username': '074bct519',
          'title': title,
        }));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailScreen(
              title: title,
              uicontent: uicontent,
              coverurl: coverurl,
              bookurl: bookurl,
              author: author,
              rating: rating)),
    );
  }

  @override
  void initState() {
    getData();
    print("hell");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            initialData: [],
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError && !snapshot.hasData) {
                return Center(child: Text("Unable to fetch the data"));
              }
              // print('data');
              // print(snapshot.data);
              var rawdata = snapshot.data as String;

              APIBookModel apiModel =
                  APIBookModel.fromJson('{"bookDatas": ' + rawdata + '}');
              List<BookData> data = apiModel.bookDatas;
              if (data.isEmpty) {
                return Center(
                  child: Text("Empty List"),
                );
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Recommended books',
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 22),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 21),
                          height: 210,
                          child: GestureDetector(
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 25, right: 6),
                                itemCount: computerbooks.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 19),
                                    height: 210,
                                    width: 153,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kMainColor,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              computerbooks[index].image),
                                        )),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Popular",
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      ((context, index) => GestureDetector(
                            onTap: () {
                              logandscreen(
                                  data[index].title,
                                  data[index].uicontent,
                                  data[index].coverurl,
                                  data[index].bookurl,
                                  data[index].author,
                                  data[index].rating);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 19, bottom: 19),
                              height: 81,
                              width: MediaQuery.of(context).size.width - 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 81,
                                      width: 62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://major-project-ekitab.herokuapp.com" +
                                                  data[index].coverurl),
                                        ),
                                        // color: kMainColor
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: kBlackColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data[index].author,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: kMainColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                      childCount: data.length,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

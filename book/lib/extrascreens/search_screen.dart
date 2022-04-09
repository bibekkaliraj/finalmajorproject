// // ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_field, unused_element, avoid_print

import 'package:book/models/search_model.dart';
import 'package:book/semscreen/sem_screen.dart';
import 'package:book/services/searchservices.dart';
import 'package:flutter/material.dart';
import '../colors/color_value.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

var semesterLists = [
  'Semester 1',
  'Semester 2',
  'Semester 3',
  'Semester 4',
  'Semester 5',
  'Semester 6',
  'Semester 7',
  'Semester 8',
];
getsem(sem) async {
  //sem result
  var response = await http.get(
      Uri.parse('https://major-project-ekitab.herokuapp.com/sem?sem=' + '0'));
  //print(response.body);
  //print("what the hell is this");
}

Future<List<SearchModel>> handleSubmit() async {
  //search resault
  print(searchword.text);
  var response = await http.post(
      Uri.parse('https://major-project-ekitab.herokuapp.com'),
      body: ({'username': '074bct519', 'q': searchword.text}));
  final List<SearchModel> searchModel = searchModelFromJson(response.body);
  print(searchModel);
  return searchModel;
}

getoptions(value) {
  print(value);
}

TextEditingController searchword = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  handlesearch() {
    var t = searchword.text;
    print(t);
    handleSubmit();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
              color: kBackgroundColor, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            controller: searchword,
            onChanged: (value) {
              print(value);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(top: 13, bottom: 13, left: 17, right: 13),
              hintText: "Search",
              suffixIcon: IconButton(
                onPressed: handlesearch,
                icon: Icon(Icons.search),
              ), // IconButton
            ), // InputDecoration
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: semesterLists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    getsem(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      right: 5,
                      left: 5,
                    ),
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            semesterLists[index],
                            style: TextStyle(fontSize: 15, color: kWhiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
                future: handleSubmit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData) {
                    return Center(child: Text("Unable to fetch the data"));
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Snapshot has error"));
                  } else {
                    List<SearchModel> _searchData =
                        snapshot.data as List<SearchModel>;
                    if (snapshot.data == []) {
                      return Center(
                        child: Text("Empty List"),
                      );
                    }
                    return SizedBox(
                      child: ListView.builder(
                          padding:
                              EdgeInsets.only(top: 15, right: 15, left: 15),
                          itemCount: _searchData.length,
                          itemBuilder: (context, index) {
                            SearchModel searchData = _searchData[index];
                            return GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 19),
                                height: 50,
                                width: MediaQuery.of(context).size.width - 50,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 81,
                                        width: 62,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://major-project-ekitab.herokuapp.com" +
                                                    searchData.coverurl),
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
                                            searchData.title,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            searchData.author,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

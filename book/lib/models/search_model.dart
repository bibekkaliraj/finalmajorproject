// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
    json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  SearchModel({
    required this.id,
    required this.title,
    required this.bookurl,
    required this.isbn,
    required this.publisher,
    required this.place,
    required this.bookNo,
    required this.subject,
    required this.author,
    required this.coverurl,
    required this.uicontent,
    required this.time,
    required this.rating,
  });

  int id;
  String title;
  dynamic bookurl;
  String isbn;
  String publisher;
  String place;
  String bookNo;
  int subject;
  String author;
  String coverurl;
  String uicontent;
  DateTime time;
  double rating;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        title: json["title"],
        bookurl: json["bookurl"],
        isbn: json["isbn"],
        publisher: json["publisher"],
        place: json["place"],
        bookNo: json["book_no"],
        subject: json["subject"],
        author: json["author"],
        coverurl: json["coverurl"],
        uicontent: json["uicontent"],
        time: DateTime.parse(json["time"]),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "bookurl": bookurl,
        "isbn": isbn,
        "publisher": publisher,
        "place": place,
        "book_no": bookNo,
        "subject": subject,
        "author": author,
        "coverurl": coverurl,
        "uicontent": uicontent,
        "time": time.toIso8601String(),
        "rating": rating,
      };
}

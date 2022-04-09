// ignore_for_file: non_constant_identifier_names, unnecessary_cast

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class APIBookModel {
  final List<BookData> bookDatas;
  APIBookModel({
    required this.bookDatas,
  });

  APIBookModel copyWith({
    List<BookData>? bookDatas,
  }) {
    return APIBookModel(
      bookDatas: bookDatas ?? this.bookDatas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookDatas': bookDatas.map((x) => x.toMap()).toList(),
    };
  }

  factory APIBookModel.fromMap(Map<String, dynamic> map) {
    return APIBookModel(
      bookDatas: List<BookData>.from(
        (map['bookDatas'] as List<dynamic>).map<BookData>(
          (x) => BookData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory APIBookModel.fromJson(String source) =>
      APIBookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'APIBookModel(bookDatas: $bookDatas)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is APIBookModel && listEquals(other.bookDatas, bookDatas);
  }

  @override
  int get hashCode => bookDatas.hashCode;
}

class BookData {
  final int id;
  final String title;
  final String bookurl;
  final String isbn;
  final String publisher;
  final String place;
  final String book_no;
  final int subject;
  final String author;
  final String coverurl;
  final String uicontent;
  final String time;
  final int rating;
  BookData({
    required this.id,
    required this.title,
    required this.bookurl,
    required this.isbn,
    required this.publisher,
    required this.place,
    required this.book_no,
    required this.subject,
    required this.author,
    required this.coverurl,
    required this.uicontent,
    required this.time,
    required this.rating,
  });

  BookData copyWith({
    int? id,
    String? title,
    String? bookurl,
    String? isbn,
    String? publisher,
    String? place,
    String? book_no,
    int? subject,
    String? author,
    String? coverurl,
    String? uicontent,
    String? time,
    int? rating,
  }) {
    return BookData(
      id: id ?? this.id,
      title: title ?? this.title,
      bookurl: bookurl ?? this.bookurl,
      isbn: isbn ?? this.isbn,
      publisher: publisher ?? this.publisher,
      place: place ?? this.place,
      book_no: book_no ?? this.book_no,
      subject: subject ?? this.subject,
      author: author ?? this.author,
      coverurl: coverurl ?? this.coverurl,
      uicontent: uicontent ?? this.uicontent,
      time: time ?? this.time,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'bookurl': bookurl,
      'isbn': isbn,
      'publisher': publisher,
      'place': place,
      'book_no': book_no,
      'subject': subject,
      'author': author,
      'coverurl': coverurl,
      'uicontent': uicontent,
      'time': time,
      'rating': rating,
    };
  }

  factory BookData.fromMap(Map<String, dynamic> map) {
    return BookData(
      id: map['id'].toInt() as int,
      title: map['title'] ?? '' as String,
      bookurl: map['bookurl'] ?? '' as String,
      isbn: map['isbn'] ?? '' as String,
      publisher: map['publisher'] ?? '' as String,
      place: map['place'] ?? '' as String,
      book_no: map['book_no'] ?? '' as String,
      subject: map['subject'].toInt() as int,
      author: map['author'] ?? '' as String,
      coverurl: map['coverurl'] ?? '' as String,
      uicontent: map['uicontent'] ?? '' as String,
      time: map['time'] ?? '' as String,
      rating: map['rating'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookData.fromJson(String source) =>
      BookData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookData(id: $id, title: $title, bookurl: $bookurl, isbn: $isbn, publisher: $publisher, place: $place, book_no: $book_no, subject: $subject, author: $author, coverurl: $coverurl, uicontent: $uicontent, time: $time, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookData &&
        other.id == id &&
        other.title == title &&
        other.bookurl == bookurl &&
        other.isbn == isbn &&
        other.publisher == publisher &&
        other.place == place &&
        other.book_no == book_no &&
        other.subject == subject &&
        other.author == author &&
        other.coverurl == coverurl &&
        other.uicontent == uicontent &&
        other.time == time &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        bookurl.hashCode ^
        isbn.hashCode ^
        publisher.hashCode ^
        place.hashCode ^
        book_no.hashCode ^
        subject.hashCode ^
        author.hashCode ^
        coverurl.hashCode ^
        uicontent.hashCode ^
        time.hashCode ^
        rating.hashCode;
  }
}

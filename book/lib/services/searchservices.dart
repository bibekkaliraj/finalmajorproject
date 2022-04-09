import 'package:book/models/search_model.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  static const String url = 'https://major-project-ekitab.herokuapp.com/recs';
  static Future<List<SearchModel>> getSearchResult() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<SearchModel> searchdata = searchModelFromJson(response.body);
        return searchdata;
      } else {
        return <SearchModel>[];
      }
    } catch (e) {
      return <SearchModel>[];
    }
  }
}

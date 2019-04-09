import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:project_demo/models/city.dart';

import 'package:project_demo/models/result.dart';

class FetchMovies {
  Future<FetchResult> getMovieList(String cityID) async {
    final response  = await http.get('https://api-m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=$cityID');
    final responseString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return FetchResult.fromJSON(responseString);
    } else {
      throw Exception("failed to load movies");
    }
  }
}

class FetchCities {
  Future<CityList> getcityList() async {
    final response  = await http.get('https://api-m.mtime.cn/Showtime/HotCitiesByCinema.api');
    final responseString = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CityList.fromJSON(responseString);
    } else {
      throw Exception("failed to load movies");
    }
  }
}
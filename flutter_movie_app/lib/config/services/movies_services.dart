import 'package:flutter_movie_app/util/constants.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/movies/movies_response.dart';

class MovieNowPlaying {
  Future<List<Results>?> getNowPlaying() async {
    try {
      var response = await http
          .get(Uri.parse(
              "$baseUrl/movie/now_playing?page=1&key=$apiKey"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Timeout");
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.json.decode(response.body);
        List<dynamic> jsonResponse = map["results"];
        return jsonResponse.map((e) => Results.fromJson(e)).toList();
      }
    } on TimeoutException catch (_) {
      print("Timeout");
    }
  }
}

class MovieUpcoming {
  Future<List<Results>?> getUpcoming() async {
    try {
      var response = await http
          .get(Uri.parse(
              "$baseUrl/movie/upcoming?page=1&key=$apiKey"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Timeout");
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.json.decode(response.body);
        List<dynamic> jsonResponse = map["results"];
        return jsonResponse.map((e) => Results.fromJson(e)).toList();
      }
    } on TimeoutException catch (_) {
      print("Timeout");
    }
  }
}

class MoviePopular {
  Future<List<Results>?> getPopular() async {
    try {
      var response = await http
          .get(Uri.parse(
              "$baseUrl/movie/popular?page=1&key=$apiKey"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Timeout");
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.json.decode(response.body);
        List<dynamic> jsonResponse = map["results"];
        return jsonResponse.map((e) => Results.fromJson(e)).toList();
      }
    } on TimeoutException catch (_) {
      print("Timeout");
    }
  }
}
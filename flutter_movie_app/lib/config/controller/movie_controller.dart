import 'package:flutter_movie_app/config/model/movies/movies_response.dart';
import 'package:flutter_movie_app/config/services/movies_services.dart';
import 'package:get/get.dart';

class MovieNowPlayingController extends GetxController {
  var getLatest = <Results>[].obs;
  MovieNowPlaying services = MovieNowPlaying();
  var postLoading = true.obs;

  @override
  void onInit() {
    callPostMethod();
    super.onInit();
  }

  callPostMethod() async {
    try {
      postLoading.value = true;
      var result = await services.getNowPlaying();
      if (result != null) {
        getLatest.assignAll(result);
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }
}

class MovieUpcomingController extends GetxController {
  var getLatest = <Results>[].obs;
  MovieUpcoming services = MovieUpcoming();
  var postLoading = true.obs;

  @override
  void onInit() {
    callPostMethod();
    super.onInit();
  }

  callPostMethod() async {
    try {
      postLoading.value = true;
      var result = await services.getUpcoming();
      if (result != null) {
        getLatest.assignAll(result);
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }
}

class MoviePopularController extends GetxController {
  var getLatest = <Results>[].obs;
  MoviePopular services = MoviePopular();
  var postLoading = true.obs;

  @override
  void onInit() {
    callPostMethod();
    super.onInit();
  }

  callPostMethod() async {
    try {
      postLoading.value = true;
      var result = await services.getPopular();
      if (result != null) {
        getLatest.assignAll(result);
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }
}
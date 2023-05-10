import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidad3_peliculas/models/movies.dart';
import 'package:unidad3_peliculas/models/now_playing_response.dart';
import 'package:unidad3_peliculas/models/popular_response.dart';


class MoviesProvider extends ChangeNotifier{
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  List<Movie> onGetNowPlaying=[];
  List<Movie> popularMovies=[];

  MoviesProvider(){
    print('Movies Provider Inicializado');
    getNowPlaying();
    
  }

  getNowPlaying() async {
    var url=Uri.https(_baseUrl,'3/movies/now_playing',{
      'api_key':_apiKey,'Language':_language, 'page':'1'
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
     onGetNowPlaying=nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies()async{
    var url =Uri.https(_baseUrl,'3/movie/popular',
    {'api_key':_apiKey, 'language':_language, 'page':'1'});
    final response =await http.get(url);
    final popularResponse = PopularResponse.fromRawJson(response.body);
    popularMovies=[...popularMovies,...popularResponse.results];
    notifyListeners();
  }
}
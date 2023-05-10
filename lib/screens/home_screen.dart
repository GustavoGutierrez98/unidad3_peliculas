import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unidad3_peliculas/providers/movies_provider.dart';
import 'package:unidad3_peliculas/widgets/card_swiper.dart';
import 'package:unidad3_peliculas/widgets/movie_slider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({super.key});

@override
Widget build(BuildContext context){
//colocamos la instancia moviesprovider en mi variable moviesprovider
final moviesProvider = Provider.of<MoviesProvider>(context);
  return Scaffold(
appBar: AppBar(
  actions: [
    IconButton(onPressed: (){},
    icon: const Icon (Icons.search_outlined),
    )
  ],
  title: const Center(
    child: Text('Peliculas'),
  ),
),
body: SingleChildScrollView(
  child: Column(
  
    children: [
      CardSwiper(movies: moviesProvider.onGetNowPlaying),
      MovieSlider(movies: moviesProvider.popularMovies, titulo:'popular',)
    ],
  ),
)
  );
}
}
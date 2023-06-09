import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:unidad3_peliculas/models/movies.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      //50% del tamano de la pantalla
      height: size.height * 0.5,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, index) {
            final movie = movies[index];
            print(movie.posterPath);
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: ''),
                  child:ClipRRect(borderRadius: BorderRadius.circular(20),
                  child: const FadeInImage(
                  placeholder:
                      NetworkImage('https://via.placeholder.com/300x400'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                  ),
                  ),
            );
          }
          ),
    );
  }
}
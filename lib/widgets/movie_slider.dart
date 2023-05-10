import 'package:flutter/material.dart';
import 'package:unidad3_peliculas/models/movies.dart';

class MovieSlider extends StatelessWidget{
  final List<Movie> movies;
  final String? titulo;
  const MovieSlider({super.key, required this.movies, this.titulo});

@override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Text('populares',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(child: ListView.builder(itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder:( _ , int index) => _MoviePoster(),
          )
         )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,'details',arguments: ''),
            child: ClipRRect(borderRadius: BorderRadius.circular(35),
            child: const FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  width: 130,
                  height: 185,
                  fit: BoxFit.cover,
                  ),
                  ),
          ),
          const SizedBox(height: 5,),
          const Text('peliculas',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
        ),
    );
  }
}
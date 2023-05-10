import 'package:flutter/material.dart';
import 'package:unidad3_peliculas/widgets/movie_slider.dart';


class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

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
          child: Text('ACTORES',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
      width: 90,
      height: 90,
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,'details',arguments: ''),
            child: ClipRRect(borderRadius: BorderRadius.circular(50),
            child: const FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  ),
                  ),
          ),
          const SizedBox(height: 5,),
          const Text('Actores',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
        ),
    );
  }
}
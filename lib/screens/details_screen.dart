import 'package:flutter/material.dart';
import 'package:unidad3_peliculas/widgets/casting_cards.dart';
import 'package:unidad3_peliculas/widgets/movie_slider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
    ModalRoute.of(context)?.settings.arguments.toString() ?? 'sin nombre';
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              const _PosterAndTitle(),
              const _Overview(),
              const CastingCards(),
            ]
            )
          )
        ]
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget{
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context){
    return SliverAppBar(
      backgroundColor:Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned:true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle:true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black38,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 18),
          ),
          ),
          background: const FadeInImage(
            placeholder: NetworkImage('https://via.placeholder.com/530x300'),
            image: NetworkImage('https://via.placeholder.com/530x300'),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(20),
          child:const FadeInImage(
            placeholder: NetworkImage('https://via.placeholder.com/200x300'),
             image: NetworkImage('https://via.placeholder.com/200x300',),
             height: 250,           
             )
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'movie.title',
                style: TextStyle(fontSize:16),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Text(
                'movie.title.original',
                style: TextStyle(fontSize:16),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: const[
                  
                  Icon(Icons.star_outline,
                  size:20,
                  color: Colors.amber,
                  ), 
                  SizedBox(width: 5,),
                   Text(
                        'movie.title',
                        style: TextStyle(fontSize: 18),
                      ),
                ],
              )
            ],
            )
            )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

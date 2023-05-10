import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unidad3_peliculas/providers/movies_provider.dart';
import 'package:unidad3_peliculas/screens/details_screen.dart';
import 'package:unidad3_peliculas/screens/screens.dart';
import 'package:unidad3_peliculas/widgets/movie_slider.dart';
import 'package:unidad3_peliculas/screens/home_screen.dart';

void main() {
  runApp(const AppState());
}
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
          )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:digital_banking/src/modules/digitalBanking/movie/domain/entities/movie.dart';

class MoviePage extends StatelessWidget {
  final List<Movie> movies;
  MoviePage({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie App Clean Architecture"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 4.0,
              child: Container(
                height: 300.0,
                color: Colors.transparent,
                child: Center(
                  child: (movies[i].posterPath == null)
                      ? CircularProgressIndicator()
                      : Image.network(
                          "https://image.tmdb.org/t/p/w185" +
                              movies[i]?.posterPath.toString(),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

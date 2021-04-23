import 'package:digital_banking/src/modules/digitalBanking/movie/domain/entities/movie.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/presentation/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatelessWidget {
  Movie movies;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie App Clean Architecture"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.movie),
          onPressed: () =>
              BlocProvider.of<MovieBloc>(context).add(GetMovie(movies)),
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            // switch (state) {
            //   case state.initState():
            //     return Center(child: CircularProgressIndicator());
            //     break;
            //   case Loading:
            //     return ListView.builder(
            //       itemCount: 3,
            //       itemBuilder: (context, i) {
            //         return Card(
            //           elevation: 4.0,
            //           child: Container(
            //             height: 300.0,
            //             color: Colors.red,
            //             child: Text(movies.adult.toString()),
            //           ),
            //         );
            //       },
            //     );
            //   default:
            // }

            // if (state is Empty) {
            //   return Center(child: CircularProgressIndicator());
            // }

            // if (state is Loading) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 4.0,
                  child: Container(
                    height: 300.0,
                    color: Colors.transparent,
                    child: Text(state.movie.adult.toString()),
                  ),
                );
              },
            );
            // }
            // return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

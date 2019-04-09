
import 'package:flutter/material.dart';
import 'package:project_demo/common/bloc_provider.dart';
import 'package:project_demo/models/result.dart';
import 'package:project_demo/movies/movies_list/movies_bloc.dart';

class Movies extends StatelessWidget{
  
  final String cityId;
  Movies({
    this.cityId
  });

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return BlocProvider<MoviesBloc>(
          bloc: MoviesBloc(cityID: cityId),
          child: Scaffold(
          appBar: AppBar(
            title: Text('Movie List'),
          ),
          body:  MoviesContent(),
          )
      );
  }
}

class MoviesContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final MoviesBloc bloc = BlocProvider.of<MoviesBloc>(context);

    return Center(
          child:  StreamBuilder<FetchResult>(
            stream: bloc.movieresults,
            builder: (BuildContext context, AsyncSnapshot<FetchResult> snapshot){
              if (snapshot.data!=null){
              final movies = snapshot.data.movies;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(( context, index){
                      return Container(
                        child: Image.network(
                          movies[index].img,
                          fit:BoxFit.cover,
                        ),
                      );
                    },
                    childCount: movies.length,
                  ),
                )
              ],
            );
          }
          else{
            return Text('');
          }
        },
      )
    );
  }
}

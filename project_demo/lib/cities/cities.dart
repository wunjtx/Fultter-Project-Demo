import 'package:flutter/material.dart';
import 'package:project_demo/cities/cities_bloc.dart';
import 'package:project_demo/common/bloc_provider.dart';
import 'package:project_demo/models/city.dart';


class Cities extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<CitiesBloc>(
          bloc: CitiesBloc(),
          child: Scaffold(
          appBar: AppBar(
            title: Text('City List'),
          ),
          body:  CitiesContent(),
          )
      );
  }
}


class CitiesContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CitiesBloc bloc = BlocProvider.of<CitiesBloc>(context);

    return Center(
          child:  StreamBuilder<CityList>(
            stream: bloc.cityresults,
            builder: (BuildContext context, AsyncSnapshot<CityList> snapshot){
              if (snapshot.data!=null){
              final cities = snapshot.data.citilist;
              return GridView.builder(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1.0,
                    ),
                  itemCount: cities.length,
                  itemBuilder: ( context, index){
                    return FlatButton(
                      color: Colors.grey,
                      child: Text(
                        '${cities[index].n}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      onPressed: (){
                        bloc.onTap(context, cities[index].id.toString());
                      },
                    );
                  },
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
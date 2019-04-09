import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/common/bloc_provider.dart';
import 'package:project_demo/fetch_data/fetch_data.dart';
import 'package:project_demo/models/city.dart';
import 'package:project_demo/movies/movies_list/movies_page.dart';
import 'package:rxdart/rxdart.dart';

class CitiesBloc extends BlocBase {
  final BehaviorSubject<CityList> _fetchcity = BehaviorSubject();
  Observable<CityList> get cityresults => _fetchcity.stream;  
  
  final FetchCities fc=new FetchCities();

  CitiesBloc() {
    _getCities();
  }

  _getCities() {
    fc.getcityList().then((results) {
      _fetchcity.add(results);
    });
  }

  onTap(BuildContext context,String cityId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Movies(cityId:cityId);
    }));
  }

  dispose() {
    _fetchcity.close();
  }
}

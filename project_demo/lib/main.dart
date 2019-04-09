import 'package:flutter/material.dart';
import 'package:project_demo/cities/cities.dart';
import 'package:project_demo/home/home.dart';
import 'package:project_demo/movies/movies_list/movies_page.dart';
import 'package:project_demo/sc_models/theme.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(
    ScopedModel<ThemeModel>(
    model: ThemeModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
      builder: (BuildContext context, Widget child, ThemeModel model) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: model.theme ? ThemeData.light() : ThemeData.dark(),
          home: Home(),
          initialRoute: '/home',
          routes:{
            '/home':(context)=>Home(),
            '/movies':(context)=>Movies(),
            '/cities':(context)=>Cities(),
          },
        );
      },
    );
  }
}


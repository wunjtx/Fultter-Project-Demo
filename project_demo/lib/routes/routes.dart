import 'package:flutter/material.dart';
import 'package:project_demo/home/home.dart';
import 'package:project_demo/models/movie.dart';
import 'router.dart';

class Routes {
  static String root = '/';

  static configureRoutes() {
    Router.register(root, (BuildContext context, Map urlParams, {Map params}) {
      return Home();
    });
  }
}

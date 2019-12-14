
import 'package:food_ar/pages/home.dart';
import 'package:food_ar/pages/root.dart';
import 'package:flutter/material.dart';

class Routes {

  static Route<dynamic> onGenerate(RouteSettings settings){
    String name = settings.name;
    var args = settings.arguments;

    switch(name){
         case '/':
          return MaterialPageRoute(builder: (_) => RootPage());
        case '/home':
          return MaterialPageRoute(builder: (_) => HomePage());
        default:
           return MaterialPageRoute(builder: (_) => RootPage()); 
    } 
  }

}
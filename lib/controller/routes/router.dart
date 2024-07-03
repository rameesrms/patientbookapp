
import 'package:flutter/material.dart';
import 'package:interview_task/controller/routes/routnames.dart';

import '../../view/ui/login_screen.dart';



class Routers{


  static Route<dynamic> generateRoute
      (

      RouteSettings settings
      ) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());



      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }}








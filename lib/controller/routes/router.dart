
import 'package:flutter/material.dart';
import 'package:interview_task/controller/managers/home_manager.dart';
import 'package:interview_task/controller/routes/routnames.dart';
import 'package:interview_task/view/ui/home_scren.dart';

import '../../view/ui/login_screen.dart';
import '../../view/ui/register_screen.dart';



class Routers{


  static Route<dynamic> generateRoute
      (

      RouteSettings settings
      ) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case RouteNames.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());



      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }}








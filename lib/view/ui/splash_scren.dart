
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import 'home_scren.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward();
    _navigateHome();
  }
  void _navigateHome() async {
    await Future.delayed(Duration(seconds: 5), () async {
    var token =   getIt<SharedPreferences>().getString(StringConstants.token );

    if(token==null){
      Navigator.of(context).pushAndRemoveUntil(NavigateLogin(),(route) => false,);

    }else{
      Navigator.of(context).pushAndRemoveUntil(NavigateHome(),(route) => false,);


    }

    });
  }

  @override
  Widget build(BuildContext context) {
    // bool? startAnim = Provider.of<StateManager>(context).startAnimation;


    return SafeArea(
      child: LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;
          return Scaffold(
            // extendBody: true,
            backgroundColor:Colors.white,
            body:  AnimatedBuilder(
                animation: _controller,
                builder: ( context,  child) {
                  // double size = h10p*1.5;
                  // double size2 = _controller.value* w1p*2+w1p*2;
                  return Container(
                                    decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.cover,opacity:_controller.value,image: AssetImage("assets/images/splash-image.png"))),
                                    width: maxWidth,
                                    height: maxHeight,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: ( context,  child) {
                      double size = h10p*2.5;
                      double size2 = _controller.value* w1p*2+w1p*2;
                      return Opacity(opacity: _controller.value,
                        child: new Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          width: size, height: size, child:Padding(
                          padding:  EdgeInsets.all(size2),
                          child: Image.asset("assets/images/Layer_1-2.png"),
                        ),),
                      );
                    },
                  )

                                    ],),
                                  );}
            )


            );

        }
      ),
    );
  }
}


Route NavigateHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

Route NavigateLogin() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
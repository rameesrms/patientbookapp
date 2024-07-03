
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/managers/auth_manager.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationCntrlr;
// DateTime _selectedDate = DateTime.now();
  @override
  void initState() {


    // getIt<OnlineConsultManager>().getPatientRequestList();

    super.initState();

  }




  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;


          return Consumer<AuthManager>(
            builder: (context,mgr,child) {
              return Scaffold(backgroundColor: Colors.white,



              body:
                     RefreshIndicator(onRefresh: ()async{

                    },
                       child: SizedBox(),
                    )



              );
            }
          );

        }
      ),
    );
  }
}


import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/controller/managers/state_manager.dart';
import 'package:interview_task/model/core/patient_list_model.dart';
import 'package:interview_task/view/ui/register_screen.dart';
import 'package:provider/provider.dart';
import '../../../controller/managers/auth_manager.dart';
import '../../controller/managers/home_manager.dart';
import '../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/widgets.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {


    getIt<HomeManager>().getPatientList();

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

double padWidth = 30.0;


          patientBox(Patient i,int index){
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal:w1p*4,vertical: h1p),
              child: Container(
                decoration: BoxDecoration(color: Colours.boxGrey,borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      verticalSpace(h1p*2),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(width: padWidth,child: Center(child:Text('${++index}.',style: TextStyles.textStyle6,),
                        ),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(i.name??"",style: TextStyles.textStyle6,),
                          SizedBox(width:w10p*7,child: Text(i.patientdetailsSet!.map((e)=>e.treatmentName).toList().join(", "),style: TextStyles.textStyle7,overflow: TextOverflow.ellipsis,)),
                          Row(
                            children: [
                              SizedBox(width:20,child: Image.asset("assets/images/uil_calender.png")),
                              horizontalSpace(w1p),
                              SizedBox(child: Text(i.dateNdTime!=null?getIt<StateManager>().getFormattedDate(i.dateNdTime!):"N/A",style: TextStyles.textStyle8,)),
                              horizontalSpace(w1p*2),
                              SizedBox(width:20,child: Image.asset("assets/images/persons.png")),
                              horizontalSpace(w1p),
                              SizedBox(child: Text(i.user??"N/A",style: TextStyles.textStyle8,)),
                            ],
                          ),
                        ],)
                      ],),
                      Divider(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Padding(
                          padding: EdgeInsets.only(left: padWidth),
                          child: Text("View Booking details",style: TextStyles.textStyle9,),
                        ),
                        SizedBox(height: 15,
                          child: Image.asset(
                            "assets/images/arrow-right.png",
                            ),
                        )                    ],)
                    ],
                  ),
                ),
              ),
            );
          }


          return Consumer<HomeManager>(
            builder: (context,mgr,child) {
              return Scaffold(backgroundColor: Colors.white,extendBody: true,
appBar: SmallWidgets().appBarWidget(title: "", height: h10p, width: maxWidth, fn: (){
  Navigator.pop(context);
},child: Padding(
  padding: const EdgeInsets.all(25.0),
  child: SizedBox(child: Image.asset("assets/images/clarity_bell-line.png")),
)),


              body:
                     RefreshIndicator(onRefresh: ()async{
                       getIt<HomeManager>().getPatientList();

                    },
                       child: mgr.patients!=null?Column(

                         children: [
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: w1p*4),
                             child: Row(children: [
                               Expanded(child: SizedBox(height:h1p*6,child: TextFormField(
                                 decoration: searchTFieldDec(hnt: "Search for treatments",
                                   prefix: SizedBox(child: Image.asset("assets/images/search-icon.png",))),))),
                               horizontalSpace(w1p*2),
                               SmallWidgets().searchBtn("Search", h1p*6)
                             ],),
                           ),

                           Expanded(
                             child: SizedBox(
                               child: Entry(yOffset: 200,
                                 // scale: 20,
                                 delay: const Duration(milliseconds: 1000),
                                 duration: const Duration(milliseconds: 500),
                                 curve: Curves.ease,
                                 child: ListView(
                                   children:mgr.patients!.map((e) {
                                     var index = mgr.patients!.indexOf(e);
                                     return
                                         patientBox(e,index);
                                   }).toList()
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ):Center(child: CircularProgressIndicator(color: Colours.primarygreen,)),
                    ),
                     floatingActionButton: Visibility(visible:
                     MediaQuery.of(context).viewInsets.bottom == 0,
                       child: InkWell(onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));

                       },
                         child: Padding(

                           padding: EdgeInsets.symmetric(horizontal: w1p*4),
                           child: Entry(yOffset: 200,
                                             // scale: 20,
                                             delay: const Duration(milliseconds: 1000),
                                             duration: const Duration(milliseconds: 500),
                                             curve: Curves.ease,

                                             // visible: false,
                                             child:SmallWidgets().buttonWidget("Register Now",h1p)),
                         ),
                       ),
                     ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,




              );
            }
          );

        }
      ),
    );
  }
}

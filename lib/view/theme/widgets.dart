
import 'package:flutter/material.dart';
import 'constants.dart';


class SmallWidgets {


  AppBar appBarWidget(
      {required String title, required double height, required double width, required Function fn, Widget? child }) {
    return AppBar(
        toolbarHeight: height,
        automaticallyImplyLeading: false,backgroundColor: Colors.white,
        elevation: 0,leading:InkWell(
      onTap: () {
        fn();
      },
      child: SizedBox(
          height: 20,
          child: Image.asset(
            "assets/images/back-arrow.png",
            )),
    ), actions: [child ?? SizedBox()],
        );
  }


  buttonWidget(String title,double h1p){
    return Container(

      height: h1p*6,
      // width: w10p*2,

      child:Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,style: TextStyles.textStyle5),
      )),

      decoration: BoxDecoration(color: Colours.primarygreen,



          borderRadius: BorderRadius.circular(8.5)

      ),



    );}
  searchBtn(String title,double height){
    return Container(

      height: height,
      // width: w10p*2,

      child:Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(title,style: TextStyles.textStyle5b),
      )),

      decoration: BoxDecoration(color: Colours.primarygreen,



          borderRadius: BorderRadius.circular(8)

      ),



    );}



  addTreatmentBtn(String title,double height){
    return Container(

      height: height,
      // width: w10p*2,

      child:Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(title,style: TextStyles.textStyle11),
          ],
        ),
      )),

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),

        color: Colours.primarygreen.withOpacity(0.3),
        border: Border.all(
          width: 1,
          color: Color(0xff000000).withOpacity(0.1),
        ),

      ),



    );}




}






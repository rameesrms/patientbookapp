
import 'package:flutter/material.dart';
import 'constants.dart';


class SmallWidgets {


  AppBar appBarWidget(
      {required String title, required double height, required double width, required Function fn, Widget? child }) {
    return AppBar(
        toolbarHeight: height,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(

          height: height, color: Colors.white,
          child: pad(horizontal: width * 0.4, vertical: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        fn();
                      },
                      child: SizedBox(
                          height: 20,
                          child: Image.asset(
                            "assets/images/back-arrow.svg",
                            color: Colors.white,)),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Text(
                      title,
                      style: TextStyles.textStyle2,
                    )
                  ],
                ),
                child ?? SizedBox()
              ],
            ),
          ),
        ));
  }


}


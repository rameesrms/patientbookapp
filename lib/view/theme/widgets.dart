
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../controller/managers/register_manager.dart';
import '../../controller/managers/state_manager.dart';
import '../../model/core/basic_response_model.dart';
import '../../model/core/treatments_model.dart';
import '../../model/helper/service_locator.dart';
import 'constants.dart';


class SmallWidgets {


  AppBar appBarWidget(
      {required String title, required double height, required double width, required Function fn, Widget? child }) {
    return AppBar(
        toolbarHeight: height,
        automaticallyImplyLeading: false,backgroundColor: Colors.transparent,
        elevation: 0,leading:InkWell(
      onTap: () {
        fn();
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          "assets/images/back-arrow.png",
          ),
      ),
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


class  CalenderWidget extends StatefulWidget {
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}
class _CalenderWidgetState extends State<CalenderWidget> {
  // DateTime? pickedDateRange;

  // List<Param> doses;
  @override
  Widget build(BuildContext context) {


    return AlertDialog(backgroundColor: Colors.white,
      title: Text("Select Date", style: TextStyles.textStyle3),
      content: Column(mainAxisSize: MainAxisSize.min,
        children: [
          SfDateRangePicker(backgroundColor: Colours.boxGrey,
            // controller: _controller,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.single,toggleDaySelection: true,

            onSelectionChanged: (dd){
              Navigator.pop(context,dd.value);




            },
            monthViewSettings: DateRangePickerMonthViewSettings(enableSwipeSelection: false,),
          ),
        ],
      ),
      titlePadding: EdgeInsets.symmetric(vertical:18, horizontal: 8),
      actionsPadding: EdgeInsets.only(bottom: 18, right: 10),
      contentPadding: EdgeInsets.only(bottom: 10, right: 8, left: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11))),

    );
  }
}







class  AddPersonTextField extends StatelessWidget {
  // double w1p;
  // double h1p;
  String hnt;
  TextEditingController cntrolr;
  bool? isNumber;
  bool? readOnly;
  String? type;
  Widget? suffix;
  AddPersonTextField(
      {
        // required this.h1p,
        this.suffix,
        required this.hnt,
        required this.cntrolr,
        this.isNumber,
        this.type,
        this.readOnly,
      }

      );

  @override
  Widget build(BuildContext context) {


    return TextFormField(readOnly:readOnly==true,showCursor: false,controller:cntrolr,keyboardType: isNumber==true?TextInputType.number:null
      ,decoration: inputDec3(hnt:  hnt,suffix: suffix),style: TextStyles.textStyle4,
      validator: (v) => v!.trim().isEmpty?null:getIt<StateManager>().validateFieldValues(v,type??"String"),
    );

  }
}





// class  CalenderTextFeild extends StatelessWidget {
//   // double w1p;
//   // double h1p;
//   String hnt;
//   TextEditingController cntrolr;
//   bool? readOnly;
//   String? type;
//   CalenderTextFeild(
//       {
//         // required this.h1p,
//         // required this.w1p,
//         required this.hnt,
//         required this.cntrolr,
//          this.type,
//         this.readOnly,
//       }
//
//       );
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return TextFormField(
//       readOnly: readOnly==true,
//       showCursor: false,controller:cntrolr,
//       decoration: inputDec3(hnt:  hnt,suffix: ),style: TextStyles.textStyle4,
//       // validator: (v) => v!.trim().isEmpty?null:getIt<StateManager>().validateFieldValues(v,type??"String"),
//     );
//
//   }
// }



class  DropDownList extends StatelessWidget {
  // double w1p;
  // double h1p;
  String hnt;
  List<BasicItem> list;
  BasicItem? selectedItem;
  Function(BasicItem val) fn;

  DropDownList(
      {
        // required this.h1p,
        // required this.w1p,
        required this.list,
        required this.hnt,
        required this.selectedItem,
        required this.fn,
      }

      );

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      // height: h1p * 6,
      child: DropdownSearch<BasicItem>(

        selectedItem: selectedItem,itemAsString: (BasicItem u) => u.name??"",
        popupProps: PopupProps.menu(showSelectedItems: false,
          showSearchBox: false,menuProps: MenuProps(backgroundColor: Colors.white)
          // showSelectedItems: true,
          // disabledItemFn: (String s) => s.startsWith('I'),
        ),
        items: list,dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: inputDec3(hnt: hnt),
      ),
        onChanged: (val){

          fn(val!);
          // getIt<OnlineConsultManager>().setBloodGroup(val);

        },
        // selectedItem: merchand,
      ),
    );

  }
}


class  AddTreatmentBox extends StatefulWidget {
  // List<Param> doses;
  // String dTime;
  // int? selectedUnitId;
  List<Treatments> treatments;


  AddTreatmentBox(
      {required this.treatments,}
      );

  @override
  State<AddTreatmentBox> createState() => _AddTreatmentBoxState();
}

class _AddTreatmentBoxState extends State<AddTreatmentBox> {

  int maleCount = 0;
  int femaleCount = 0;
  BasicItem? treatment ;
  @override
  Widget build(BuildContext context) {

    titleBox(String count){
      return Container(
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)
              ,border: Border.all(color: Colors.black26)),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            child: Text(count),
          )
      );

    }  titleBox2(String count){
      return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)
              ,border: Border.all(color: Colors.black26)),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            child: Text(count),
          )
      );

    }



    return AlertDialog(backgroundColor: Colors.white,
      title: Text("Type Dosage", style: TextStyles.textStyle12),
      content: Column(mainAxisSize: MainAxisSize.min,
        children: [
          DropDownList(fn: (val){
            setState(() {
              treatment = val;
            });

          },selectedItem: null,hnt: "",list:

          widget.treatments.map((e)=>BasicItem(id: e.id,name: e.name)).toList()),
          Text("Add Patient",style:TextStyles.textStyle12),
          SizedBox(height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleBox("Male"),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          if(maleCount>0){
                            setState(() {
                              maleCount--;
                            });

                          }

                        },
                        child: Image.asset("assets/images/minus.png")),
                    titleBox2(maleCount.toString()),

                    InkWell(
                        onTap: (){
                          // setState(() =>);
                          setState(() {
                            maleCount++;
                          });
                          print(maleCount);

                        },child: Image.asset("assets/images/plus.png"))
                  ],
                ),


              ],),
          ),
          SizedBox(height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleBox("Female"),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          if(femaleCount>0){
                            setState(() {
                              femaleCount--;
                            });

                          }

                        },
                        child: Image.asset("assets/images/minus.png")),
                    titleBox2(femaleCount.toString()),

                    InkWell(
                        onTap: (){
                          // setState(() =>);
                          setState(() {
                            femaleCount++;
                          });

                        },child: Image.asset("assets/images/plus.png"))
                  ],
                ),


              ],),
          ),
          verticalSpace(8),
          InkWell(onTap: (){
            if(treatment!=null){
              Navigator.pop(context,AddedTreatmentItem(name: treatment!.name,id: treatment!.id,female: femaleCount,male: maleCount));
            }else{
              Navigator.pop(context);
            }
          },child:     SmallWidgets().buttonWidget("Save", 8)
            ,),verticalSpace(8)
        ],
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11))),

    );
  }
}



class  RadioBtnItem extends StatelessWidget {
  // double w1p;
  // double h1p;
  String groupValue;
  String name;
  bool? selected;
  // Function(BasicItem val) fn;

  RadioBtnItem(
      {
        // required this.h1p,
        // required this.w1p,
        required this.name,
        required this.selected,
        required this.groupValue,
      }

      );

  @override
  Widget build(BuildContext context) {


    return Consumer<RegisterManager>(
        builder: (context,mgr,child) {
          return SizedBox(
            // height: h1p * 6,
            child: RadioMenuButton(value: name, groupValue: mgr.userModel.payment, onChanged: (vsl){

              getIt<RegisterManager>().changePayMethode(vsl??"");

            }, child: Text(name,style: TextStyles.textStyle3,)),
          );
        }
    );

  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_task/controller/managers/state_manager.dart';
import 'package:interview_task/model/core/patient_list_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../controller/managers/home_manager.dart';
import '../../controller/managers/register_manager.dart';
import '../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/widgets.dart';





class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RegisterScreen>  {
  @override
  void initState() {


    getIt<RegisterManager>().getBranchList();

    super.initState();

  }




  @override
  Widget build(BuildContext context) {

    var nameC = TextEditingController();
    var wAppNumC= TextEditingController();
    var addresC = TextEditingController();
    var totalC = TextEditingController();
    var discountC = TextEditingController();
    var advaneC = TextEditingController();
    var balanceC = TextEditingController();


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

          countBox(count){
            return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black26)),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(count),
            )
            );

          }
          treatmntBox(String name,int index){
            return Padding(
              padding:  EdgeInsets.only(bottom: h1p),
              child: Container(
                decoration: BoxDecoration(color: Colours.boxGrey,borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      verticalSpace(h1p*1),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: padWidth,child: Center(child:Text('${++index}.',style: TextStyles.textStyle6,),
                          ),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("sdsdfafddsfsdfsdfsdfs",style: TextStyles.textStyle6,),
                              Row(
                                children: [
                                  Text("Male",style: TextStyles.textStyle3,),
                                  horizontalSpace(w1p),

                                  countBox("2"),

                                  horizontalSpace(w1p*2),
                                  Text("Male",style: TextStyles.textStyle3,),
                                  horizontalSpace(w1p),

                                  countBox("2"),
                                ],
                              ),
                            ],),
                          Spacer(),
                          Column(children: [
                            SizedBox(width:20,child: Image.asset("assets/images/persons.png")),
                            SizedBox(width:20,child: Image.asset("assets/images/persons.png")),

                          ],)
                        ],),

                    ],
                  ),
                ),
              ),
            );
          }



titleText(title){
  return  Padding(
    padding: const EdgeInsets.only(bottom: 8,top: 18),
    child: Text(title,style: TextStyles.textStyle3,),
  );
}


          return Consumer<RegisterManager>(
            builder: (context,mgr,child) {
              return Scaffold(backgroundColor: Colors.white,
appBar: SmallWidgets().appBarWidget(title: "", height: h10p, width: maxWidth, fn: (){
  Navigator.pop(context);
},child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: SizedBox(child: Image.asset("assets/images/clarity_bell-line.png")),
)),


              body:
                     GestureDetector(onTap: (){
                       FocusScope.of(context).unfocus();

                     },
                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                         children: [
                          Padding(
                            padding:  EdgeInsets.only(left:padWidth),
                            child: Text("Register",style: TextStyles.textStyle2,),
                          ),

                           Expanded(
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 18),
                               child: SizedBox(
                                 child: ListView(
                               children: [



                                 titleText("Name"),
                                 SizedBox(
                                     height: 50,
                                     child: AddPersonTextField(cntrolr: nameC,hnt: "",)),

                                 titleText("Whatsapp Number"),
                                 AddPersonTextField(cntrolr: wAppNumC,hnt: "",type: "int",isNumber: true,),

                                 titleText("Address"),
                                 AddPersonTextField(cntrolr: addresC,hnt: "",),

                                 titleText("Location"),
                                 DropDownList(list: ["sdssd","dfdfd"],selectedItem: "",hnt: "sd",fn: (val){},),
                                  titleText("Treatments"),
                                 treatmntBox("sdadfadfa",3),
                                 InkWell(
                                   onTap: ()async{
                                     var result = await showDialog(
                                       context: context,
                                       builder: (BuildContext context) {
                                         return AddTreatmentBox();
                                       },
                                     );

                                     if(result != null){
                                       // getIt<OnlineConsultManager>().setUpDoses(Param(id: null,title: result.toString()),doseTime);

                                     }
                                   },child:SmallWidgets().addTreatmentBtn("Add Treatment",50),

                                 ),
                                 titleText("Branch"),

                                 DropDownList(list: ["sdssd","dfdfd"],selectedItem: "",hnt: "sd",fn: (val){},),
                                 titleText("Total Amount"),
                                 AddPersonTextField(cntrolr: totalC,hnt: "",type: "double",isNumber: true,),

                                 titleText("Discount Amount"),
                                 AddPersonTextField(cntrolr: discountC,hnt: "",type: "double",isNumber: true,),

                                 titleText("Advance Amount"),
                                 AddPersonTextField(cntrolr: advaneC,hnt: "",type: "double",isNumber: true,),

                                 titleText("Balance Amount"),
                                 AddPersonTextField(cntrolr: balanceC,hnt: "",type: "double",isNumber: true,),


                                 verticalSpace(h1p*2),
                                 SmallWidgets().buttonWidget("Save",h1p),
                               ]


                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),





              );
            }
          );

        }
      ),
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
  AddPersonTextField(
      {
        // required this.h1p,
        // required this.w1p,
        required this.hnt,
        required this.cntrolr,
        this.isNumber,
         this.type,
        this.readOnly,
      }

      );

  @override
  Widget build(BuildContext context) {


    return TextFormField(showCursor: false,controller:cntrolr,keyboardType: isNumber==true?TextInputType.number:null
      ,decoration: inputDec3(hnt:  hnt),style: TextStyles.textStyle4,
      validator: (v) => v!.trim().isEmpty?null:getIt<StateManager>().validateFieldValues(v,type??"String"),
    );

  }
}



class  DropDownList extends StatelessWidget {
  // double w1p;
  // double h1p;
  String hnt;
  List<String> list;
 String selectedItem;
 Function(String val) fn;

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
      child: DropdownSearch<String>(selectedItem: selectedItem,
        popupProps: PopupProps.menu(showSelectedItems: false ,
          showSearchBox: false,
          // showSelectedItems: true,
          // disabledItemFn: (String s) => s.startsWith('I'),
        ),
        items: list,dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: inputDec3(hnt: ""),
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


class  AddTreatmentBox extends StatelessWidget {
  // List<Param> doses;
  // String dTime;
  // int? selectedUnitId;


  AddTreatmentBox(
      // {required this.dTime,}
      );


  @override
  Widget build(BuildContext context) {
    TextEditingController tCntrl = TextEditingController();

    titleBox(count){
      return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)
          ,border: Border.all(color: Colors.black26)),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(count),
          )
      );

    }


    return AlertDialog(backgroundColor: Colors.white,
      title: Text("Type Dosage", style: TextStyles.textStyle6),
content: Column(
  children: [
    DropDownList(fn: (val){},selectedItem: "",hnt: "",list: ["sdsds","dfadf"],),
    Text("Add Patient",style:TextStyles.textStyle6)

  ],
),
      actionsPadding: EdgeInsets.only(bottom: 18, right: 10),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11))),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),TextButton(
          onPressed: () {
            if(double.tryParse(tCntrl.text)!=null){
              Navigator.pop(context,tCntrl.text);

            }else{
              Fluttertoast.showToast(msg: "Invalid Input");
            }


          },
          child: Text('Done'),
        ),

      ],
    );
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_task/controller/managers/state_manager.dart';
import 'package:interview_task/model/core/basic_response_model.dart';
import 'package:interview_task/model/core/patient_list_model.dart';
import 'package:interview_task/model/core/update_user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../controller/managers/register_manager.dart';
import '../../model/core/treatments_model.dart';
import '../../model/helper/service_locator.dart';
import '../theme/constants.dart';
import '../theme/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    getIt<RegisterManager>().getBranchList();
    getIt<RegisterManager>().getTreatments();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nameC = TextEditingController();
    var wAppNumC = TextEditingController();
    var addresC = TextEditingController();
    var totalC = TextEditingController();
    var discountC = TextEditingController();
    var advaneC = TextEditingController();
    var balanceC = TextEditingController();
    var dateC = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        double maxHeight = constraints.maxHeight;
        double maxWidth = constraints.maxWidth;
        double h1p = maxHeight * 0.01;
        double h10p = maxHeight * 0.1;
        double w10p = maxWidth * 0.1;
        double w1p = maxWidth * 0.01;
        double padWidth = 30.0;

        countBox(count) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.black26)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(count.toString()),
              ));
        }

        treatmntBox({
          required String name,
          required int maleCount,
          required int femaleCount,
          required int index,
        }) {
          return Padding(
            padding: EdgeInsets.only(bottom: h1p),
            child: Container(
              decoration: BoxDecoration(
                  color: Colours.boxGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        verticalSpace(h1p * 1),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: padWidth,
                              child: Center(
                                child: Text(
                                  '${++index}.',
                                  style: TextStyles.textStyle6,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyles.textStyle6,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Male",
                                      style: TextStyles.textStyle3,
                                    ),
                                    horizontalSpace(w1p),
                                    countBox(maleCount),
                                    horizontalSpace(w1p * 2),
                                    Text(
                                      "Female",
                                      style: TextStyles.textStyle3,
                                    ),
                                    horizontalSpace(w1p),
                                    countBox(femaleCount),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: -1,
                      top: -1,
                      child: SizedBox(
                          width: 30,
                          child:
                              SvgPicture.asset("assets/images/deleteitem.svg")))
                ],
              ),
            ),
          );
        }

        titleText(title) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 18),
            child: Text(
              title,
              style: TextStyles.textStyle3,
            ),
          );
        }

        return Consumer<RegisterManager>(builder: (context, mgr, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: SmallWidgets().appBarWidget(
                title: "",
                height: h10p,
                width: maxWidth,
                fn: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                      child:
                          Image.asset("assets/images/clarity_bell-line.png")),
                )),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: padWidth),
                    child: Text(
                      "Register",
                      style: TextStyles.textStyle2,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: SizedBox(
                        child: Form(
                          key: _formKey,
                          child: ListView(children: [
                            titleText("Name"),
                            SizedBox(
                                height: 50,
                                child: AddPersonTextField(
                                  cntrolr: nameC,
                                  hnt: "Enter your full name",
                                )),
                            titleText("Whatsapp Number"),
                            AddPersonTextField(
                              cntrolr: wAppNumC,
                              hnt: "Enter your Whatsapp number",
                              type: "int",
                              isNumber: true,
                            ),
                            titleText("Address"),
                            AddPersonTextField(
                              cntrolr: addresC,
                              hnt: "Enter your full address",
                            ),
                            titleText("Location"),
                            DropDownList(
                              list: mgr.locations,
                              selectedItem: mgr.userModel.location,
                              hnt: "Choose your location",
                              fn: (val) {
                                getIt<RegisterManager>().setLocation(val);

                              },
                            ),
                            titleText("Treatments"),
                            Column(
                                children: mgr.userModel.addedTreatmentItems!.map((e) {
                              int indx = mgr.userModel.addedTreatmentItems!.indexOf(e);
                              return treatmntBox(
                                  name: e.name ?? "",
                                  index: indx,
                                  femaleCount: e.female ?? 0,
                                  maleCount: e.male ?? 0);
                            }).toList()),
                            InkWell(
                              onTap: () async {
                                AddedTreatmentItem? result = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddTreatmentBox(
                                        treatments: mgr.treatments);
                                  },
                                );

                                if (result != null) {
                                  getIt<RegisterManager>().addTreatment(result);
                                }
                              },
                              child: SmallWidgets()
                                  .addTreatmentBtn("Add Treatment", 50),
                            ),
                            titleText("Branch"),
                            DropDownList(
                              list: mgr.branches
                                  .map((e) => BasicItem(id: e.id, name: e.name))
                                  .toList(),
                              selectedItem: mgr.userModel.branch,
                              hnt: "Select the branch",
                              fn: (val) {

                                getIt<RegisterManager>().setBranch(val);
                              },
                            ),
                            titleText("Total Amount"),
                            AddPersonTextField(
                              cntrolr: totalC,
                              hnt: "",
                              type: "double",
                              isNumber: true,
                            ),
                            titleText("Discount Amount"),
                            AddPersonTextField(
                              cntrolr: discountC,
                              hnt: "",
                              type: "double",
                              isNumber: true,
                            ),
                            titleText("Discount Amount"),
                            Row(
                              children: ["Cash", "Card", "UPI"]
                                  .map((e) => RadioBtnItem(
                                      selected: mgr.userModel.payment == e
                                          ? true
                                          : false,
                                      name: e,
                                      groupValue: mgr.userModel.payment ?? ""))
                                  .toList(),
                            ),
                            titleText("Advance Amount"),
                            AddPersonTextField(
                              cntrolr: advaneC,
                              hnt: "",
                              type: "double",
                              isNumber: true,
                            ),
                            titleText("Balance Amount"),
                            AddPersonTextField(
                              cntrolr: balanceC,
                              hnt: "",
                              type: "double",
                              isNumber: true,
                            ),
                            titleText("Treatment Date"),
                            AddPersonTextField(
                              cntrolr: dateC,
                              hnt: mgr.userModel.dateNdTime??"",
                              readOnly: true,
                              suffix: GestureDetector(
                                onTap: () async {
                                  DateTime? result = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CalenderWidget();
                                    },
                                  );

                                  if (result != null) {
                                    // dateC.text = result.toString();

                                    String dt = getIt<StateManager>().getFormattedDate(result.toString());
                                    getIt<RegisterManager>().setDate(dt);
                                    // getIt<SettlementsManager>().doctorWeeklySettles(startDate: result.startDate,endDate: result.endDate,);
                                  }
                                },
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colours.primarygreen,
                                ),
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    titleText("Treatment Time"),
                                    verticalSpace(h1p*0.1),
                                    DropDownList(
                                      list: [for(var i=0; i<13; i+=1) i.toString()]
                                          .map((e) => BasicItem(id: null, name: e))
                                          .toList(),
                                      selectedItem: mgr.userModel.hour,
                                      hnt: "Hour",
                                      fn: (val) {

                                        getIt<RegisterManager>().setHour(val);
                                      },
                                    ),


                                  ],
                                ),
                              ),
                              horizontalSpace(w1p),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleText(""),
                                    verticalSpace(h1p*0.1),
                                    DropDownList(
                                      list: [for(var i=0; i<61; i+=1) i.toString()]
                                          .map((e) => BasicItem(id: null, name: e))
                                          .toList(),
                                      selectedItem: mgr.userModel.minute,
                                      hnt: "Minute",
                                      fn: (val) {
                                        getIt<RegisterManager>().setMinute(val);

                                      },
                                    ),
                                    // SizedBox(
                                    //     height: h1p * 6,
                                    //     child: MyTextFormField2(type: "char",onTap: (){
                                    //       showDialog(
                                    //         context: context,
                                    //         builder: (BuildContext context) {
                                    //           return DrugUnitList(drugUnits:mgr.drugParams!.drugUnit??[],selectedUnitId: mgr.selectedDrugUnit!=null?mgr.selectedDrugUnit!.id:null);
                                    //         },
                                    //       );
                                    //     },
                                    //       hnt: mgr.selectedDrugUnit!=null?mgr.selectedDrugUnit!.title??"":"",
                                    //       isNumber: false,readOnly: true,
                                    //     )),
                                  ],
                                ),
                              ),
                            ],),


                            verticalSpace(h1p * 2),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {

UpdateUserModel tempModel = UpdateUserModel(
  name: nameC.text,
  address: addresC.text,
  phone: wAppNumC.text,
  totalAmount: double.tryParse(totalC.text),
  discountAmount: double.tryParse(discountC.text),
  advanceAmount: double.tryParse(advaneC.text),
  balanceAmount: double.tryParse(balanceC.text),
  dateNdTime: '${mgr.userModel.dateNdTime}-${mgr.userModel.hour}${mgr.userModel.minute}',
  branch: mgr.userModel.branch,
  location: mgr.userModel.location,
  payment: mgr.userModel.payment,
  id: "",excecutive: "",
  addedTreatmentItems: mgr.userModel.addedTreatmentItems,

);
getIt<RegisterManager>().register(tempModel);




                                }
                              },
                              child: SmallWidgets().buttonWidget("Save", h1p),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}

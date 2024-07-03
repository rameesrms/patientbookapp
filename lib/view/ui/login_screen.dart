
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../controller/managers/auth_manager.dart';
import '../../../model/helper/service_locator.dart';
import '../../controller/managers/state_manager.dart';
import '../theme/constants.dart';
import 'home_scren.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{

  @override
  void initState() {

    super.initState();


  }






  @override
  Widget build(BuildContext context) {

    var userNameCntr = TextEditingController(text:"test_user" );
    var pwdCntr = TextEditingController(text:"12345678" );

    return LayoutBuilder(
        builder: (context,constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          double h1p = maxHeight * 0.01;
          double h10p = maxHeight * 0.1;
          double w10p = maxWidth * 0.1;
          double w1p = maxWidth * 0.01;


          loginFn()async{
            String uname = userNameCntr.text.trim();
            String pass = pwdCntr.text.trim();

            // String uname = "irinashraf";
            // String pass = "123456";

            var result = await  getIt<AuthManager>().userLogin(username: uname, pwd: pass);

            if(result.status==true){
              getIt<AuthManager>().saveToken(result.message!);

              Fluttertoast.showToast(gravity: ToastGravity.CENTER,msg:result.message??"" ,backgroundColor: Colors.green,textColor: Colors.white);
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

          }else{
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

            // userNameCntr.clear();
            pwdCntr.clear();

            Fluttertoast.showToast(gravity: ToastGravity.CENTER,msg:result.message??"" ,backgroundColor: Colors.white,);



            }}
          return ProgressHUD(
            child: Builder(
                builder: (context) {
                  final progress = ProgressHUD.of(context);

                  return SafeArea(
                    child: GestureDetector(
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                      child: Scaffold(resizeToAvoidBottomInset: true,
                        body: ListView(

                          children: [

                            Container(
                              decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.cover,
                                  image: AssetImage("assets/images/login-img.png"))),
                              width: maxWidth,
                              height: h10p*2.5,
                              child: Center(
                                child: SizedBox(

                                          width: h10p, height: h10p, child:Padding(
                                          padding:  EdgeInsets.all(8),
                                          child: Image.asset("assets/images/Layer_1-2.png"),
                                        ),),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                verticalSpace(h10p*0.8),
                                Text("Login or register to book your appointments",style: TextStyles.textStyle2,),
                                verticalSpace(h10p*0.8),
                                Text("Email",style: TextStyles.textStyle3,),

                                TextField(textInputAction: TextInputAction.next,
                                  decoration: inputDec3(hnt: "Enter your email"),
                                  controller: userNameCntr,



                                ),

                                verticalSpace( h1p*2),
                                Text("Password",style: TextStyles.textStyle3,),



                                Consumer<StateManager>(
                                    builder: (context,mngr,child) {
                                      return TextField(onSubmitted: (val)async{

                                        progress?.show();

                                        await loginFn();

                                        progress?.dismiss();





                                      },obscureText: !mngr.showPass,

                                        decoration: inputDec3(hnt: "Enter password",
                                            suffix: GestureDetector(
                                                onTap: (){
                                                  getIt<StateManager>().showPwd(!mngr.showPass);
                                                },
                                                child: SizedBox(child:mngr.showPass?Icon(Icons.visibility_outlined,color: Color(0xff999999),):Icon(Icons.visibility_off_outlined,color: Color(0xff999999),)))),

                                        controller: pwdCntr,

                                      );
                                    }
                                ),



                                // Expanded(child: SizedBox()),

                                verticalSpace( h10p*0.8,),

                                InkWell(

                                  onTap: ()async{

                                    progress?.show();

                                    await loginFn();

                                    progress?.dismiss();



                                  },

                                  child: Container(

                                    // height: h1p*3,
                                    // width: w10p*2,

                                    child:Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Login",style: TextStyles.textStyle5),
                                    )),

                                    decoration: BoxDecoration(color: Colours.primarygreen,



                                        borderRadius: BorderRadius.circular(8.5)

                                    ),



                                  ),

                                )


                              ],),
                            ),






                          ],),
                      ),
                    ),
                  );
                }
            ),
          );
        }
    );
  }
}

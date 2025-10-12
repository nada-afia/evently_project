import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_language_toggle_switch.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:flutter/material.dart';
import '../../utilts/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: width*0.04 ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AppImages.logo),
                  SizedBox(height: height*0.02,),
                  Form(
                    key:_formKey ,
                    child:Column(children: [
                      CustomTextField(hintText:AppLocalizations.of(context)!.email
                        ,prefixIcon:Image.asset(AppImages.email),
                        controller:emailController ,
                        validator:(text) {
                          if(text==null || text.trim().isEmpty){
                            return'pls enter email';
                          }
                          final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if(!emailValid){
                            return 'pls enter valid email';
                          }
                          return null;
                        } ,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: height*0.02,),
                      CustomTextField(hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: Image.asset(AppImages.password ),
                        suffixIcon: Image.asset(AppImages.hide),
                        validator: (text) {
                          if(text==null || text.trim().isEmpty){
                            return'pls enter password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                      ) ],),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.forgetScreen);
                    },
                      child: Text(AppLocalizations.of(context)!.forgetPasswordQ,style:AppStyles.blueBold16,
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(textButton: AppLocalizations.of(context)!.login,
                      onPressed: login ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.dontHaveAccount,style:Theme.of(context).textTheme.titleLarge,),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.createScreen);
                          }
                          , child: Text(AppLocalizations.of(context)!.createAccount,style: AppStyles.blueBold16,))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.blue,
                          thickness: 1,
                          indent: width*0.02,
                          endIndent: width*0.02,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(AppLocalizations.of(context)!.or,style: AppStyles.blueMed16,),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.blue,
                          thickness: 1,
                          indent: width*0.02,
                          endIndent: width*0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(
                    bgColor: AppColors.transparent,
                    onPressed: () {  },
                    hasIcon: true,
                    iconWidget:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.google),
                        SizedBox(width: width*0.02,),
                        Text(AppLocalizations.of(context)!.loginWithGoogle,style:AppStyles.blueMed20 ,),
                      ],
                    ),),
                  SizedBox(height: height*0.02,),
                  CustomToggleSwitch()
                ],
              ),
            ),
          ),
        ));
  }

  void login() {
    if(_formKey.currentState?.validate()==true){
     Navigator.of(context).pushNamed(AppRoutes.mainScreen,arguments: emailController.text);
    }
  }
}
import 'package:evently_app/auth/login/login/login_navigator.dart';
import 'package:evently_app/auth/login/login/login_view_model.dart';
import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_language_toggle_switch.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../../utilts/alert-dialog.dart';
import '../../../utilts/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  final TextEditingController emailController = TextEditingController(text: 'nadamoafia@gmail.com');
  final TextEditingController passController = TextEditingController(text: 'Nada@1234');
  LoginViewModel loginModelView =LoginViewModel();
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    loginModelView.navigator= this;
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => loginModelView,
      child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding:   EdgeInsets.symmetric(horizontal: width*0.04 ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AppImages.logo),
                    SizedBox(height: height*0.02,),
                    Form(
                      key:loginModelView.formKey ,
                      child:Column(children: [
                        CustomTextField(hintText:AppLocalizations.of(context)!.email
                          ,prefixIcon:Image.asset(AppImages.email),
                          controller:loginModelView.emailController ,
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
                          controller: loginModelView.passController,
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
                        onPressed: loginModelView.login ),
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
                      onPressed:signInWithGoogle,
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
          )),
    );
  }

  Future<void> signInWithGoogle() async {
    DialogUtils.showLoading(context: context, message: 'Signing in...');

    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          title: 'Operation Cancelled',
          message: 'Google sign-in was cancelled',
          posActionName: 'OK',
        );
        return;
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      if (googleAuth?.idToken == null || googleAuth?.accessToken == null) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          title: ' Error',
          message: 'Failed to retrieve authentication details',
          posActionName: 'OK',
        );
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      DialogUtils.hideLoading(context: context);
       DialogUtils.showMessage(
        context: context,
        message: 'Login successfully',
        title: 'Success',
        posActionName: 'OK',
         posAction: (){
           Navigator.of(context).pushReplacementNamed(
             AppRoutes.mainScreen,
             arguments: FirebaseAuth.instance.currentUser?.email,
           );
         }
      );

    } catch (e) {
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(
        context: context,
        title: 'Unexpected Error',
        message: 'An error occurred during Google sign-in',
        posActionName: 'OK',
      );
    }
  }

  @override
  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogUtils.hideLoading(context: context);
  }

  @override
  void showMyLoading({required String message}) {
    // TODO: implement showMyLoading
    DialogUtils.showLoading(context: context, message: message);
  }

  @override
  void showMyMessage({required String message}) {
    // TODO: implement showMyMessage
    DialogUtils.showMessage(context: context, message: message,posActionName: "ok");
  }


}
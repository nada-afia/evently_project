import 'package:evently_app/auth/login/register/register_navigator.dart';
import 'package:evently_app/auth/login/register/register_view_model.dart';
import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_language_toggle_switch.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilts/alert-dialog.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> implements RegisterNavigator {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: 'nadamoafia@gmail.com');
  final TextEditingController passController = TextEditingController(text: 'Nada@1234');
  RegisterViewModel viewModel= RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.navigator=this;
    var themeProvider= Provider.of<AppThemProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.of(context).pop();},
              icon: Icon(Icons.arrow_back,color: Colors.blue,)),
          title: Center(child: Text(AppLocalizations.of(context)!.register,style: AppStyles.blueMed20,),),
        ),
        body: Padding(padding:EdgeInsets.symmetric(horizontal: width*0.04),
          child: Form(
            key: _formKey,
            child: Column(children: [
               Image.asset(AppImages.logo),
              SizedBox(height: height*0.02,),
              CustomTextField(prefixIcon: Image.asset(AppImages.name),
                hintText:AppLocalizations.of(context)!.name,),
              SizedBox(height: height*0.02,),
              CustomTextField(prefixIcon: Image.asset(AppImages.email),
                controller: emailController,
                hintText:AppLocalizations.of(context)!.email, validator:(text) {
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
                } ,),
              SizedBox(height: height*0.02,),
              CustomTextField(prefixIcon: Image.asset(AppImages.password),
                controller: passController,
                hintText:AppLocalizations.of(context)!.password, validator: (text) {
                    if(text==null || text.trim().isEmpty){
                      return'pls enter password';
                    }
                    return null;
                  },obscureText: true),
              SizedBox(height: height*0.02,),
              CustomTextField(prefixIcon: Image.asset(AppImages.password),
                controller: passController,
                hintText:AppLocalizations.of(context)!.rePassword, validator: (text) {
                  if(text==null || text.trim().isEmpty){
                    return'pls enter password';
                  }
                  return null;
                },obscureText: true,),
              SizedBox(height: height*0.02,),
              CustomElevatedButton(textButton: AppLocalizations.of(context)!.createAccount,
                onPressed: register ),
              SizedBox(height: height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.alreadyHaveAccount,style:!themeProvider.isDark()? AppStyles.blackMed16:AppStyles.beigeMed16,),
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text(AppLocalizations.of(context)!.login,style: AppStyles.blueBold16,))
                ],
              ),
              SizedBox(height: height*0.02,),
              CustomToggleSwitch()
            ],),
          ),),
      ),
    );
  }

  Future<void> register() async {
    if (_formKey.currentState?.validate() == true) {

       viewModel.register(emailController.text, passController.text);
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
    DialogUtils.showMessage(context: context, message: message);
  }
}

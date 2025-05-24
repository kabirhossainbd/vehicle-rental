import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/routes.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_button.dart';
import 'package:vehicle_rental_app/ui/component/custom_text_field.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/auth/view/screen/registation_screen.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _userNameFocus = FocusNode();

  final TextEditingController _passWordController = TextEditingController();
  final FocusNode _passWordFocus = FocusNode();

  int nameMaxLength = 11;
  String text = "";

  bool _isEmailError = false;
  bool _isPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (auth)=> Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Align(child: Image.asset(AllImages.logo, height: 140, width: 140)),

                    const SizedBox(height: Dimensions.paddingSizeDefault),

                    CustomTextField(
                      controller: _userNameController,
                      focusNode: _userNameFocus,
                      nextFocus: _passWordFocus,
                      hintText: 'Email',
                      onChanged: (val){
                        setState(() {
                          _isEmailError = false;
                        });
                      },
                      fillColor: Theme.of(context).colorScheme.whiteColor,
                      backgroundColor: Theme.of(context).colorScheme.whiteColor,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    /// for error msg
                    if(_isEmailError)...[
                      const SizedBox(height: 6),
                      Text('Please enter email',style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],

                    const SizedBox(height: Dimensions.paddingSizeDefault),

                    CustomTextField(
                      controller: _passWordController,
                      focusNode: _passWordFocus,
                      hintText: 'Password',
                      fillColor: Theme.of(context).colorScheme.whiteColor,
                      backgroundColor: Theme.of(context).colorScheme.whiteColor,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      onChanged: (val){
                        setState(() {
                          _isPasswordError = false;
                        });
                      },
                      isPassword: true,
                      isShowSuffixIcon: true,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    /// for error msg
                    if(_isPasswordError)...[
                      const SizedBox(height: 6),
                      Text('Please enter password',style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],

                    const SizedBox(height: Dimensions.paddingSizeDefault),


                    CustomButton(buttonText: 'LogIn', onTap: (){
                      final email = _userNameController.text;
                      final password = _passWordController.text;
                     if (email.isEmpty) {
                        setState(() {
                          _isEmailError = true;
                        });
                      }else if(password.isEmpty){
                        setState(() {
                          _isPasswordError = true;
                        });
                      }else{
                       Get.offAllNamed(RouterHelper.getMainRoute());
                      }
                    }),

                    /*const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    GestureDetector(
                      onTap: ()=> auth.signInWithGoogle(),
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Theme.of(context).primaryColor)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AllImages.logo, width: 24, height: 24,),
                            const SizedBox(width: 6),
                            Text('Login with Google', style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge),),
                          ],
                        ),
                      ),
                    ),*/

                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    // RichText(text: TextSpan(
                    //   text: "Don't have an account?",
                    //   style: poppinsRegular.copyWith(
                    //       fontSize: Dimensions.fontSizeDefault,
                    //       color: Theme.of(context).colorScheme.crossColor),
                    //   children: [
                    //     const TextSpan(text: ' '),
                    //
                    //     TextSpan(
                    //       recognizer: TapGestureRecognizer()
                    //         ..onTap = () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const RegistrationScreen())),
                    //       text: 'SignUp',
                    //       style: poppinsRegular.copyWith(
                    //           fontSize: Dimensions.fontSizeLarge,
                    //           color: Theme.of(context).primaryColor),
                    //     )
                    //   ]
                    // )),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

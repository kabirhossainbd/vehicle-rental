import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_button.dart';
import 'package:vehicle_rental_app/ui/component/custom_text_field.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/helper.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _userNameFocus = FocusNode();

  final TextEditingController _phoneController = TextEditingController();
  //final FocusNode _phoneFocus = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  final TextEditingController _passWordController = TextEditingController();
  final FocusNode _passWordFocus = FocusNode();

  bool _isUserNameError = false;
  bool _isEmailError = false;
  bool _isPasswordError = false;

  int  numberMaxLength = 11;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (auth) => Scaffold(
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
                child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AllImages.logo, height: 140, width: 140),

                    const SizedBox(height: Dimensions.paddingSizeDefault),

                    CustomTextField(
                      controller: _userNameController,
                      focusNode: _userNameFocus,
                      nextFocus: _emailFocus,
                      hintText: 'Username',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      borderRadius: BorderRadius.circular(12),
                      onChanged: (text){
                        setState(() {
                          _isUserNameError = false;
                        });
                      },
                    ),

                    /// for error msg
                    if(_isUserNameError)...[
                      const SizedBox(height: 6),
                      Text('Please enter username',style: poppinsRegular.copyWith(color: Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],

                    const SizedBox(height: Dimensions.paddingSizeDefault),

                     CustomTextField(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      nextFocus: _passWordFocus,
                      hintText: 'Email',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                       borderRadius: BorderRadius.circular(12),
                       onChanged: (text){
                         setState(() {
                           _isEmailError = false;
                         });
                       },
                    ),

                    /// for error msg
                    if(_isEmailError)...[
                      const SizedBox(height: 6),
                      Text('Please enter email',style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],
                    const SizedBox(height: Dimensions.paddingSizeDefault),


                  /*  /// for phone number
                    CustomTextField(
                      controller: _phoneController,
                      focusNode: _phoneFocus,
                      nextFocus: _passWordFocus,
                      hintText: 'Phone',
                      fillColor: MyColor.colorWhite,
                      backgroundColor: MyColor.colorWhite,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.number,
                      borderRadius: BorderRadius.circular(50),
                       onChanged: (newVal){
                        setState(() {
                          _isNumberError = false;
                          if(newVal.length <= numberMaxLength){
                            text = newVal;
                          }else{
                            _phoneController.value = TextEditingValue(
                                text: text,
                                selection: TextSelection(
                                    baseOffset: numberMaxLength,
                                    extentOffset: numberMaxLength,
                                    affinity: TextAffinity.downstream,
                                    isDirectional: false
                                ),
                                composing: TextRange(
                                    start: 0, end: numberMaxLength
                                )
                            );
                            _phoneController.text = text;
                          }
                        });
                      },
                    ),

                    /// for error msg
                    if(_isNumberError)...[
                      const SizedBox(height: 6),
                      Text('Please enter number',style: robotoRegular.copyWith(color:  Colors.red,fontSize: MySizes.fontSizeExtraSmall)),
                    ],
                    const SizedBox(height: MySizes.paddingSizeMiniSmall),
*/

                    CustomTextField(
                      controller: _passWordController,
                      focusNode: _passWordFocus,
                      hintText: 'Password',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      isShowSuffixIcon: true,
                      isPassword: true,
                      borderRadius: BorderRadius.circular(12),
                      onChanged: (text){
                        setState(() {
                          _isPasswordError = false;
                        });
                      },
                    ),

                    /// for error msg
                    if(_isPasswordError)...[
                      const SizedBox(height: 6),
                      Text('Please enter password',style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],

                    const SizedBox(height: Dimensions.paddingSizeDefault),


                    CustomButton(buttonText: 'SignUp', onTap: (){
                      final userName = _userNameController.text;
                      final email = _emailController.text;
                      final phone = _phoneController.text;
                      final password = _passWordController.text;
                      if(userName.isEmpty){
                        setState(() {
                          _isUserNameError = true;
                        });
                      }else if (!validateEmail(email)) {
                        setState(() {
                          _isEmailError = true;
                        });
                      }
                      /*else if(phone.isEmpty){
                        setState(() {
                          _isNumberError = true;
                        });
                      }*/
                      else if(password.isEmpty){
                        setState(() {
                          _isPasswordError = true;
                        });
                      }else{
                       // auth.registration(userName,email, password, phone);
                      }
                    }),

                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    RichText(text: TextSpan(
                        text: "Already have an account?",
                        style: poppinsRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).colorScheme.crossColor),
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = Get.back,
                            text: 'Go back',
                            style: poppinsRegular.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                                color: Theme.of(context).primaryColor),
                          )
                        ]
                    )),

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

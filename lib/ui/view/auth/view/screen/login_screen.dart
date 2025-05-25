import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/common/data/datasource/remote/network_service.dart';
import 'package:vehicle_rental_app/helper/ui_helper/dialog_helper.dart';
import 'package:vehicle_rental_app/routes.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_button.dart';
import 'package:vehicle_rental_app/ui/component/custom_text_field.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/helper.dart';
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

  String _isEmailError = '';
  String _isPasswordError = '';
  final NetworkConnectivityObserver _observer = NetworkConnectivityObserver();

  @override
  void initState() {
    _observer.checkInternetStatus().then((isInternet){
      Get.find<AuthController>().setIsNetworkConnected(isInternet);
    });

    _observer.connectivityStream.listen((event) {
      Get.find<AuthController>().setIsNetworkConnected(event);
    });
    super.initState();
  }

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
                          _isEmailError = '';
                        });
                      },
                      fillColor: Theme.of(context).colorScheme.whiteColor,
                      backgroundColor: Theme.of(context).colorScheme.whiteColor,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    /// for error msg
                    if(_isEmailError.isNotEmpty)...[
                      const SizedBox(height: 6),
                      Text(_isEmailError,style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
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
                          _isPasswordError = '';
                        });
                      },
                      isPassword: true,
                      isShowSuffixIcon: true,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    /// for error msg
                    if(_isPasswordError.isNotEmpty)...[
                      const SizedBox(height: 6),
                      Text(_isPasswordError,style: poppinsRegular.copyWith(color:  Colors.red,fontSize: Dimensions.fontSizeExtraSmall)),
                    ],

                    const SizedBox(height: Dimensions.paddingSizeDefault),


                    auth.isLoading ? Center(child: CircularProgressIndicator()) :
                    CustomButton(buttonText: 'LogIn', onTap: (){
                      final email = _userNameController.text;
                      final password = _passWordController.text;
                     if (email.isEmpty) {
                        setState(() {
                          _isEmailError = 'Please enter email';
                        });
                      }else if (!validateEmail(email)) {
                       setState(() {
                         _isEmailError = 'Please enter valid email';
                       });
                     }else if(password.isEmpty){
                        setState(() {
                          _isPasswordError = 'Please enter password';
                        });
                      }else if(password.length < 6){
                       setState(() {
                         _isPasswordError = 'Password should be 6 character';
                       });
                     }else{
                       auth.loginBody(email, password).then((value){
                         if(value.isSuccess!){
                           Get.offAllNamed(RouterHelper.getMainRoute());
                         }else{
                           if(!Get.isDialogOpen!){
                             DialogHelper.showErrorDialog(description: value.message);
                           }
                         }
                       });
                      }
                    }),


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

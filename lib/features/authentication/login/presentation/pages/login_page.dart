import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../manager/auth_provider.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  AuthProvider authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      child: const LogInScreenContent(),
    );
  }
}

class LogInScreenContent extends StatefulWidget {
  const LogInScreenContent({Key? key}) : super(key: key);

  @override
  State<LogInScreenContent> createState() => _LogInScreenContentState();
}

class _LogInScreenContentState extends State<LogInScreenContent> {
  final _formKey = GlobalKey<FormState>();
  AuthProvider authProvider = sl();

  // TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Image.asset(
                          AppAssets.carParkinglogo,
                          height: 180.h,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Welcome !',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 42.sp)),
                      ),
                      // SvgPicture.asset(AppAssets.googlePng, height: 45.h),
                      Text('Please Sign in  ',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp)),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomTextFormField(
                          validator: FormValidators.validateEmail,
                          maxLines: 1,
                          hintText: "Enter here",
                          labelText: "Email user name or number",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: CustomTextFormField(
                          maxLines: 1,
                          obscureText: true,
                          hintText: "Enter here",
                          validator: FormValidators.validateLoginPassword,
                          controller: passwordController,
                          // context.read<SignUpViewModel>().passwordHintText,
                          labelText: "Enter your Password",

                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),

                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.h,
                          child: ContinueButton(
                            loadingNotifier: authProvider.loginLoading,
                            text: 'LogIn',
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                              } else {
                                authProvider.loginUser(emailController.text,
                                    passwordController.text);

                                // signUpProvider.signUpUser();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

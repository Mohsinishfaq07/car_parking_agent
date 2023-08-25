import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../../../login/presentation/manager/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  AuthProvider authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      child: const SignUpScreenContent(),
    );
  }
}

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({Key? key}) : super(key: key);

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  final _formKey = GlobalKey<FormState>();
  AuthProvider authProvider = sl();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
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
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Welcome !',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 42.sp)),
                      ),

                      // SvgPicture.asset(AppAssets.googlePng, height: 45.h),
                      Text('Please Sign in  ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 24.sp)),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomTextFormField(
                          validator: FormValidators.validatePhone,
                          maxLines: 1,

                          hintText: "Enter your first name  ",
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberHintText,
                          labelText:"Enter your first name  ",
                          controller: firstNameController,
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberLabelText,
                          // controller: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberController,
                          // focusNode: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberFocusNode,
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(11),
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.phone,
                          // validator: TextFieldValidator.validatePhone,
                          // onFieldSubmitted: (value) {
                          //   FocusScope.of(context).requestFocus(
                          //       context.read<SignUpViewModel>().emailFocusNode);
                          // },
                        ),
                      ), Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomTextFormField(
                          validator: FormValidators.validatePhone,
                          maxLines: 1,

                          hintText:"Enter your last name  ",
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberHintText,
                          labelText: "Enter your last name  ",
                          controller:lastNameController,
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberLabelText,
                          // controller: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberController,
                          // focusNode: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberFocusNode,
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(11),
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.phone,
                          // validator: TextFieldValidator.validatePhone,
                          // onFieldSubmitted: (value) {
                          //   FocusScope.of(context).requestFocus(
                          //       context.read<SignUpViewModel>().emailFocusNode);
                          // },
                        ),
                      ), Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomTextFormField(
                          validator: FormValidators.validatePhone,
                          maxLines: 1,

                          hintText: "Enter your email/number ",
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberHintText,
                          labelText: "Enter your email/number ",
                          controller: phoneController,
                          // context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberLabelText,
                          // controller: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberController,
                          // focusNode: context
                          //     .read<SignUpViewModel>()
                          //     .phoneNumberFocusNode,
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(11),
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          keyboardType: TextInputType.phone,
                          // validator: TextFieldValidator.validatePhone,
                          // onFieldSubmitted: (value) {
                          //   FocusScope.of(context).requestFocus(
                          //       context.read<SignUpViewModel>().emailFocusNode);
                          // },
                        ),
                      ),
                      // CustomTextFormField(
                      //   maxLines: 1,
                      //   hintText: "Enter your Email",
                      //   controller: emailController,
                      //   validator: FormValidators.validateEmail,
                      //   // context.read<SignUpViewModel>().emailHintText,
                      //   labelText: "Enter your Email",
                      //   // context.read<SignUpViewModel>().emailLabelText,
                      //   // controller:
                      //   // context.read<SignUpViewModel>().emailController,
                      //   // focusNode:
                      //   // context.read<SignUpViewModel>().emailFocusNode,
                      //   keyboardType: TextInputType.emailAddress,
                      //   // validator: TextFieldValidator.validateEmail,
                      //   // onFieldSubmitted: (value) {
                      //   //   FocusScope.of(context).requestFocus(context
                      //   //       .read<SignUpViewModel>()
                      //   //       .passwordFocusNode);
                      //   // },
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: CustomTextFormField(
                          maxLines: 1,
                          obscureText: true,
                          hintText: "Enter your Password",
                          validator:
                          FormValidators.validateLoginPassword,
                          controller: passwordController,
                          // context.read<SignUpViewModel>().passwordHintText,
                          labelText: "Enter your Password",

                          // context.read<SignUpViewModel>().passwordLabelText,
                          // controller: context
                          //     .read<SignUpViewModel>()
                          //     .passwordController,
                          // focusNode:
                          // context.read<SignUpViewModel>().passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          // validator: TextFieldValidator.validatePassword,
                          // onFieldSubmitted: (value) {
                          //   FocusScope.of(context).requestFocus(context
                          //       .read<SignUpViewModel>()
                          //       .confirmPasswordFocusNode);
                          // },
                        ),
                      ),

                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                // AppState appState = sl();
                                // appState.goToNext(
                                //     PageConfigs.forgotPasswordPageConfig
                                // );
                              },
                              child: const Text(
                                "forgot Password ",
                                textAlign: TextAlign.right,
                              ))),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.h,
                          child: ContinueButton(
                            loadingNotifier: authProvider.loginLoading,
                            text: 'SignUp',
                            onPressed: () async {
                               // if (!_formKey.currentState!.validate()) {}
                               // AppState appState =sl();
                               // appState.goToNext(PageConfigs.dashboardPageConfig);

                              if (!_formKey.currentState!.validate()) {
                              } else {
                                // authProvider.registerdUser(firstNameController.text,lastNameController.text,phoneController.text,passwordController.text);
                                  // phoneController.text,
                                  // passwordController.text

                                // );
                              //
                              //   // signUpProvider.signUpUser();
                              }

                              // if (!_formKey.currentState!.validate()) {
                              //   return;
                              // }
                              // await context
                              //     .read<SignUpViewModel>()
                              //     .registerUser();
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {}

                              // AppState appState = sl();
                              // appState.goToNext(
                              //     PageConfigs.signUpScreenPageConfig);
                            },
                            // context.read<SignUpViewModel>().moveToSignIn,
                            child: RichText(
                              text: TextSpan(
                                text: "Don't  have an account ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: 'SignUp?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                          fontWeight:
                                          FontWeight.bold)),
                                ],
                              ),
                            ),
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

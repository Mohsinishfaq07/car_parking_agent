// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_form_field.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/dashboard_provider.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/vehicle_type_button.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../authentication/login/presentation/manager/auth_provider.dart';
import '../pages/qr_scan_screen.dart';
import 'custom_thermal_printer.dart';

class CheckInWidget extends StatefulWidget {
  const CheckInWidget({Key? key}) : super(key: key);

  @override
  State<CheckInWidget> createState() => _CheckInWidgetState();
}

class _CheckInWidgetState extends State<CheckInWidget> {
  AuthProvider authProvider = sl();
  DashboardProvider dashboardProvider = sl();

  final GlobalKey<FormState> formKey = GlobalKey();

  CustomThermalPrinter printer = CustomThermalPrinter.instance;

  @override
  void initState() {
    dashboardProvider.getAllCategory();

    getValue();
    super.initState();
  }

  void getValue() async {
    await dashboardProvider.getAllCategory();
  }

  bool isSelected = true;
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   children: [
                //     VehicleTypeButton(
                //       ontap: () {
                //         // setState(() {
                //         //   dashboardProvider.ltvSelected =
                //         //       !dashboardProvider.ltvSelected;
                //         //   dashboardProvider.htvSelected = false;
                //         //   dashboardProvider.bikeSelected = false;
                //         // });
                //       },
                //       isSelected: dashboardProvider.ltvSelected,
                //       icon: Icons.fire_truck,
                //       title: "HTV",
                //       // authProvider.getAllCategoryResponseModel!.name.toString(),
                //     ),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     VehicleTypeButton(
                //       ontap: () {
                //         // setState(() {
                //         //   dashboardProvider.ltvSelected =
                //         //       !dashboardProvider.ltvSelected;
                //         //   dashboardProvider.htvSelected = false;
                //         //   dashboardProvider.bikeSelected = false;
                //         // });
                //       },
                //       isSelected: dashboardProvider.ltvSelected,
                //       icon: Icons.car_crash,
                //       title: "LTV",
                //       // authProvider.getAllCategoryResponseModel!.name.toString(),
                //     ),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     VehicleTypeButton(
                //       ontap: () {
                //         // setState(() {
                //         //   dashboardProvider.ltvSelected =
                //         //       !dashboardProvider.ltvSelected;
                //         //   dashboardProvider.htvSelected = false;
                //         //   dashboardProvider.bikeSelected = false;
                //         // });
                //       },
                //       isSelected: dashboardProvider.ltvSelected,
                //       icon: Icons.bike_scooter,
                //       title: "Bike",
                //       // authProvider.getAllCategoryResponseModel!.name.toString(),
                //     ),
                //   ],
                // ),
                ValueListenableBuilder<bool>(
                    valueListenable:
                        dashboardProvider.getAllCategoryLoadingNotifier,
                    builder: (_, loading, __) {
                      return loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: 82.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: dashboardProvider
                                      .getAllCategoryResponseModel!.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final value = dashboardProvider
                                        .getAllCategoryResponseModel!
                                        .data[index];
                                    return VehicleTypeButton(
                                      id: dashboardProvider
                                          .getAllCategoryResponseModel!
                                          .data[index]
                                          .id!,
                                      ontap: () {

                                        // print("this is on tap on vehicle");
                                        // Logger().i(dashboardProvider
                                        //     .getAllCategoryResponseModel!
                                        //     .data[index]
                                        //     .id!);
                                        dashboardProvider
                                                .selectedVehicleId.value =
                                            dashboardProvider
                                                .getAllCategoryResponseModel!
                                                .data[index]
                                                .id!;
                                        setState(() {

                                        });
                                        // print(dashboardProvider
                                        //     .selectedVehicleId.value);
                                        // if(selectedVehicleId == dashboardProvider.selectedVehicleId) ? Colors.black : Colors.green;
                                      },
                                      isSelected: activeMenu == 1,
                                      // isSelected: dashboardProvider.ltvSelected,
                                      title: value.name,
                                      image: value.icon,

                                      // authProvider.getAllCategoryResponseModel!.name.toString(),
                                    );
                                  }),
                            );
                    }),

                30.ph,
                Wrap(
                  children: [
                    // VehicleTypeButton(
                    //   ontap: () {
                    //     setState(() {
                    //       dashboardProvider.htvSelected =
                    //           !dashboardProvider.htvSelected;
                    //
                    //       dashboardProvider.ltvSelected = false;
                    //       dashboardProvider.bikeSelected = false;
                    //       // DashboardProvider provider = DashboardProvider();
                    //       // print(provider.htvIsselected);
                    //       // provider.ltvIsselected = false;
                    //       // provider.bikeIsselected = false;
                    //       // provider.htvIsselected = true;
                    //       // print(provider.htvIsselected);
                    //     });
                    //   },
                    //   isSelected: dashboardProvider.htvSelected,
                    //   icon: authProvider.getAllCategoryResponseModel!.,
                    //   title: "HTV",
                    // ),
                    // VehicleTypeButton(
                    //   ontap: () {
                    //     setState(() {
                    //       dashboardProvider.ltvSelected =
                    //           !dashboardProvider.ltvSelected;
                    //       dashboardProvider.htvSelected = false;
                    //       dashboardProvider.bikeSelected = false;
                    //     });
                    //   },
                    //   isSelected: dashboardProvider.ltvSelected,
                    //   icon: Icons.car_crash,
                    //   title: "LtV",
                    //   // authProvider.getAllCategoryResponseModel!.name.toString(),
                    // ),

                   60.ph,
                    CustomTextFormField(
                      controller: authProvider.checkInCardNoController,
                      hintText: 'Card Number',
                      labelText: '',
                      suffixIconPath: 'assets/images/qr-code.png',
                      validator: FormValidators.validateCardNumber,
                      suffixIconOnTap: () {
                        AppState appState = sl();
                        appState.addWidget(
                            page: PageConfigs.qrScanScreenConfig,
                            child: const QRViewExample(
                              entryType: EntryType.checkIn,
                            ));
                      },
                    ),
                    20.ph,
                    CustomTextFormField(
                        validator: FormValidators.validateVehicleNumber,
                        controller: authProvider.checkInVehicleNoController,
                        hintText: 'Vehicle No',
                        labelText: ''),
                    70.ph,
                    ContinueButton(
                        loadingNotifier: authProvider.checkInLoading,
                        text: 'Check-In',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            authProvider.checkIn();
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/qr_scan_screen.dart';

import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';

enum VehicleType { car, bike, rikshaw, truck }

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  VehicleType _vehicleType = VehicleType.car;
  AuthProvider authProvider = sl();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (false)
              SizedBox(
                height: 84.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _vehicleType = VehicleType.car;
                          });
                        },
                        child: _returnVehicleTypeWidget(context,
                            iconPath: 'assets/images/car.png',
                            selected: _vehicleType == VehicleType.car)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _vehicleType = VehicleType.bike;
                          });
                        },
                        child: _returnVehicleTypeWidget(context,
                            iconPath: 'assets/images/motorbike.png',
                            selected: _vehicleType == VehicleType.bike)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _vehicleType = VehicleType.rikshaw;
                          });
                        },
                        child: _returnVehicleTypeWidget(context,
                            iconPath: 'assets/images/tuk-tuk.png',
                            selected: _vehicleType == VehicleType.rikshaw)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _vehicleType = VehicleType.truck;
                          });
                        },
                        child: _returnVehicleTypeWidget(context,
                            iconPath: 'assets/images/box-truck.png',
                            selected: _vehicleType == VehicleType.truck)),
                  ],
                ),
              ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextFormField(
              hintText: 'Card Number',
              labelText: '',
              readOnly: true,
              controller: authProvider.checkOutCardNoController,
              suffixIconPath: 'assets/images/qr-code.png',
              suffixIconOnTap: () async {
                AppState appState = sl();
                appState.addWidget(
                    page: PageConfigs.qrScanScreenConfig,
                    child: const QRViewExample(
                      entryType: EntryType.checkOut,
                    ));
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            ContinueButton(
                loadingNotifier: authProvider.checkoutLoading,
                text: 'Check Out',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    authProvider.checkOut();
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget _returnVehicleTypeWidget(context,
      {required String iconPath, bool selected = false}) {
    return Container(
      height: 84,
      width: 80,
      margin: EdgeInsets.only(right: 7.w),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(.8)
              : Colors.black12.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.r)),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            iconPath,
            height: 70,
            width: 70,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

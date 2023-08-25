import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/dashboard_provider.dart';

import '../../../../core/utils/constants/app_url.dart';
import '../../../../core/utils/globals/globals.dart';

class VehicleTypeButton extends StatefulWidget {
  String title;
  // IconData icon;
  String image;
  String id;
  bool isSelected;
  Function() ontap;
  VehicleTypeButton(
      {Key? key,
        required this.title,
        required this.image,
        required this.id,
        // required this.icon,
        required this.isSelected,
        required this.ontap})
      : super(key: key);

  @override
  State<VehicleTypeButton> createState() => _VehicleTypeButtonState();
}

class _VehicleTypeButtonState extends State<VehicleTypeButton> {
  DashboardProvider dashboardProvider = sl();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Colors.grey.withOpacity(.3),
            border: Border.all(
              width: 1,
              color:  dashboardProvider
                  .selectedVehicleId.value == widget.id ? Colors.black : Colors.blue,
            ),
            borderRadius: BorderRadius.circular(12)),
        height: 82.h,
        width: 82.w,
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(widget.icon),
            Image.network(AppUrl.fileBaseUrl + widget.image,height: 40,),
            SizedBox(
              height: 4.h,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

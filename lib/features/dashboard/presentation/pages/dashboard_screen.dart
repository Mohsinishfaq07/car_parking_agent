import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/dashboard_provider.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/check_in_widget.dart';

import '../../../../core/utils/globals/globals.dart';
import '../widgets/check_out_widget.dart';

enum TicketType { card, ticket }

class DashboardScreen extends StatelessWidget {
  DashboardProvider dashboardProvider = sl();
  AuthProvider authProvider = sl();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider.value(value: dashboardProvider),
      ],
      child: const DashboardScreenContent(),
    );
  }
}

class DashboardScreenContent extends StatefulWidget {
  const DashboardScreenContent({Key? key}) : super(key: key);

  @override
  State<DashboardScreenContent> createState() => _DashboardScreenContentState();
}

class _DashboardScreenContentState extends State<DashboardScreenContent> {
  TicketType _ticketType = TicketType.card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                    const Text(
                      'My Information',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: const Text('All History'),
              onTap: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.historyPageConfig);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: const Text('My History'),
              onTap: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.myHistoryPageConfig);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Vehicle Tracking System"),
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 50.h,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  AuthProvider authProvider = sl();
                  authProvider.checkInVehicleNoController.clear();
                  authProvider.checkInCardNoController.clear();
                  authProvider.checkOutCardNoController.clear();
                  AppState appState = sl();
                  FlutterSecureStorage flutterSecrue = sl();
                  flutterSecrue.delete(key: 'user');
                  appState.goToNext(PageConfigs.logInScreenConfig,
                      pageState: PageState.replaceAll);
                },
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 5)
                  ]),
                  width: double.infinity,
                  height: 140.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  const AssetImage('assets/images/parking.jpg'),
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).primaryColor,
                                  BlendMode.softLight),
                              fit: BoxFit.cover),
                        ),
                      ))),
              20.ph,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _ticketType = TicketType.card;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: _ticketType == TicketType.card
                              ? Theme.of(context).primaryColor
                              : null),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: _ticketType != TicketType.card
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                          ),
                         5.pw,
                          Text(
                            "Check-In",
                            style: TextStyle(
                              color: _ticketType != TicketType.card
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.pw,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _ticketType = TicketType.ticket;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: _ticketType == TicketType.ticket
                              ? Theme.of(context).primaryColor
                              : null),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.logout,
                            color: _ticketType != TicketType.ticket
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                          ),
                          5.pw,
                          Text(
                            "Checkout",
                            style: TextStyle(
                              color: _ticketType != TicketType.ticket
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              10.ph,

              Expanded(
                  child: _ticketType == TicketType.card
                      ? const CheckInWidget()
                      : const CheckoutWidget())
            ],
          ),
        ),
      ),
    );
  }
}
extension padding on  num {
  SizedBox get ph => SizedBox(height: toDouble().h,);
  SizedBox get pw => SizedBox(width: toDouble().w,);
}

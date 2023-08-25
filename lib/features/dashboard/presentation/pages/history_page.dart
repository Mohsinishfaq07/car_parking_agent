import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

import '../../../../core/utils/globals/globals.dart';

class AllHistoryPage extends StatelessWidget {
  AuthProvider authProvider = sl();

  AllHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      child: const AllHistoryPageContent(),
    );
  }
}

class AllHistoryPageContent extends StatefulWidget {
  const AllHistoryPageContent({Key? key}) : super(key: key);

  @override
  State<AllHistoryPageContent> createState() => _AllHistoryPageContentState();
}

class _AllHistoryPageContentState extends State<AllHistoryPageContent> {
  AuthProvider authProvider = sl();

  @override
  void initState() {
    // _tabController = TabController(length: 2,vsync: )

    getValue();
    super.initState();
  }

  void getValue() async {
    await authProvider.getAllHistory();
    // print(authProvider.getAllHistoryResponseModel?.checkIns);
  }

  // late TabController _tabController;
  // int activemenu = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50.h,
            backgroundColor: Colors.black,
            title: const Text("All History"),
            bottom: const TabBar(
              // controller: _tabController,
              tabs: [
                Tab(text: 'All CheckIn'),
                Tab(text: 'All CheckOut'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: SafeArea(
                  child: ValueListenableBuilder(
                    valueListenable: authProvider.getAllHistoryLoadingNotifier,
                    builder: (context, value, child) {
                      if (value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if(authProvider
                            .getAllHistoryResponseModel?.checkIns==null) {
                          return const Text("No data found");
                        }
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: ListView.builder(
                              itemCount: authProvider
                                  .getAllHistoryResponseModel?.checkIns!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text("Vehicle Number : "),
                                          Text("Vehicle Type : "),
                                          Text("Check In Time : "),
                                          Text("Check In By : "),
                                          Text("User id : "),
                                          Text("Vehicle id : "),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            authProvider
                                                .getAllHistoryResponseModel!
                                                .checkIns![index]
                                                !.vehicleRegNumber!,
                                          ),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index].vehicleType?.name??"no name"
                                          ),


                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index]
                                              .checkInTime!),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index]
                                              .checkInBy!
                                              .firstName! + authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index]
                                              .checkInBy!
                                              .lastName!  ),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index].id!),

                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkIns![index]
                                              .vehicleType!.sId!),
                                          // Text(authProvider
                                          //     .getAllHistoryResponseModel!
                                          //     .checkIns[index]
                                          //     .vehicleType?.id.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                ),
              ),
              Center(
                child: SafeArea(
                  child: ValueListenableBuilder(
                    valueListenable: authProvider.getAllHistoryLoadingNotifier,
                    builder: (context, value, child) {
                      if (value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if(authProvider
                            .getAllHistoryResponseModel?.checkOuts==null)
                          return Text("No data found");
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: ListView.builder(
                              itemCount: authProvider
                                  .getAllHistoryResponseModel?.checkOuts!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text("Vehicle Number : "),
                                          Text("Vehicle Type : "),
                                          Text("Check In Time : "),
                                          Text("Check In By : "),
                                          Text("User id : "),
                                          Text("Vehicle id : "),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            authProvider
                                                .getAllHistoryResponseModel!
                                                .checkOuts![index]
                                                .vehicleRegNumber!,
                                          ),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkOuts![index]
                                              .vehicleType
                                              !.name!),
                                          Text(
                                            authProvider
                                                .getAllHistoryResponseModel!
                                                .checkOuts![index]
                                                .checkOutTime!,
                                          ),
                                          Text(  authProvider
                                              .getAllHistoryResponseModel!
                                              .checkOuts![index]
                                              .checkInBy
                                             ! .firstName! +
                                              "" +
                                              authProvider
                                                  .getAllHistoryResponseModel!
                                                  .checkOuts![index]
                                                  .checkInBy
                                                  !.lastName!,),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkOuts![index]
                                              .sId!),
                                          Text(authProvider
                                              .getAllHistoryResponseModel!
                                              .checkOuts![index]
                                              .vehicleType
                                              !.sId!),
                                        ],
                                      ),

                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

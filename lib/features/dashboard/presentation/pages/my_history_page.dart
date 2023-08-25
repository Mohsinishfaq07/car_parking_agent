import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import '../../../../core/utils/globals/globals.dart';

class MyHistoryPage extends StatelessWidget {
  AuthProvider authProvider = sl();

  MyHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      child: const MyHistoryPageContent(),
    );
  }
}

class MyHistoryPageContent extends StatefulWidget {
  const MyHistoryPageContent({Key? key}) : super(key: key);

  @override
  State<MyHistoryPageContent> createState() => _MyHistoryPageContentState();
}

class _MyHistoryPageContentState extends State<MyHistoryPageContent> {
  AuthProvider authProvider = sl();

  @override
  void initState() {
    // _tabController = TabController(length: 2,vsync: )

    getValue();
    super.initState();
  }

  void getValue() async {
    await authProvider.getMyHistory();
    // print(authProvider.getMyHistoryResponseModel?.checkInHistory);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50.h,
            backgroundColor: Colors.black,
            title: const Text("My History"),
            bottom: const TabBar(
              // controller: _tabController,
              tabs: [
                Tab(text: 'My CheckIns'),
                Tab(text: 'My CheckOuts'),
              ],
            ),
          ),
          body: TabBarView(
            // controller: _tabController,

            children: [
              Center(
                child: SafeArea(
                  child: ValueListenableBuilder(
                    valueListenable: authProvider.getMyHistoryLoadingNotifier,
                    builder: (context, value, child) {
                      if (value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: ListView.builder(
                              itemCount: authProvider.getMyHistoryResponseModel
                                  ?.checkInHistory?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Vehicle Number : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .vehicleRegNumber),
                                      Text("Vehicle Type       : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .vehicleType
                                              .name),
                                      Text("Check In Time    : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .checkInTime),
                                      Text("Check In By        : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .checkInBy
                                              .firstName +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .checkInBy
                                              .lastName),
                                      Text("User id                : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .id),
                                      Text("Vehicle id           : " +
                                          authProvider
                                              .getMyHistoryResponseModel!
                                              .checkInHistory[index]
                                              .vehicleType
                                              .id),
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
                    valueListenable: authProvider.getMyHistoryLoadingNotifier,
                    builder: (context, value, child) {
                      if (value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (authProvider
                                .getMyHistoryResponseModel?.checkOutHistory ==
                            null) {
                          return const Text("No history found");
                        }
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: ListView.builder(
                              itemCount: authProvider.getMyHistoryResponseModel!
                                  .checkOutHistory!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                .getMyHistoryResponseModel!
                                                .checkOutHistory[index]
                                                .vehicleRegNumber,
                                          ),
                                          Text(authProvider
                                              .getMyHistoryResponseModel!
                                              .checkOutHistory[index]
                                              .vehicleType
                                              .name),
                                          Text(authProvider
                                              .getMyHistoryResponseModel!
                                              .checkOutHistory[index]
                                              .checkOutTime
                                              .toString()),
                                          Text(authProvider
                                                  .getMyHistoryResponseModel!
                                                  .checkOutHistory[index]
                                                  .checkOutBy!
                                                  .firstName +
                                              authProvider
                                                  .getMyHistoryResponseModel!
                                                  .checkOutHistory[index]
                                                  .checkOutBy!
                                                  .lastName),
                                          Text(authProvider
                                              .getMyHistoryResponseModel!
                                              .checkOutHistory[index]
                                              .id),
                                          Text(authProvider
                                              .getMyHistoryResponseModel!
                                              .checkOutHistory[index]
                                              .vehicleType
                                              .id),
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

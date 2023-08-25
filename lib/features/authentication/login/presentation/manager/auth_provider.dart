import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/usecases/usecase.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/gen_qr_requestmodel.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/gen_qr_response_model.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_request_model.dart';
import 'package:sb_myreports/features/authentication/login/domain/usecases/login_usecase.dart';
import 'package:sb_myreports/features/dashboard/data/models/get_all_history_response_model.dart';
import 'package:sb_myreports/features/dashboard/data/models/get_qr_code_by_id_request_model.dart';
import 'package:sb_myreports/features/dashboard/presentation/manager/dashboard_provider.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/globals/snack_bar.dart';
import '../../../../dashboard/data/models/get_my_history_response_model.dart';
import '../../../../dashboard/presentation/widgets/custom_thermal_printer.dart';
import '../../data/modals/get_all_category_reponse_model.dart';
import '../../data/modals/login_response_modal.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(
    this._loginUsecase,
    this._checkOutUsecase,
    this._checkInUsecase,
    this._getQrCodeByIdUsecase,
    this._generateQRUsecase,
    this._getAllHistoryUsecase,
    this._getMyHistoryUsecase,
  );

  //usecases
  // final SignUpUsecase _signUpUseCase;
  final LoginUsecase _loginUsecase;
  String? qr;
  final GetQrCodeByIdUsecase _getQrCodeByIdUsecase;
  final CheckOutUsecase _checkOutUsecase;
  final GenerateQRUsecase _generateQRUsecase;
  final CheckInUsecase _checkInUsecase;
  final GetAllHistoryUseCase _getAllHistoryUsecase;
  final GetMyHistoryUseCase _getMyHistoryUsecase;
  // final GetAllCategoryUseCase _getAllCategoryUsecase;

  // SignUpRequestModel? signUpRequestModel;
  GenerateQRResponseModel? generateQRResponseModel;
  GetAllHistoryResponseModel? getAllHistoryResponseModel;
  GetMyHistoryResponseModel? getMyHistoryResponseModel;
  // GetAllCategoryResponseModel? getAllCategoryResponseModel;
  LoginRequestModel? loginRequestModel;
  LoginResponseModel? loginResponseModel;

  TextEditingController checkInCardNoController = TextEditingController();
  TextEditingController checkInVehicleNoController = TextEditingController();
  TextEditingController checkOutCardNoController = TextEditingController();

  //valuenotifiers

  ValueNotifier<bool> loginLoading = ValueNotifier(false);
  ValueNotifier<bool> checkInLoading = ValueNotifier(false);
  ValueNotifier<bool> checkoutLoading = ValueNotifier(false);
  ValueNotifier<bool> getQrByIdLoading = ValueNotifier(false);
  ValueNotifier<bool> signUpLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> generateQRLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> getAllHistoryLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> getMyHistoryLoadingNotifier = ValueNotifier(false);
  // ValueNotifier<bool> getAllCategoryLoadingNotifier = ValueNotifier(false);

  String? userId;

  final FlutterSecureStorage secureStorage = sl();
  AppState appState = sl();

  //usecases calls
  Future<void> loginUser(String email, String password) async {
    loginLoading.value = true;
    final params = LoginRequestModel(email: email, password: password);
    var loginEither = await _loginUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      loginLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        loginLoading.value = false;
        loginResponseModel = response;

        //  userId = response.data.id;
        // Logger().i(loginResponseModel!.data.id);

        await secureStorage.write(
            key: 'user', value: jsonEncode(response.toJson()));
        AppState appState = sl();
        appState.goToNext(PageConfigs.dashboardPageConfig);
      });
    }
  }

  Future<void> getAllHistory() async {
    // Logger().v(loginResponseModel!.data.id);
    getAllHistoryLoadingNotifier.value = true;
    // final params = GetHistoryRequestModel();
    var loginEither = await _getAllHistoryUsecase(NoParams());
    if (loginEither.isLeft()) {
      // print("this is left get  history ");

      handleError(loginEither);
      loginLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        getAllHistoryLoadingNotifier.value = false;
        getAllHistoryResponseModel = response;
        // print("this is  right History screen");
        // print(getHistory());
        // print(getAllHistoryResponseModel?.checkOuts);
        // userId = response.data.id;
        // Logger().i(getHistoryResponseModel!.checkInHistory);
      });
    }
  }
  Future<void> getMyHistory() async {
    // Logger().v(loginResponseModel!.data.id);
    getMyHistoryLoadingNotifier.value = true;
    // final params = GetHistoryRequestModel();
    var loginEither = await _getMyHistoryUsecase(loginResponseModel!.data.id);
    if (loginEither.isLeft()) {
      // print("this is left my  history ");

      handleError(loginEither);
      loginLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        getMyHistoryLoadingNotifier.value = false;
        getMyHistoryResponseModel = response;
        // print("this is  right History screen");
        // // print(getHistory());
        // print("this is checkin Hustory ");
        // print(response.checkInHistory);
        // print("this is checkout Hustory ");
        // print(response.checkOutHistory);
        // print(getMyHistoryResponseModel?.checkInHistory);
        // userId = response.data.id;
        // Logger().i(getHistoryResponseModel!.checkInHistory);
      });
    }
  }

  // Future<void> getAllCategory() async {
  //   getAllCategoryLoadingNotifier.value = true;
  //   // final params = GetHistoryRequestModel();
  //   var loginEither = await _getAllCategoryUsecase(NoParams());
  //   if (loginEither.isLeft()) {
  //     handleError(loginEither);
  //     getAllCategoryLoadingNotifier.value = false;
  //   } else if (loginEither.isRight()) {
  //     loginEither.foldRight(null, (response, previous) async {
  //       getAllCategoryLoadingNotifier.value = false;
  //       getAllCategoryResponseModel = response;
  //       print(response);
  //       Logger().i(response);
  //       //  userId = response.data.id;
  //       // Logger().i(getHistoryResponseModel!.checkInHistory);
  //     });
  //   }
  // }

  /// This method is to check if user is logged in or not, will return null if no user found
  Future<void> checkIfUserLoggedIn() async {
    final result = await secureStorage.read(key: 'user');
    // Logger().i(result);
    if (result == null) {
      appState.goToNext(PageConfigs.logInScreenConfig);
    } else {
      final map = jsonDecode(result);
      loginResponseModel = LoginResponseModel.fromJson(map);
      appState.goToNext(PageConfigs.dashboardPageConfig);
    }
  }

  Future<void> getQrById(String id) async {
    getQrByIdLoading.value = true;
    checkInVehicleNoController.clear();
    final params = GetQrCodeByIdRequestModel(id);

    var loginEither = await _getQrCodeByIdUsecase(params);

    if (loginEither.isLeft()) {
      handleError(loginEither);
      checkInCardNoController.clear();
      getQrByIdLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        if (response.vehicelNumber != null) {
          checkInVehicleNoController.text = response.vehicelNumber!;
        }
        getQrByIdLoading.value = false;
      });
    }
  }

  CustomThermalPrinter printer = CustomThermalPrinter.instance;

  DashboardProvider dashboardProvider = sl();

  Future<void> checkIn() async {
    // Logger().i(userId);
    checkInLoading.value = true;

    final params = CheckInRequestModel(
        qrId: checkInCardNoController.text,
        vehicleRegNumber: checkInVehicleNoController.text,
        userId: loginResponseModel!.data.id,
        vehicleType: dashboardProvider.selectedVehicleId.value);
    // print("these are params");
    // print(params);

    var loginEither = await _checkInUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      checkInLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        checkInLoading.value = false;
        checkInCardNoController.clear();
        checkInVehicleNoController.clear();
        ShowSnackBar.show("Checked In successfully");
        // getHistory();
      });
    }
  }

  Future<void> checkOut() async {
    checkoutLoading.value = true;
    final params = CheckOutRequestModel(
        qrId: checkOutCardNoController.text,
        userId: loginResponseModel!.data.id);
    var loginEither = await _checkOutUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      checkoutLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        checkOutCardNoController.clear();
        checkoutLoading.value = false;
        ShowSnackBar.show("Checked Out Successfully");
      });
    }
  }

  Future<void> generateQR() async {
    generateQRLoadingNotifier.value = true;
    final params = GenerateQRRequestModel(
        vehicleRegNumber: checkInVehicleNoController.text,
        vehicleModal: '',
        vehicleColor: '',
        vehiclePic: '');
    var loginEither = await _generateQRUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      generateQRLoadingNotifier.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        generateQRResponseModel = response;
        generateQRLoadingNotifier.value = false;
        Future.delayed(const Duration(seconds: 5), () {
          printer.printerController
              .printQrCode(response.qrId, response.vehicleRegNumber!);
        });

        // Logger().v(generateQRResponseModel!.toJson());
        // qr=generateQRResponseModel!.qrId.;
      });
    }
  }
  // Future<void> generateQR() async {
  //   generateQRLoadingNotifier.value = true;
  //   final params = GenerateQRRequestModel(
  //       vehicleRegNumber: checkInVehicleNoController.text,
  //       vehicleModal: '',
  //       vehicleColor: '',
  //       vehiclePic: '');
  //   var loginEither = await _generateQRUsecase(params);
  //   if (loginEither.isLeft()) {
  //     handleError(loginEither);
  //     generateQRLoadingNotifier.value = false;
  //   } else if (loginEither.isRight()) {
  //     loginEither.foldRight(null, (response, previous) async {
  //       generateQRResponseModel = response;
  //       generateQRLoadingNotifier.value = false;
  //       Future.delayed(const Duration(seconds: 5), () {
  //         printer.printerController
  //             .printQrCode(response.qrId, response.vehicleRegNumber!);
  //       });
  //
  //       Logger().v(generateQRResponseModel!.toJson());
  //       // qr=generateQRResponseModel!.qrId.;
  //       Logger().v(generateQRResponseModel!.qrId);
  //     });
  //   }
  // }

  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}

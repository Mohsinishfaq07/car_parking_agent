import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/globals/snack_bar.dart';
import '../../../authentication/login/data/modals/get_all_category_reponse_model.dart';
import '../../../authentication/login/domain/usecases/login_usecase.dart';

class DashboardProvider extends ChangeNotifier {
  bool htvSelected = false;
  bool ltvSelected = false;
  bool bikeSelected = false;
  // bool selectedVehicleId = false ;
  DashboardProvider(this._getAllCategoryUsecase);
  final GetAllCategoryUseCase _getAllCategoryUsecase;
  GetAllCategoryResponseModel? getAllCategoryResponseModel;
  ValueNotifier<bool> getAllCategoryLoadingNotifier = ValueNotifier(false);

  ValueNotifier<String> selectedVehicleId = ValueNotifier("");
  Future<void> getAllCategory() async {
    getAllCategoryLoadingNotifier.value = true;
    // final params = GetHistoryRequestModel();
    var loginEither = await _getAllCategoryUsecase(NoParams());
    if (loginEither.isLeft()) {
      handleError(loginEither);
      getAllCategoryLoadingNotifier.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        getAllCategoryLoadingNotifier.value = false;
        getAllCategoryResponseModel = response;
        // print(response);
        // Logger().i(response);
        //  userId = response.data.id;
        // Logger().i(getHistoryResponseModel!.checkInHistory);
      });
    }
  }

  // dashboardProvider.selectedId =  Id;

  String getSelectedVehicleType() {
    if (htvSelected) {
      return "HTV";
    }
    if (ltvSelected) {
      return "LTV";
    } else {
      return "BIKE";
    }
  }

  // changeVehicleType(String vehicleType) {
  //   selectedVehicle = vehicleType;
  //   notifyListeners();
  // }

  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}

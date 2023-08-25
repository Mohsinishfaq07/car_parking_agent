import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/get_all_category_reponse_model.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_request_model.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_response_modal.dart';
import 'package:sb_myreports/features/dashboard/data/models/get_qr_code_by_id_request_model.dart';
import 'package:sb_myreports/features/dashboard/data/models/success_response_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../dashboard/data/models/get_all_history_response_model.dart';
import '../../../../dashboard/data/models/get_my_history_response_model.dart';
import '../../data/modals/gen_qr_requestmodel.dart';
import '../../data/modals/gen_qr_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> loginUser(
      LoginRequestModel params);
  Future<Either<Failure, GetQrCodeByIdResponseModel>> getQrById(
      GetQrCodeByIdRequestModel params);
  Future<Either<Failure, GenerateQRResponseModel>> generateQR(
      GenerateQRRequestModel params);
  Future<Either<Failure, SuccessResponseModel>> checkIn(
      CheckInRequestModel params);
  Future<Either<Failure, SuccessResponseModel>> checkOut(
      CheckOutRequestModel params);
  Future<Either<Failure, GetAllHistoryResponseModel>> getHistory(
   NoParams  params);
  Future<Either<Failure, GetAllCategoryResponseModel>> getAllCategory(
      NoParams params);
  Future<Either<Failure, GetMyHistoryResponseModel>> getMyHistory(
      String params);

  // Future<Either<Failure, Get>> checkOut(CheckOutRequestModel params);
}

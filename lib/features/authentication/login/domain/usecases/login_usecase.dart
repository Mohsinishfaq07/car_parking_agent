import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/dashboard/data/models/get_qr_code_by_id_request_model.dart';
import 'package:sb_myreports/features/dashboard/data/models/success_response_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../dashboard/data/models/get_all_history_response_model.dart';
import '../../../../dashboard/data/models/get_my_history_response_model.dart';
import '../../data/modals/gen_qr_requestmodel.dart';
import '../../data/modals/gen_qr_response_model.dart';
import '../../data/modals/get_all_category_reponse_model.dart';
import '../../data/modals/login_request_model.dart';
import '../../data/modals/login_response_modal.dart';
import '../repository/auth_repo.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginRequestModel> {
  AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(
      LoginRequestModel params) async {
    return await repository.loginUser(params);
  }
}

class CheckOutUsecase
    extends UseCase<SuccessResponseModel, CheckOutRequestModel> {
  AuthRepository repository;
  CheckOutUsecase(this.repository);

  @override
  Future<Either<Failure, SuccessResponseModel>> call(
      CheckOutRequestModel params) async {
    return await repository.checkOut(params);
  }
}

class CheckInUsecase
    extends UseCase<SuccessResponseModel, CheckInRequestModel> {
  AuthRepository repository;
  CheckInUsecase(this.repository);

  @override
  Future<Either<Failure, SuccessResponseModel>> call(
      CheckInRequestModel params) async {
    return await repository.checkIn(params);
  }
}

class GetQrCodeByIdUsecase
    extends UseCase<GetQrCodeByIdResponseModel, GetQrCodeByIdRequestModel> {
  AuthRepository repository;
  GetQrCodeByIdUsecase(this.repository);

  @override
  Future<Either<Failure, GetQrCodeByIdResponseModel>> call(
      GetQrCodeByIdRequestModel params) async {
    return await repository.getQrById(params);
  }

}
class GenerateQRUsecase
    extends UseCase<GenerateQRResponseModel, GenerateQRRequestModel> {
  AuthRepository repository;
  GenerateQRUsecase(this.repository);

  @override
  Future<Either<Failure, GenerateQRResponseModel>> call(
      GenerateQRRequestModel params) async {
    return await repository.generateQR(params);
  }
}

class GetAllHistoryUseCase extends UseCase<GetAllHistoryResponseModel,  NoParams> {
  AuthRepository repository;
  GetAllHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, GetAllHistoryResponseModel>> call(
       NoParams params) async {
    return await repository.getHistory(params);
  }
}
class GetMyHistoryUseCase extends UseCase<GetMyHistoryResponseModel,  String> {
  late AuthRepository repository;
  GetMyHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, GetMyHistoryResponseModel>> call(
       String params) async {
    return await repository.getMyHistory(params);
  }
}
class GetAllCategoryUseCase extends UseCase<GetAllCategoryResponseModel, NoParams> {
  AuthRepository repository;
  GetAllCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, GetAllCategoryResponseModel>> call(
      NoParams params) async {
    return  repository.getAllCategory(params);
  }
}


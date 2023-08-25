import 'dart:async';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/usecases/usecase.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_request_model.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_response_modal.dart';
import 'package:sb_myreports/features/dashboard/data/models/success_response_model.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/modals/error_response_model.dart';
import '../../../../../core/utils/constants/app_messages.dart';
import '../../../../../core/utils/constants/app_url.dart';
import '../../../../dashboard/data/models/get_all_history_response_model.dart';
import '../../../../dashboard/data/models/get_my_history_response_model.dart';
import '../../../../dashboard/data/models/get_qr_code_by_id_request_model.dart';
import '../modals/gen_qr_requestmodel.dart';
import '../modals/gen_qr_response_model.dart';
import '../modals/get_all_category_reponse_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> loginUser(LoginRequestModel params);
  Future<GetQrCodeByIdResponseModel> getQrById(
      GetQrCodeByIdRequestModel params);
  Future<SuccessResponseModel> checkIn(CheckInRequestModel params);
  Future<SuccessResponseModel> checkOut(CheckOutRequestModel params);
  Future<GenerateQRResponseModel> generateQR(GenerateQRRequestModel params);
  Future<GetAllHistoryResponseModel> getAllHistory(NoParams noParams);
  Future<GetMyHistoryResponseModel> getMyHistory(String id);
  Future<GetAllCategoryResponseModel> getAllCategory(NoParams);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  @override
  Future<LoginResponseModel> loginUser(LoginRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.logInUpUrl;

    try {
      final response = await dio.post(url, data: params.toJson());

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        // Logger().i(response.data);
        var object = LoginResponseModel.fromJson(response.data);
        // print("great u have come");

        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<SuccessResponseModel> checkIn(CheckInRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.checkInUrl;
    Logger().v(params.toJson());

    try {
      final response = await dio.post(url, data: params.toJson());

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        return SuccessResponseModel(message: "Successful");
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<SuccessResponseModel> checkOut(CheckOutRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.checkoutUrl;
    Logger().v(url);

    Logger().v(params.toJson());
    try {
      final response = await dio.post(url, data: params.toJson());

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        return SuccessResponseModel(message: "Successful");
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GenerateQRResponseModel> generateQR(
      GenerateQRRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.generateQRUrl;
    Logger().v(url);

    try {
      final response = await dio.post(url, data: params.toJson());

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);
      Logger().v(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return GenerateQRResponseModel.fromJson(response.data);
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GetQrCodeByIdResponseModel> getQrById(
      GetQrCodeByIdRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.qrCodeById;
    Logger().v(url);

    try {
      final response = await dio.post(url, data: {"qrId": params.qrId});

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);
      Logger().v(response.data);
      if (response.statusCode == 200) {
        // var object = GetPaymentRateListResponse.fromJson(jsonResponse);

        return GetQrCodeByIdResponseModel.fromJson(response.data);
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GetAllHistoryResponseModel> getAllHistory(NoParams no) async {
    String url = AppUrl.baseUrl + AppUrl.getAllHistoryUrl;
    // Logger().v(url);

    try {
      final response = await dio.get(url);

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);
      // Logger().v(response.data);
      if (response.statusCode == 200) {
        // print("In data source");
        // Logger().i(response.data);
        // print(response.data);
        // print(response.headers);
        var object = GetAllHistoryResponseModel.fromJson(response.data);
        //  print("data source");
        //  return  GetHistoryResponseModel.fromJson(json.decode(response.data));
        //  print("data source");
         //print(object.checkIns.first);



         // print(GetAllHistoryResponseModel.fromJson(response.data));
         // print(object.checkOuts);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
       // Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {

        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
  @override
  Future<GetMyHistoryResponseModel> getMyHistory(String id) async {
    String url = AppUrl.baseUrl + AppUrl.getMyHistoryUrl + "userId=" + id  ;
    // Logger().v(url);
    print("yhis is my history url ");
    print(url);
    try {
      final response = await dio.get(url);
      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);
      // Logger().v(response.data);
      if (response.statusCode == 200) {

        print("In Mydata source");
        Logger().i(response.data);
        print(response.data);
        // print(response.headers);
        var object = GetMyHistoryResponseModel.fromJson(response.data);
         print("data source is correct ");
        //  return  GetHistoryResponseModel.fromJson(json.decode(response.data));
        //  print("data source");
         //print(object.checkIns.first);



         // print(GetMyHistoryResponseModel.fromJson(response.data));
         // print(object.checkOuts);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
       // Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {

        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GetAllCategoryResponseModel> getAllCategory(NoParams) async {
    String url = AppUrl.baseUrl + AppUrl.getAllCategoryUrl;
    // Logger().v(url);

    try {
      final response = await dio.get(url);

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);
      Logger().v(response.data);
      if (response.statusCode == 200) {
        var object =
            GetAllCategoryResponseModel.fromJson({"data": response.data});

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().v(exception.response!.data);
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}

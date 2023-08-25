import 'package:dartz/dartz.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_request_model.dart';
import 'package:sb_myreports/features/authentication/login/data/modals/login_response_modal.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/sign_up_response_model.dart';

abstract class SignUpRepository {

  Future<Either<Failure, SignUpResponseModel>> signUpUser(SignUpRequestModel params);


}

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../login/domain/repository/auth_repo.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/sign_up_response_model.dart';
import '../repositories/sign_up_repository.dart';


class SignUpUsecase extends UseCase<SignUpResponseModel, SignUpRequestModel> {
  SignUpRepository repository;
  SignUpUsecase(this.repository);

  @override
  Future<Either<Failure, SignUpResponseModel>> call(SignUpRequestModel params) async {
    return await repository.signUpUser(params);
  }
}

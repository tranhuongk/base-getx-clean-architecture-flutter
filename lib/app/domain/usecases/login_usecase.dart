import 'package:dartz/dartz.dart';

import '../../../common/network/api_error.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  Future<Either<APIErrors, Map<String, String>>> call({
    required String username,
    required String password,
  }) async {
    return await repository.login(username, password);
  }
}

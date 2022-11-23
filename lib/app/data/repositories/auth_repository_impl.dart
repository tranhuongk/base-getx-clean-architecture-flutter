import 'package:dartz/dartz.dart';
import '../../../common/network/api_error.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/remote_data/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<APIErrors, Map<String, String>>> login(
    String username,
    String password,
  ) async {
    try {
      final body = await AuthAPI.login(username, password).request();
      return Right(Map<String, String>.from(body));
    } on APIErrors catch (error) {
      return Left(error);
    }
  }
}
